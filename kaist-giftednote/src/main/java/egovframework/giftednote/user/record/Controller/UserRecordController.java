package egovframework.giftednote.user.record.Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.giftednote.user.member.model.UserMemberVo;
import egovframework.giftednote.user.note.model.UserNoteVo;
import egovframework.giftednote.user.record.Service.UserRecordService;
import egovframework.giftednote.user.record.model.UserRecordVo;


@Controller
public class UserRecordController {
	
	@Autowired
	UserRecordService userRecordService;
	
	
	@RequestMapping(value="/record/list.do" , method = RequestMethod.GET)
	public ModelAndView Record(@ModelAttribute("UserRecordVo") UserRecordVo UserRecordVo ,HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserRecordVo.setLab_id(request.getParameter("lab_id"));
	    ModelMap model = new ModelMap();
	    
	    model = userRecordService.getList(UserRecordVo);
	    String lab_id = UserRecordVo.getLab_id();
	    model.put("lab_id", lab_id);
	    return new ModelAndView("/user/record/list", "model", model);
	}
	
	@RequestMapping(value="/user/record_insert.do" , method = RequestMethod.POST)
	public void RecordInsert(@ModelAttribute("UserRecordVo") UserRecordVo UserRecordVo ,HttpServletRequest request, HttpServletResponse response) throws IOException {
		userRecordService.setRecord(UserRecordVo);
		response.getWriter().println("true");
	}
	
	@RequestMapping(value="/user/record_update.do" , method = RequestMethod.POST)
	public void RecordUpdate(@ModelAttribute("UserRecordVo")UserRecordVo UserRecordVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		userRecordService.setRecordUpdate(UserRecordVo);
	    response.getWriter().println("true");
		
	}
	
	@RequestMapping(value="/user/record_delete.do" , method = RequestMethod.POST)
	public void RecordDelete(@ModelAttribute("UserRecordVo")UserRecordVo UserRecordVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		userRecordService.setRecordDelete(UserRecordVo);
	    response.getWriter().println("true");
		
	}
	
	@RequestMapping(value="/user/record_class_check,do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String RecordClassCheck(@ModelAttribute("UserRecordVo")UserRecordVo UserRecordVo , HttpServletRequest request , HttpServletResponse response) {
		
		int count  = userRecordService.getClassCheck(UserRecordVo);
		if(count > 0) {
			String jsonStr = "false";
			return jsonStr;
		}else {
			String jsonStr = "true";
			return jsonStr;
		}
		
	}
	
	@RequestMapping(value="/record/insert.do" , method = RequestMethod.GET)
	public ModelAndView RecordInsertGet(@ModelAttribute("UserRecordVo")UserRecordVo UserRecordVo , HttpServletRequest request , HttpServletResponse response) {
		
		UserRecordVo.setLab_id(request.getParameter("lab_id"));
	    ModelMap model = new ModelMap();
	    
	    model = userRecordService.getList(UserRecordVo);
	    String lab_id = UserRecordVo.getLab_id();
	    model.put("lab_id", lab_id);
	    return new ModelAndView("/user/record/insert", "model", model);
		
	}
	
	@RequestMapping(value="/record/update.do" , method = RequestMethod.GET)
	public ModelAndView RecordUpdateGet(@ModelAttribute("UserRecordVo")UserRecordVo UserRecordVo , HttpServletRequest request , HttpServletResponse response) {
		
		UserRecordVo.setLab_id(request.getParameter("lab_id"));
	    ModelMap model = new ModelMap();
	    
	    model = userRecordService.getList(UserRecordVo);
	    String lab_id = UserRecordVo.getLab_id();
	    model.put("lab_id", lab_id);
	    return new ModelAndView("/user/record/update", "model", model);
		
	}
	
	@RequestMapping(value="/user/recordExcelDown.do" , method = RequestMethod.GET)
	public void RecordExcelDown(@ModelAttribute("UserRecordVo")UserRecordVo UserRecordVo , HttpServletRequest request , HttpServletResponse response ) throws IOException {
		
		UserRecordVo.setLab_id(request.getParameter("lab_id"));
	    
	    ModelMap map = userRecordService.getTeamNameDay(UserRecordVo);
	    
	    List<HashMap> DayList = (List)map.get("DayList");
	    List<HashMap> TeamList = (List)map.get("TeamList");
	    
	    int TeamListSize = TeamList.size();
	    System.out.println("TeamListSize = " + TeamListSize);
	    int DayListSize = DayList.size();
	    System.out.println("DayListSize = " + DayListSize);
	    
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("지도일지");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
	    
	    int WidthCnt = 0;
	    
	    int WidthCntFor = TeamListSize * 2 + 3;
	    System.out.println(WidthCntFor);
	    for (WidthCnt = 0; WidthCnt < WidthCntFor; WidthCnt++) {
	      sheet.setColumnWidth(WidthCntFor, 5000);
	    }
	    sheet.setColumnWidth(WidthCntFor, 16000);
	    
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
	    
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 0));
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 1, 1));
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 2, 2));
	    
	    int cellJ = 0;
	    int cellX = 3;
	    int cellY = 4;
	    for (int i = 0; i < TeamListSize; i++)
	    {
	      System.out.println(cellX);
	      System.out.println(cellY);
	      sheet.addMergedRegion(new CellRangeAddress(0, 0, cellX, cellY));
	      cellX += 2;
	      cellY += 2;
	    }
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, WidthCntFor, WidthCntFor));
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("순번");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("수업일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지도일지 작성일");
	    for (int i = 0; i < TeamListSize; i++)
	    {
	      HashMap TeamListMap = (HashMap)TeamList.get(i);
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(headStyle);
	      cell.setCellValue(TeamListMap.get("std_name")+"");
	      System.out.println(TeamListMap.get("std_name")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(headStyle);
	    }
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지도 목표 , 내용 및 자체평가 등을 중심으로 자유 기술");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    for (int i = 0; i < TeamListSize; i++)
	    {
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(headStyle);
	      cell.setCellValue("참여도");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(headStyle);
	      cell.setCellValue("기여도");
	    }
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    for (int i = 0; i < DayList.size(); i++)
	    {
	      columnCnt = 0;
	      row = sheet.createRow(rowNo++);
	      
	      System.out.println("====excel==" + i + "/" + DayList.size());
	      HashMap DayListMap = (HashMap)DayList.get(i);
	      cell = row.createCell(columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(i + 1);
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(DayListMap.get("CLASS_TM")+"");
	      
	      String Class_tm = String.valueOf(DayListMap.get("CLASS_TM"));
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(DayListMap.get("CREATE_TM")+"");
	      for (int j = 0; j < TeamListSize; j++)
	      {
	        List<HashMap> ScoreList = (List)map.get("ScoreList" + j);
	        System.out.println("ScoreList : " + ScoreList.size());
	        HashMap ScoreMap = (HashMap)ScoreList.get(i);
	        cell = row.createCell(++columnCnt);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(ScoreMap.get("SCORE_JOIN")+"");
	        cell = row.createCell(++columnCnt);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(ScoreMap.get("SCORE_UPTAKE")+"");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(DayListMap.get("RECORD")+"");
	    }
	    response.setContentType("ms-vnd/excel");
	    String excel_name_is = "지도일지_리스트";
	    excel_name_is = URLEncoder.encode(excel_name_is, "UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename=" + excel_name_is + ".xls");
	    
	    System.out.println("???");
	    
	    wb.write(response.getOutputStream());
	    
	    wb.close();
		
		
	}
	
}
