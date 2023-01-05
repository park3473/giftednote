package egovframework.giftednote.user.exploring.Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.net.http.HttpResponse;
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

import com.fasterxml.jackson.core.JsonProcessingException;

import egovframework.giftednote.user.exploring.Service.UserExploringService;
import egovframework.giftednote.user.exploring.model.UserExploringVo;



@Controller
public class UserExploringContorller {
	@Autowired
	UserExploringService userExploringService;
	

	@RequestMapping(value="/exploring/exploring.do" , method = RequestMethod.GET)
	public ModelAndView Exploring(@ModelAttribute("UserExploringVo") UserExploringVo UserExploringVo ,HttpServletRequest request, HttpServletResponse response){
		UserExploringVo.setIDX(request.getParameter("user_idx"));
	    UserExploringVo.setLab_id(request.getParameter("lab_id"));
	    ModelMap model = new ModelMap();
	    model = this.userExploringService.getList(UserExploringVo);
	    model.put("IDX", request.getParameter("user_idx"));
	    model.put("lab_id", request.getParameter("lab_id"));
	    return new ModelAndView("/user/exploring/list", "model", model);
	}
	
	@RequestMapping(value="/exploring/insert.do", method=RequestMethod.POST)
	public ModelAndView ExploringInsert(@ModelAttribute("UserExploringVo") UserExploringVo UserExploringVo ,HttpServletRequest request, HttpServletResponse response) {
		UserExploringVo.setIDX(request.getParameter("user_idx"));
	    UserExploringVo.setLab_id(request.getParameter("lab_id"));
	    ModelMap model = new ModelMap();
	    model = this.userExploringService.getList(UserExploringVo);
	    model.put("IDX", request.getParameter("user_idx"));
	    model.put("lab_id", request.getParameter("lab_id"));
	    return new ModelAndView("/user/exploring/insert", "model", model);
	}
	
	@RequestMapping(value="/user/exploring_delete.do" , method = RequestMethod.POST)
	public void ExploringDelete(@ModelAttribute("UserExploringVo")UserExploringVo UserExploringVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		userExploringService.setExploringDelete(UserExploringVo);
		response.getWriter().println("true");
		
	}
	
	@RequestMapping(value="/exploring_class_check.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String ExploringClassCheck(@ModelAttribute("UserExploringVo") UserExploringVo UserExploringVo, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException
	{
		  int count = userExploringService.getClassCheck(UserExploringVo);
		  if (count > 0)
		  {
		      String jsonStr = "false";
		      return jsonStr;
		  }else {

			  String jsonStr = "true";
			  return jsonStr;
		  }
	}
	
	@RequestMapping(value="/user/exploringExcelDown.do" , method = RequestMethod.GET)
	public void ExploringExcelDown(@ModelAttribute("UserExploringVo")UserExploringVo UserExploringVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		UserExploringVo.setLab_id(request.getParameter("lab_id"));
	    UserExploringVo.setIDX(request.getParameter("IDX"));
	    
	    ModelMap map = this.userExploringService.getList(UserExploringVo);
	    
	    List<HashMap> list = (List)map.get("list");
	    
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("탐구일지");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
	    
	    int WidthCnt = 0;
	    
	    sheet.setColumnWidth(13, 11000);
	    sheet.setColumnWidth(14, 11000);
	    
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
	    sheet.addMergedRegion(new CellRangeAddress(0, 0, 2, 3));
	    sheet.addMergedRegion(new CellRangeAddress(0, 0, 4, 5));
	    sheet.addMergedRegion(new CellRangeAddress(0, 0, 6, 10));
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 11, 11));
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 12, 12));
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 13, 13));
	    sheet.addMergedRegion(new CellRangeAddress(0, 1, 14, 14));
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("순번");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("수업일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지도자");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("교육장소");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("교육방법");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("참여도");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이해도");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("배운점");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("느낀점");
	    
	    columnCnt = 0;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("교수");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("조교");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("자택");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("고교");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("실시간강의");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영상강의");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("실험");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("세미나(토론)");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("기타");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    for (int i = 0; i < list.size(); i++)
	    {
	      System.out.println("====excel==" + i + "/" + list.size());
	      
	      HashMap detailMap = (HashMap)list.get(i);
	      
	      columnCnt = 0;
	      row = sheet.createRow(rowNo++);
	      
	      cell = row.createCell(columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(i + 1);
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(detailMap.get("CLASS_TM")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (detailMap.get("LEADER_TYPE").toString().indexOf("교수") > -1) {
	        cell.setCellValue("YES");
	      } else {
	        cell.setCellValue("NO");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (detailMap.get("LEADER_TYPE").toString().indexOf("조교") > -1) {
	        cell.setCellValue("YES");
	      } else {
	        cell.setCellValue("NO");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (detailMap.get("CLASS_TYPE").toString().indexOf("자택") > -1) {
	        cell.setCellValue("YES");
	      } else {
	        cell.setCellValue("NO");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (detailMap.get("CLASS_TYPE").toString().indexOf("고교") > -1) {
	        cell.setCellValue("YES");
	      } else {
	        cell.setCellValue("NO");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (detailMap.get("CLASS_PLACE").toString().indexOf("실시간강의") > -1) {
	        cell.setCellValue("YES");
	      } else {
	        cell.setCellValue("NO");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (detailMap.get("CLASS_PLACE").toString().indexOf("영상강의") > -1) {
	        cell.setCellValue("YES");
	      } else {
	        cell.setCellValue("NO");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (detailMap.get("CLASS_PLACE").toString().indexOf("실험") > -1) {
	        cell.setCellValue("YES");
	      } else {
	        cell.setCellValue("NO");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (detailMap.get("CLASS_PLACE").toString().indexOf("세미나") > -1) {
	        cell.setCellValue("YES");
	      } else {
	        cell.setCellValue("NO");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      if (detailMap.get("CLASS_PLACE").equals("세미나")) {
	        cell.setCellValue(detailMap.get("OHTER")+"");
	      } else {
	        cell.setCellValue("NO");
	      }
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(detailMap.get("SCORE_JOIN")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(detailMap.get("SCORE_UPTAKE")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(detailMap.get("LEARN")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(detailMap.get("FELT")+"");
	    }
	    response.setContentType("ms-vnd/excel");
	    String excel_name_is = "탐구일지_리스트";
	    excel_name_is = URLEncoder.encode(excel_name_is, "UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename=" + excel_name_is + ".xls");
	    
	    System.out.println("???");
	    
	    wb.write(response.getOutputStream());
	    
	    wb.close();
		
	}
}
