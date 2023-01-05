package egovframework.giftednote.admin.member.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.giftednote.admin.member.Model.AdminMemberVo;
import egovframework.giftednote.admin.member.Service.AdminMemberService;
import egovframework.giftednote.user.member.model.UserMemberVo;

@Controller
public class AdminMemberController {
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	
	@Autowired
	AdminMemberService adminMemberService;
	
	
	@RequestMapping(value="/admin/member/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminMemberList(@ModelAttribute("AdminMemberVo") AdminMemberVo AdminMemberVo ,HttpServletRequest request, HttpServletResponse response) {
		String PAGE = request.getParameter("PAGE") != null ? request.getParameter("PAGE") : "0";
	    String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request.getParameter("ITEM_COUNT") : "10";
	    if (PAGE == null) {
	      PAGE = "0";
	    }
	    if (ITEM_COUNT == null) {
	      ITEM_COUNT = "10";
	    }
	    AdminMemberVo.setPAGE(Integer.parseInt(PAGE));
	    AdminMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
	    ModelMap model = new ModelMap();
	    
	    int pagelimit = AdminMemberVo.getPAGE() * AdminMemberVo.getITEM_COUNT();
	    
	    AdminMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
	    AdminMemberVo.setOFFSET(pagelimit);
	    System.out.println(AdminMemberVo.getPAGE());
	    System.out.println(AdminMemberVo.getLIMIT());
	    System.out.println(AdminMemberVo.getOFFSET());
	    
	    model = this.adminMemberService.getALLList(AdminMemberVo);
	    
	    model.put("beforeDomain", AdminMemberVo);
	    
	    return new ModelAndView("admin/member/list", "model", model);
	}
	
	@RequestMapping(value="/admin/member/update.do" , method = RequestMethod.POST)
	public void AdminMemberUpdate(@ModelAttribute("AdminMemberVo") AdminMemberVo AdminMemberVo,HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminMemberService.setMember(AdminMemberVo);
	    response.getWriter().println("true");
	    
	}
	
	@RequestMapping(value="/admin/member/delete.do" , method = RequestMethod.POST)
	public void AdminMemberDelete(@ModelAttribute("AdminMemberVo")AdminMemberVo AdminMemberVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMemberService.setDelete(AdminMemberVo);
		
	}
	
	@RequestMapping(value="/admin/member/insert.do" , method = RequestMethod.GET)
	public String AdminMemberInsert(@ModelAttribute("AdminMemberVo")AdminMemberVo AdminMemberVo , HttpServletRequest request , HttpServletResponse response) {
		return "admin/member/insert";
	}
	
	@RequestMapping(value="/admin/member/IdCheck.do" , method = RequestMethod.POST)
	@ResponseBody
	public void AdminMemberIdCheck(@ModelAttribute("AdminMemberVo")AdminMemberVo AdminMemberVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		int result = adminMemberService.IdCheck(AdminMemberVo);
	    System.out.println(result);
	    if (result == 1)
	    {
	      PrintWriter out = response.getWriter();
	      out.println(false);
	    }
	    else if (result == 0)
	    {
	      PrintWriter out = response.getWriter();
	      out.println(true);
	    }
	    else
	    {
	      PrintWriter out = response.getWriter();
	      out.println("오류");
	    }
		
	}
	
	@RequestMapping(value="/admin/member/excelMemberUpload.do" , method = RequestMethod.POST)
	public String excelPost(MultipartHttpServletRequest request , HttpServletResponse response) {
		
		String drv = request.getRealPath("");
	    drv = drv.substring(0, drv.length()) + "./resources" + request.getContextPath() + "/upload/member/";
	    System.out.println(drv);
	    String filename = SUtil.setFileUpload(request, drv);
	    
	    filename = URLDecoder.decode(filename, "utf-8");
	    
	    ModelMap model = new ModelMap();
	    try
	    {
	      FileInputStream fis = new FileInputStream(drv + filename);
	      HSSFWorkbook workbook = new HSSFWorkbook(fis);
	      HSSFSheet sheet = workbook.getSheetAt(0);
	      int rows = sheet.getPhysicalNumberOfRows();
	      for (int rowIndex = 2; rowIndex < rows; rowIndex++)
	      {
	        HSSFRow row = sheet.getRow(rowIndex);
	        if (row != null)
	        {
	          int cells = row.getPhysicalNumberOfCells();
	          AdminMemberVo vo = new AdminMemberVo();
	          for (int columnIndex = 0; columnIndex <= 7; columnIndex++)
	          {
	            HSSFCell cell = row.getCell(columnIndex);
	            String value = "";
	            try
	            {
	              switch (cell.getCellType())
	              {
	              case 0: 
	                value = (int)cell.getNumericCellValue()+"";
	                break;
	              case 1: 
	                value = cell.getStringCellValue();
	                break;
	              case 3: 
	                value = cell.getBooleanCellValue()+"";
	                break;
	              case 5: 
	                value = cell.getErrorCellValue()+"";
	              }
	            }
	            catch (NullPointerException e)
	            {
	              try
	              {
	                value = cell.getStringCellValue();
	              }
	              catch (NullPointerException e1)
	              {
	                value = "";
	              }
	            }
	            System.out.println(value);
	            if (columnIndex == 0)
	            {
	              value = value.replace(" ", "");
	              vo.setEMAIL(value);
	            }
	            else if (columnIndex == 1)
	            {
	              vo.setNAME(value);
	            }
	            else if (columnIndex == 2)
	            {
	              value = value.replace("-", "");
	              vo.setPHONE(value);
	              if (value.length() == 8)
	              {
	                System.out.println(value.length());
	                vo.setPASSWORD(value);
	              }
	              else
	              {
	                System.out.println(value);
	                value = "note1234";
	                vo.setPASSWORD(value);
	              }
	            }
	            else if (columnIndex == 3)
	            {
	              vo.setADDRESS(value);
	            }
	            else if (columnIndex == 4)
	            {
	              vo.setBIRTH(value);
	            }
	            else if (columnIndex == 5)
	            {
	              vo.setSCHOOL_NAME(value);
	            }
	            else if (columnIndex == 6)
	            {
	              vo.setSCHOOL_YEAR(value);
	            }
	            else if (columnIndex == 7)
	            {
	              vo.setLEVEL(value);
	            }
	          }
	          int result = this.adminMemberService.IdCheck(vo);
	          if (result == 0)
	          {
	            this.adminMemberService.SetInsert(vo);
	            System.out.println("회원 추가 : " + vo.getEMAIL() + "이름 : " + vo.getNAME());
	          }
	          else if (result == 1)
	          {
	            this.adminMemberService.setMember(vo);
	            System.out.println("회원 업데이트 : " + vo.getEMAIL() + "이름 : " + vo.getNAME());
	          }
	          else
	          {
	            System.out.println("회원 추가 실패");
	          }
	        }
	      }
	    }
	    catch (IOException e)
	    {
	      e.printStackTrace();
	    }
	    return "redirect:./list.do";
		
	}
	
