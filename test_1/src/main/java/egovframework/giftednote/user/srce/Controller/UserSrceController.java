package egovframework.giftednote.user.srce.Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.giftednote.user.exploring.model.UserExploringVo;
import egovframework.giftednote.user.record.model.UserRecordVo;
import egovframework.giftednote.user.srce.Service.UserSrceService;
import egovframework.giftednote.user.srce.model.UserSrceVo;

@Controller
public class UserSrceController {
	@Autowired
	UserSrceService userSrceService;
	
	@RequestMapping(value="/srce/srce.do" , method = RequestMethod.GET)
	public ModelAndView Srce(@ModelAttribute("UserSrceVo") UserSrceVo UserSrceVo,HttpServletRequest request, HttpServletResponse response){
		UserSrceVo.setLab_id(request.getParameter("lab_id"));
		
		ModelMap model = new ModelMap();
		String lab_id = UserSrceVo.getLab_id();
		model = userSrceService.getList(UserSrceVo);
		model.put("lab_id", lab_id);
		
		return new ModelAndView("/user/srce/srce","model",model);
	}
	@RequestMapping(value="/srce/srce.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	@ResponseBody
	public String SrceAJAX(@ModelAttribute("UserSrceVo") UserSrceVo UserSrceVo,HttpServletRequest request, HttpServletResponse response)throws JsonProcessingException {
		List<?> list = userSrceService.getListAJAX(UserSrceVo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	
	@RequestMapping(value="/srce/setInsert.do", method = RequestMethod.POST)
	public void SrceInsert(@ModelAttribute("UserSrceVo") UserSrceVo UserSrceVo,HttpServletRequest request, HttpServletResponse response) {
		userSrceService.setInsert(UserSrceVo);
	}
	
	@RequestMapping(value="/srce/setUpdate.do", method = RequestMethod.POST)
	public void SrceUpdate(@ModelAttribute("UserSrceVo") UserSrceVo UserSrceVo,HttpServletRequest request, HttpServletResponse response) {
		userSrceService.setUpdate(UserSrceVo);
	}
	
	@RequestMapping(value = "/user/SrceExcelDown.do" , method = RequestMethod.GET)
	public void RecordExcelDown(@ModelAttribute("UserSrceVo") UserSrceVo UserSrceVo , HttpServletRequest request , HttpServletResponse response) throws IOException{
	
		UserSrceVo.setLab_id("535");;
		
		ModelMap model = new ModelMap();
		
		
		
		model = userSrceService.getTeamList(UserSrceVo);
		
		List<?> TeamList = (List<HashMap>) model.get("TeamList");
		
		
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("학생역량연구평가");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		int WidthCnt = 0;
		
		/*
		for (WidthCnt = 0; WidthCnt < 10; WidthCnt++) {
			sheet.setColumnWidth(WidthCnt, 5000);
		}
		*/
		
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
		
		CellStyle centerStyle = wb.createCellStyle();
		centerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		
		//열시작, 열종료, 행시작, 행종료 (자바배열과 같이 0부터 시작)
		
		sheet.addMergedRegion(new CellRangeAddress(1,6,0,0));
		sheet.addMergedRegion(new CellRangeAddress(1,2,1,1));
		sheet.addMergedRegion(new CellRangeAddress(3,4,1,1));
		sheet.addMergedRegion(new CellRangeAddress(5,6,1,1));
	
		sheet.addMergedRegion(new CellRangeAddress(7,12,0,0));
		sheet.addMergedRegion(new CellRangeAddress(7,8,1,1));
		sheet.addMergedRegion(new CellRangeAddress(9,10,1,1));
		sheet.addMergedRegion(new CellRangeAddress(11,12,1,1));
		
		sheet.addMergedRegion(new CellRangeAddress(13,18,0,0));
		sheet.addMergedRegion(new CellRangeAddress(13,14,1,1));
		sheet.addMergedRegion(new CellRangeAddress(15,16,1,1));
		sheet.addMergedRegion(new CellRangeAddress(17,18,1,1));
		
		sheet.addMergedRegion(new CellRangeAddress(19,24,0,0));
		sheet.addMergedRegion(new CellRangeAddress(19,20,1,1));
		sheet.addMergedRegion(new CellRangeAddress(21,22,1,1));
		sheet.addMergedRegion(new CellRangeAddress(23,24,1,1));
		
		
		int columnCnt = 0;
		row = sheet.createRow(rowNo++);
		
		cell = row.createCell(columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("구분");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("연구역량");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("평가 문항");
	    
	    for(int i = 0; i < TeamList.size(); i ++) {
	    	HashMap TeamName = (HashMap) TeamList.get(i);
	    	System.out.println(TeamName.get("std_name"));
	    	
	    	System.out.println(String.valueOf(TeamName.get("std_name")));
	    	
	    	cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue(TeamName.get("std_name")+"");
	    	
	    }
	    
	    
	    //1
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellStyle(centerStyle);
	    cell.setCellValue("기초역량");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("연구 윤리");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("참고 문헌과 인용표기를 표준 형식에 따라 표기할 수 있는가?");
	    
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실험결과와 데이터, 통계를 위조, 변조하지 않고 정확하게 기술할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실험실 안전");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실험실에서 응급상황이 생겼을 때 대처 방법을 알고 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실험 후, 정리 정돈과 청결 상태를 잘 유지할 수 있는가?");

	    columnCnt = 0;
	    
	    
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("소통 능력");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("지도교수 및 멘토, 동료들과 꾸준히 대화하여 연구 수행결과를 증진하기 위해 노력할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("지도교수 및 멘토, 동료에게 연구에 대한 의견을 적극적으로 제시할 수 있는가?");
	    
	    //2
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellStyle(centerStyle);
	    cell.setCellValue("사전연구");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("주제 파악");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("멘토의 연구 분야에 관한 내용과 연구주제를 파악할 수 있는가?");
	    
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("멘토의 연구 분야와 관련된 연구주제를 조사할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("전공 지식 함양");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("각 연구 주제별로 장단점을 적절하게 파악할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실험 기기(도구)의 용도를 정확하게 조사하고, 실험에 사용되는 핵심 기기(도구)를 잘 다룰 수 있는가?");

	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실험설계");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("변인통제 계획에 맞는 통제변인, 조작변인, 종속 변인을 설정할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("변인 간의 관계를 파악하고, 실험(연구) 상황에서 변인을 통제할 수 있는가?");
	    
	    //3
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellStyle(centerStyle);
	    cell.setCellValue("집중연구");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실험수행");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("연구주제를 해결할 수 있는 세부 실험주제를 설정할 수 있는가?");
	    
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실제로 실험(연구)에 사용될 준비물과 기초자료를 제시할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("데이터 정리와 분석");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("연구주제, 준비물, 실험 결과를 정리할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("날짜별(회차별) 관찰/실험기록을 연구 노트에 작성할 수 있는가?");

	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("오류 판단");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실험과정과 결과에 대하여 지속적으로 비판적인 검토를 할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("멘토의 피드백을 고려하여 실험을 진행할 수 있는가?");
	    
	    //4
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellStyle(centerStyle);
	    cell.setCellValue("사후연구");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("결과 해석");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("각 데이터를 적절하게 해석할 수 있는가?");
	    
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("실험 결과에 타당한 결론을 도출할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("표현 능력");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("데이터에 대한 설명을 간결하고, 이해하기 쉽게 작성할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("데이터를 시각적으로 잘 전달할 수 있도록 자료를 가공할 수 있는가?");

	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("발표 능력");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("연구 결과를 논리적으로 잘 설명할 수 있는가?");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue("연구의 가치, 유용성, 기대효과 등을 설명할 수 있는가?");
	    
	    /*
		for(int i = 0; i < TeamListSize; i++) {
			HashMap TeamListMap = TeamList.get(i);
			
			
			cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue(TeamListMap.get("NAME")+"");
		}
		
		
		
	    /*
	    for(int i = 0; i < DayList.size(); i ++) {
	    	columnCnt = 0;
    	    row = sheet.createRow(rowNo++);
	    	
	    	System.out.println("====excel=="+i+"/"+DayList.size());
	    	HashMap DayListMap = (HashMap) DayList.get(i);
	    	System.out.println("===3=====");
	    	cell = row.createCell(columnCnt);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(i+1);
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(DayListMap.get("CLASS_TM")+"");
	    	
	    	String Class_tm =String.valueOf(DayListMap.get("CLASS_TM"));
	    	
	    	cell = row.createCell(++columnCnt);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(DayListMap.get("CREATE_TM")+"");
	    	
		    for(int j = 0; j < TeamListSize; j ++) {
		    	System.out.println("=====4=====");
		    	List<HashMap> ScoreList = (List<HashMap>) map.get("ScoreList"+j+"");
		    	System.out.println("=====5==== : " + j);
		    	System.out.println("ScoreList : "+ScoreList.size());
		    	HashMap ScoreMap = ScoreList.get(i);
		    	System.out.println("=====6====");
		    	cell = row.createCell(++columnCnt);
			    cell.setCellStyle(bodyStyle);
			    cell.setCellValue(ScoreMap.get("SCORE_JOIN")+"");
			    System.out.println("======7=====");
			    cell = row.createCell(++columnCnt);
			    cell.setCellStyle(bodyStyle);
			    cell.setCellValue(ScoreMap.get("SCORE_UPTAKE")+"");
		    }
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(DayListMap.get("RECORD")+"");
		    
	    }
	   
	    
	    */
	    /*
		response.setContentType("ms-vnd/excel");
	    String excel_name_is = "학생연구역량평가";
	    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");

	    System.out.println("???");

	    // 엑셀 출력

	    wb.write(response.getOutputStream());

	    wb.close();
		
		
		/*
		response.setContentType("text/html; charset=euc-kr");
		response.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('엑셀 다운로드가 완료되었습니다.')</script>");
		out.flush();
		*/
		
		
	}
	
	
	
	
}
