package egovframework.kaist.admin.member_re.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.system.util.SUtil;

import egovframework.kaist.admin.buseo.service.AdminBuseoService;
import egovframework.kaist.admin.config.service.AdminConfigService;
import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.dcmnt.service.AdminDcmntService;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReStatVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.admin.member_re.service.AdminMemberReService;
import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;

@Controller
public class AdminMemberReController {

	@Autowired
	AdminMemberReService adminMember_reService;

	@Autowired
	AdminDcmntService adminDcmntService;
	
	@Autowired
	AdminBuseoService adminBuseoService;
	
	@Autowired
	AdminConfigService adminConfigService;
	
	@Autowired
	AdminSmsLogService adminSmsLogService;
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminMemberReController.class);
	
	@RequestMapping(value = "/admin/member_re/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminMember_reVo") AdminMemberReVo adminMember_reVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
			
		if(PAGE == null)
		{
			PAGE = "0";
		}
		
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}

		adminMember_reVo.setPAGE(Integer.parseInt(PAGE));
		adminMember_reVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMember_reVo.getPAGE() * adminMember_reVo.getITEM_COUNT();
		
		adminMember_reVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMember_reVo.setOFFSET(pagelimit);
		
		model = adminMember_reService.getList(adminMember_reVo);
		
		
		model.put("SEARCH_TYPE", adminMember_reVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMember_reVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminMember_reVo);

		return new ModelAndView("admin/member_re/list", "model", model);
	}
	
	@RequestMapping(value = "/admin/member_re/{idx}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("idx") String idx, HttpServletRequest request, HttpServletResponse response) {

		System.out.println(idx);
		
		ModelMap model = new ModelMap();

		model = adminMember_reService.getView(idx);
		
		model.put("buseo", adminBuseoService.getListAll());
		return new ModelAndView("admin/member_re/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/member_re/{idx}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("idx") String idx, @ModelAttribute("AdminMember_reVo") AdminMemberReVo adminMember_reVo, String MCP, MultipartHttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
		
		ModelMap model = new ModelMap();
		//여기에 문자
		AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
		userSmsLogDomain.setMEMBER_ID(SUtil.getUserId(request));

		String phone = "";
		String id = adminMember_reVo.getNAME();
		String pw = adminMember_reVo.getTEACHER_PASS();
		System.out.println(pw);
		System.out.println(id);
		System.out.println(MCP);
		if(MCP.equals("1")) {
			phone = adminMember_reVo.getTEACHER_PHONE();
			userSmsLogDomain.setPHONE(phone);
			userSmsLogDomain.setTYPE("0");
			userSmsLogDomain.setMESSAGE(id + "학생이 2021년 영재키움프로젝트 신입생 지원을 넣었습니다. \n멘토분의 비밀번호는" + pw + "입니다.\n1.http://www.giftedup.org/ 홈페이지에 접속\n2.선발 > 지원서/합격자 조회메뉴 클릭.\n3.학생 지원서 조회 > 멘토 교사 체크 > 학생명,비밀번호 입력\n4.하단 멘토 교사 지원서 작성");
			userSmsLogDomain.setRESERVATION("");
			userSmsLogDomain.setRESERVATION_TM(SUtil.getNowDateTime());
			userSmsLogDomain.setSMS_TYPE("L");
			String message = userSmsLogDomain.getMESSAGE();
			System.out.println("멘토 연락처" + phone);
			System.out.println("멘토에게 보낼 메세지" + userSmsLogDomain.getMESSAGE());
			adminSmsLogService.smsSend(userSmsLogDomain);
		}
		System.out.println(adminMember_reVo.getTEACHER_PHONE());
		adminMember_reVo.setIDX(idx);
		adminMember_reService.setUpdate(adminMember_reVo);
		return "redirect:../list.do"; 
	}
	
	
	@RequestMapping(value = "/admin/member_re/TypeToTextUpdateArr.do", method = RequestMethod.POST)
	public void statusUpdateArr(@ModelAttribute("AdminMemberReVo") AdminMemberReVo adminAgencyVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminAgencyVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminMemberReVo adminMember_reDomain = new AdminMemberReVo();
				adminMember_reDomain.setIDX(arrIdx[i]);
				adminMember_reDomain.setSEARCH_TYPE(adminAgencyVo.getSEARCH_TYPE());
				adminMember_reDomain.setSEARCH_TEXT(adminAgencyVo.getSEARCH_TEXT());
				adminMember_reService.setUpdateTypeToText(adminMember_reDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	//서류 관리
	@RequestMapping(value="/admin/member_re/dcmnt.do" , method = RequestMethod.GET)
	public ModelAndView Dcmnt_list(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		model = adminDcmntService.getDcmntList(Dcmnt_Vo);
		model.put("beforeDomain", Dcmnt_Vo);
		return new ModelAndView("/admin/member_re/dcmnt","model",model);
	}
	
	//서류 리스트 확인
	@RequestMapping(value = "/admin/member_re/Dcmnt_list.do",method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String dcmnt_list(@ModelAttribute("AdminMemberReVo") AdminMemberReVo adminMember_reVo, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException{
		
		List<?> checklist = adminDcmntService.getIdxCheck(adminMember_reVo);
		
		if(checklist.size() <= 0) {
			System.out.println(checklist);
			List<AdminDcmntVo> dcmntlist = adminMember_reService.getDcmnt(adminMember_reVo);
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(dcmntlist);
			return jsonStr;
		}else{
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(checklist);
			return jsonStr;
		}
	}
	
	
	//서류확인
	@RequestMapping(value = "/admin/member_re/DcmntUpdateArr.do", method = RequestMethod.POST)
	public ModelAndView dcmntUpdateArr(@PathVariable("dcmnt_check") String dcmnt_check, @ModelAttribute("AdminMember_reVo") AdminMemberReVo adminMember_reVo, HttpServletRequest request, HttpServletResponse response) {
			
		ModelMap model = new ModelMap();
		model = adminMember_reService.setDcmntUpdate(dcmnt_check);
		return new ModelAndView("admin/member_re/list", "model", model);
	}
	
	//서류 제출 확인 update
	@RequestMapping(value="/admin/member_re/Dcmnt_result_update.do" , method = RequestMethod.POST)
	public void dcmntresultupdate(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setUpdate(Dcmnt_Vo);
	}
	
	//서류 제출 확인 insert
	@RequestMapping(value="/admin/member_re/Dcmnt_result_insert.do" , method = RequestMethod.POST)
	public void dcmntresultinsert(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setInsert(Dcmnt_Vo);
	}
	
	
	//서류 제출 확인 출력 update
	@RequestMapping(value="/admin/member_re/Dcmnt_result_change.do" , method = RequestMethod.POST)
	public void Dcmnt_result_change(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminMember_reService.setDcmntCheck(Dcmnt_Vo);
	}
	
	
	
	
	//서류 update
	@ResponseBody
	@RequestMapping(value="/admin/member_re/dcmnt_update.do" , method = RequestMethod.POST)
	public void dcmnt_update(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setDcmntUpdate(Dcmnt_Vo);
	}
	
	//서류 delete
	@ResponseBody
	@RequestMapping(value="/admin/member_re/dcmnt_delete.do" , method = RequestMethod.POST)
	public void dcmnt_delete(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setDcmntDelete(Dcmnt_Vo);
	}
	
	//서류 insert
	@ResponseBody
	@RequestMapping(value="/admin/member_re/dcmnt_insert.do" , method = RequestMethod.POST)
	public void dcmnt_insert(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setDcmntInsert(Dcmnt_Vo);
	}
	
	//마감
	@RequestMapping(value="/admin/member_re/AllComplete.do",method = RequestMethod.POST)
	public void AllComplete(HttpServletRequest request,HttpServletResponse response) {
		adminMember_reService.setAllComplete();
	}
	
	
	
	//지원 현황 통계 표
	@RequestMapping(value = "/admin/member_re/member_re_to.do" , method = RequestMethod.GET)
	public ModelAndView Stat(@ModelAttribute("StatVo") AdminMemberReStatVo StatVo ,HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		model = adminMember_reService.getStat();
		
		return new ModelAndView("/admin/member_re/member_re_st","model", model);
	}
	
	//엑셀 출력
	//-------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/admin/member_re/excelDown.do", method = RequestMethod.GET)
	public void excelDown(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelMap map = adminMember_reService.getListAll();
		List<HashMap> list = (List<HashMap>) map.get("list");

	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("신입생 리스트");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
	    
	    int WidthCnt = 0;
	    
	    for(WidthCnt=0; WidthCnt < 31; WidthCnt++) {
	    	sheet.setColumnWidth(WidthCnt, 7000);
	    }
	    sheet.setColumnWidth(18, 11000);
	    sheet.setColumnWidth(25, 11000);
	    
	    CellStyle headStyle = wb.createCellStyle();
	    
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    
	    int columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("멘토교사확정여부");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("멘토교사명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("멘토교사성별");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("멘토교사생년월일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("멘토교사소속학교명");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("멘토교사 학교 시도명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("멘토교사 전공");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("멘토교사 연락처");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("멘토교사 이메일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학생명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("성별");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학년");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("반");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("소속학교명");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교급");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("생년월일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지역");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("우편번호");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("집주소");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("연락처");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("보호자 연락처");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일");
	  
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지원 유형");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지원 자격");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영재 교육 경험 여부");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영재 교육 경험 종류");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영재 교육 참여 기간");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("평가점수");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("서류 확인");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("결과");
	    
	    for(int i = 0; i < list.size(); i++ )
	    {
	    	
	    	System.out.println("----excel----"+i+"/"+list.size());
	    	
	    	HashMap tempMap = list.get(i);
	    	columnCnt = 0;
    	    row = sheet.createRow(rowNo++);

    	    cell = row.createCell(columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEACHER_TYPE")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEACHER_NAME")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEACHER_SEX")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEACHER_BIRTH")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEACHER_SCHOOL_NAME")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEACHER_SIDO_NAME")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEACHER_MAJOR")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEACHER_PHONE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEACHER_EMAIL")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("NAME")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SEX")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    
    	    String ss = tempMap.get("SCHOOL_YEAR")+"";
    	    if(ss == null)
    	    {
    	    	cell.setCellValue("");	
    	    }else if(ss.equals("4"))
    	    {
    	    	cell.setCellValue("초등학교4학년");
    	    }else if(ss.equals("5"))
    	    {
    	    	cell.setCellValue("초등학교5학년");
    	    }else if(ss.equals("6"))
    	    {
    	    	cell.setCellValue("초등학교6학년");
    	    }else if(ss.equals("7"))
    	    {
    	    	cell.setCellValue("중학교1학년");
    	    }else if(ss.equals("8"))
    	    {
    	    	cell.setCellValue("중학교2학년");
    	    }else if(ss.equals("9"))
    	    {
    	    	cell.setCellValue("중학교3학년");
    	    }else if(ss.equals("10"))
    	    {
    	    	cell.setCellValue("고등학교1학년");
    	    }else if(ss.equals("11"))
    	    {
    	    	cell.setCellValue("고등학교2학년");
    	    }else if(ss.equals("12"))
    	    {
    	    	cell.setCellValue("고등학교3학년");
    	    }
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SCHOOL_GROUP")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SCHOOL_TYPE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("BIRTH")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    String lc = tempMap.get("ADDRESS_LOCAL")+"";
    	    if(lc == null)
    	    {
    	    	cell.setCellValue("");	
    	    }else if(lc.equals("서울"))
    	    {
    	    	cell.setCellValue("서울");
    	    }else if(lc.equals("경기"))
    	    {
    	    	cell.setCellValue("경기");
    	    }else if(lc.equals("인천"))
    	    {
    	    	cell.setCellValue("인천");
    	    }else if(lc.equals("강원"))
    	    {
    	    	cell.setCellValue("강원");
    	    }else if(lc.equals("대전"))
    	    {
    	    	cell.setCellValue("대전");
    	    }else if(lc.equals("세종"))
    	    {
    	    	cell.setCellValue("세종");
    	    }else if(lc.equals("충남"))
    	    {
    	    	cell.setCellValue("충남");
    	    }else if(lc.equals("충북"))
    	    {
    	    	cell.setCellValue("충북");
    	    }else if(lc.equals("광주"))
    	    {
    	    	cell.setCellValue("광주");
    	    }else if(lc.equals("전남"))
    	    {
    	    	cell.setCellValue("전남");
    	    }else if(lc.equals("전북"))
    	    {
    	    	cell.setCellValue("전북");
    	    }else if(lc.equals("부산"))
    	    {
    	    	cell.setCellValue("부산");
    	    }else if(lc.equals("경남"))
    	    {
    	    	cell.setCellValue("경남");
    	    }else if(lc.equals("대구"))
    	    {
    	    	cell.setCellValue("대구");
    	    }else if(lc.equals("경북"))
    	    {
    	    	cell.setCellValue("경북");
    	    }else if(lc.equals("제주"))
    	    {
    	    	cell.setCellValue("제주");
    	    }
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("ZIPCODE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("ADDRESS")+" " + tempMap.get("ADDRESS_DETAIL")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TEL")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("PHONE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("EMAIL")+"");
	    	
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SUPPORT_AREA")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("ELIGIBILITY")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("EXP")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("EXP_TYPE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("EXP_DATA")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SCORE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("DCMNT_CHECK")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    String rs = tempMap.get("RESULT")+"";
    	    if(rs == null)
    	    {
    	    	cell.setCellValue("대기");	
    	    }else if(rs.equals("pass"))
    	    {
    	    	cell.setCellValue("합격");
    	    }else if(rs.equals("fail"))
    	    {
    	    	cell.setCellValue("불합격");
    	    }else if(rs.equals("wating"))
    	    {
    	    	cell.setCellValue("대기");
    	    }
	    }
	    	

	    // 컨텐츠 타입과 파일명 지정

	    response.setContentType("ms-vnd/excel");
	    String excel_name_is = "신입생_리스트";
	    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");



	    // 엑셀 출력

	    wb.write(response.getOutputStream());

	    wb.close();


	}
	
	
	
	
	//합격자 엑셀 파일
	//-------------------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/admin/member_re/passExcelDown.do", method = RequestMethod.GET)
		public void passExcelDown(HttpServletRequest request, HttpServletResponse response) throws IOException {

			// 게시판 목록조회

			
			ModelMap map = adminMember_reService.getListPass();
			List<HashMap> list = (List<HashMap>) map.get("list");

		    // 워크북 생성

		    Workbook wb = new HSSFWorkbook();

		    Sheet sheet = wb.createSheet("신입생 합격자 리스트");

		    Row row = null;

		    Cell cell = null;

		    int rowNo = 0;

		    int WidthCnt = 0;
		    
		    for(WidthCnt=0; WidthCnt < 31; WidthCnt++) {
		    	sheet.setColumnWidth(WidthCnt, 7000);
		    }
		    sheet.setColumnWidth(18, 11000);
		    sheet.setColumnWidth(25, 11000);

		    // 테이블 헤더용 스타일

		    CellStyle headStyle = wb.createCellStyle();

		    // 가는 경계선을 가집니다.

		    headStyle.setBorderTop(BorderStyle.THIN);

		    headStyle.setBorderBottom(BorderStyle.THIN);

		    headStyle.setBorderLeft(BorderStyle.THIN);

		    headStyle.setBorderRight(BorderStyle.THIN);



		    // 배경색은 노란색입니다.

		    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);



		    // 데이터는 가운데 정렬합니다.

		    headStyle.setAlignment(HorizontalAlignment.CENTER);



		    // 데이터용 경계 스타일 테두리만 지정

		    CellStyle bodyStyle = wb.createCellStyle();

		    bodyStyle.setBorderTop(BorderStyle.THIN);

		    bodyStyle.setBorderBottom(BorderStyle.THIN);

		    bodyStyle.setBorderLeft(BorderStyle.THIN);

		    bodyStyle.setBorderRight(BorderStyle.THIN);



		    // 헤더 생성
		    int columnCnt = 0;
		    row = sheet.createRow(rowNo++);

		    
		    
		    cell = row.createCell(columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("멘토교사확정여부");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("멘토교사명");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("멘토교사성별");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("멘토교사생년월일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("멘토교사소속학교명");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("멘토교사 학교 시도명");
		    
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("멘토교사 전공");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("멘토교사 연락처");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("멘토교사 이메일");
		    
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학생명");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("성별");


		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학년");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("반");
		    
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("소속학교명");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교급");
		    
		    
		    
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("생년월일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지역");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("우편번호");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("연락처");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("보호자 연락처");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이메일");
		  

		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 유형");
		    
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 자격");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재 교육 경험 여부");
		    
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재 교육 경험 종류");
		    
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재 교육 참여 기간");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("평가점수");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("서류 확인");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("결과");
		    
		    
		    
		    
		    
		    
		    for(int i = 0; i < list.size(); i++ )
		    {
		    	HashMap tempMap = list.get(i);
		    	columnCnt = 0;
	    	    row = sheet.createRow(rowNo++);


	    	    cell = row.createCell(columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEACHER_TYPE")+"");
	    	    

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEACHER_NAME")+"");
	    	    

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEACHER_SEX")+"");
	    	    

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEACHER_BIRTH")+"");
	    	    

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEACHER_SCHOOL_NAME")+"");
	    	    

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEACHER_SIDO_NAME")+"");
	    	    

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEACHER_MAJOR")+"");
	    	    

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEACHER_PHONE")+"");
	    	    

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEACHER_EMAIL")+"");
	    	    
	    	    
	    	    
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("NAME")+"");
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SEX")+"");
	    	    
	    	    

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    
	    	    
	    	    String ss = tempMap.get("SCHOOL_YEAR")+"";
	    	    if(ss == null)
	    	    {
	    	    	cell.setCellValue("");	
	    	    }else if(ss.equals("4"))
	    	    {
	    	    	cell.setCellValue("초등학교4학년");
	    	    }else if(ss.equals("5"))
	    	    {
	    	    	cell.setCellValue("초등학교5학년");
	    	    }else if(ss.equals("6"))
	    	    {
	    	    	cell.setCellValue("초등학교6학년");
	    	    }else if(ss.equals("7"))
	    	    {
	    	    	cell.setCellValue("중학교1학년");
	    	    }else if(ss.equals("8"))
	    	    {
	    	    	cell.setCellValue("중학교2학년");
	    	    }else if(ss.equals("9"))
	    	    {
	    	    	cell.setCellValue("중학교3학년");
	    	    }else if(ss.equals("10"))
	    	    {
	    	    	cell.setCellValue("고등학교1학년");
	    	    }else if(ss.equals("11"))
	    	    {
	    	    	cell.setCellValue("고등학교2학년");
	    	    }else if(ss.equals("12"))
	    	    {
	    	    	cell.setCellValue("고등학교3학년");
	    	    }
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_GROUP")+"");


	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_TYPE")+"");
	    	    
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("BIRTH")+"");
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String lc = tempMap.get("ADDRESS_LOCAL")+"";
	    	    if(lc == null)
	    	    {
	    	    	cell.setCellValue("");	
	    	    }else if(lc.equals("서울"))
	    	    {
	    	    	cell.setCellValue("서울");
	    	    }else if(lc.equals("경기"))
	    	    {
	    	    	cell.setCellValue("경기");
	    	    }else if(lc.equals("인천"))
	    	    {
	    	    	cell.setCellValue("인천");
	    	    }else if(lc.equals("강원"))
	    	    {
	    	    	cell.setCellValue("강원");
	    	    }else if(lc.equals("대전"))
	    	    {
	    	    	cell.setCellValue("대전");
	    	    }else if(lc.equals("세종"))
	    	    {
	    	    	cell.setCellValue("세종");
	    	    }else if(lc.equals("충남"))
	    	    {
	    	    	cell.setCellValue("충남");
	    	    }else if(lc.equals("충북"))
	    	    {
	    	    	cell.setCellValue("충북");
	    	    }else if(lc.equals("광주"))
	    	    {
	    	    	cell.setCellValue("광주");
	    	    }else if(lc.equals("전남"))
	    	    {
	    	    	cell.setCellValue("전남");
	    	    }else if(lc.equals("전북"))
	    	    {
	    	    	cell.setCellValue("전북");
	    	    }else if(lc.equals("부산"))
	    	    {
	    	    	cell.setCellValue("부산");
	    	    }else if(lc.equals("경남"))
	    	    {
	    	    	cell.setCellValue("경남");
	    	    }else if(lc.equals("대구"))
	    	    {
	    	    	cell.setCellValue("대구");
	    	    }else if(lc.equals("경북"))
	    	    {
	    	    	cell.setCellValue("경북");
	    	    }else if(lc.equals("제주"))
	    	    {
	    	    	cell.setCellValue("제주");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ZIPCODE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS")+" " + tempMap.get("ADDRESS_DETAIL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EMAIL")+"");
		    	
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SUPPORT_AREA")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ELIGIBILITY")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_DATA")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCORE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("DCMNT_CHECK")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String rs = tempMap.get("RESULT")+"";
	    	    if(rs == null)
	    	    {
	    	    	cell.setCellValue("대기");	
	    	    }else if(rs.equals("pass"))
	    	    {
	    	    	cell.setCellValue("합격");
	    	    }else if(rs.equals("fail"))
	    	    {
	    	    	cell.setCellValue("불합격");
	    	    }else if(rs.equals("wating"))
	    	    {
	    	    	cell.setCellValue("대기");
	    	    }
		    }

		    // 컨텐츠 타입과 파일명 지정
		    response.setContentType("ms-vnd/excel");
		    String excel_name_is = "신입생_합격자_리스트.xls";
		    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
		    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is);

		    // 엑셀 출력
		    wb.write(response.getOutputStream());

		    wb.close();


		}


}