	@RequestMapping(value="/admin/member/excelDown.do" , method = RequestMethod.GET)
	public void excelDown(@ModelAttribute("AdminMemberVo")AdminMemberVo AdminMemberVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	    
	    model = adminMemberService.getALLMEMBER();
	    
	    List<HashMap> list = (List)model.get("list");
	    
	    Workbook wb = new HSSFWorkbook();
	    
	    Sheet sheet = wb.createSheet("회원리스트");
	    
	    Row row = null;
	    
	    Cell cell = null;
	    
	    int rowNo = 0;
	    
	    int WidthCnt = 0;
	    for (WidthCnt = 0; WidthCnt < 7; WidthCnt++) {
	      sheet.setColumnWidth(WidthCnt, 6000);
	    }
	    sheet.setColumnWidth(3, 12000);
	    
	    CellStyle headStyle = wb.createCellStyle();
	    
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    
	    CellStyle bodyStyle = wb.createCellStyle();
	    
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    
	    int columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("아이디");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("핸드폰");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("생년월일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학년");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("권한");
	    for (int i = 0; i < list.size(); i++)
	    {
	      System.out.println("----excel --- + " + i + " / " + list.size());
	      
	      HashMap tempMap = (HashMap)list.get(i);
	      
	      columnCnt = 0;
	      row = sheet.createRow(rowNo++);
	      
	      cell = row.createCell(0);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("EMAIL")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("NAME")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("PHONE")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("ADDRESS")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("BIRTH")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("SCHOOL_YEAR")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (tempMap.get("LEVEL") == "1") {
	        cell.setCellValue("학생");
	      } else if (tempMap.get("LEVEL") == "2") {
	        cell.setCellValue("교수");
	      } else {
	        cell.setCellValue("관리자");
	      }
	      System.out.println("----excel --- + " + i);
	    }
	    Date today = new Date();
	    System.out.println(today);
	    SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
	    
	    String sttoday = date.format(today);
	    
	    response.setContentType("ms-vnd/excel");
	    
	    response.setHeader("Content-Disposition", "attachment;filename=KAIST_NOTE_MEMBER_" + sttoday + ".xls");
	    try
	    {
	      wb.write(response.getOutputStream());
	      wb.close();
	    }
	    catch (IOException e)
	    {
	      e.printStackTrace();
	    }
		
	}
	
	@RequestMapping(value="/admin/member/login.do" , method = RequestMethod.GET)
	public ModelAndView AdminMemberLogin(@ModelAttribute("AdminMemberVo")AdminMemberVo AdminMemberVo , HttpServletRequest request , HttpServletResponse response) {
		
		AdminMemberVo.setUr_userid(request.getParameter("user_id"));
	    
	    HttpSession session = request.getSession();
	    String PAGE = request.getParameter("PAGE") != null ? request.getParameter("PAGE") : "0";
	    String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request.getParameter("ITEM_COUNT") : "10";
	    if (PAGE == null) {
	      PAGE = "0";
	    }
	    if (ITEM_COUNT == null) {
	      ITEM_COUNT = "10";
	    }
	    AdminMemberVo.setPAGE(Integer.parseInt(PAGE));
	    AdminMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
	    ModelMap model = new ModelMap();
	    
	    int pagelimit = AdminMemberVo.getPAGE() * AdminMemberVo.getITEM_COUNT();
	    
	    AdminMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
	    AdminMemberVo.setOFFSET(pagelimit);
	    System.out.println(AdminMemberVo.getPAGE());
	    System.out.println(AdminMemberVo.getLIMIT());
	    System.out.println(AdminMemberVo.getOFFSET());
	    
	    model = this.adminMemberService.getALLList(AdminMemberVo);
	    model.put("beforeDomain", AdminMemberVo);
	    
	    return new ModelAndView("admin/member/list", "model", model);
		
	}
	

}
