package egovframework.giftednote.admin.team.Controller;

import java.awt.Color;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
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
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.giftednote.admin.team.Model.AdminTeamVo;
import egovframework.giftednote.admin.team.Service.AdminTeamService;
import egovframework.giftednote.user.exploring.Service.UserExploringService;
import egovframework.giftednote.user.exploring.model.UserExploringVo;
import egovframework.giftednote.user.record.Service.UserRecordService;
import egovframework.giftednote.user.record.model.UserRecordVo;
import egovframework.giftednote.user.srce.model.UserSrceVo;

@Controller
public class AdminTeamController {
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminTeamController.class);
	
	@Autowired
	AdminTeamService adminTeamService;
	
	@Autowired
	UserExploringService userExploringService;
	
	@Autowired
	UserRecordService userRecordService;
	
	@RequestMapping(value="/admin/team/note_list.do" , method = RequestMethod.GET)
	public ModelAndView AdminTeamList(@ModelAttribute("AdminTeamVo")AdminTeamVo adminTeamVo , HttpServletRequest request , HttpServletResponse response) {
		
		String PAGE = request.getParameter("PAGE") != null ? request.getParameter("PAGE") : "0";
	    String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request.getParameter("ITEM_COUNT") : "10";
	    if (PAGE == null) {
	      PAGE = "0";
	    }
	    if (ITEM_COUNT == null) {
	      ITEM_COUNT = "10";
	    }
	    adminTeamVo.setPAGE(Integer.parseInt(PAGE));
	    adminTeamVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
	    
	    ModelMap model = new ModelMap();
	    
	    int pagelimit = adminTeamVo.getPAGE() * adminTeamVo.getITEM_COUNT();
	    
	    adminTeamVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
	    adminTeamVo.setOFFSET(pagelimit);
	    
	    model = adminTeamService.getALLList(adminTeamVo);
	    
	    model.put("beforeDomain", adminTeamVo);
	    
	    return new ModelAndView("admin/note/list", "model", model);
		
	}
	
	@RequestMapping(value="/admin/team/getTeamList.do" , method = RequestMethod.GET)
	public ModelAndView GetTeamList(@ModelAttribute("AdminTeamVo")AdminTeamVo adminTeamVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	    
	    adminTeamVo.setLab_id(request.getParameter("lab_id"));
	    
	    model = adminTeamService.getTeamList(adminTeamVo);
	    
	    return new ModelAndView("admin/note/teamlist", "model", model);
	    
	}
	
	@RequestMapping(value="/admin/team/delete.do" , method = RequestMethod.POST)
	public void teamdelete(@ModelAttribute("AdminTeamVo")AdminTeamVo adminTeamVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminTeamService.setDelete(adminTeamVo);
	    
	    PrintWriter out = response.getWriter();
	    out.println(true);
		
	}
	
	@RequestMapping(value="/admin/team/SrceAllExcelDown.do" , method = RequestMethod.GET)
	public void SrceAllExcelDown(@ModelAttribute("UserSrceVo")UserSrceVo userSrceVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String ProgNum = request.getParameter("ProgNum");
	    
	    System.out.println("ProgNum : " + ProgNum);
	    
	    userSrceVo.setLab_prog_id(ProgNum);
	    
	    int ProgNumber = Integer.parseInt(ProgNum);
	    
	    ProgNumber -= 2;
	    
	    ModelMap model = new ModelMap();
	    
	    model = adminTeamService.getSrceAllList(userSrceVo);
	    
	    List<HashMap> list = (List)model.get("list");
	    
	    Workbook wb = new HSSFWorkbook();
	    
	    Sheet sheet = wb.createSheet("학생연구역량평가_" + ProgNumber + "기");
	    
	    Row row = null;
	    
	    Cell cell = null;
	    
	    int rowNo = 0;
	    
	    int WidthCnt = 0;
	    
	    CellStyle headStyle = wb.createCellStyle();
	    
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_25_PERCENT.getIndex());
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
	    cell.setCellValue("학년");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("과제번호");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P1");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P2");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P3");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P4");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P5");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P6");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q1");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q2");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q3");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q4");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q5");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q6");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R1");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R2");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R3");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R4");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R5");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R6");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T1");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T2");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T3");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T4");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T5");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T6");
	    
	    int FullListSize = list.size() / 24;
	    System.out.println("FullListSize : " + FullListSize);
	    for (int i = 0; i < FullListSize; i++)
	    {
	      System.out.println("------excel --- + " + i + " / " + FullListSize);
	      
	      HashMap tempMap = (HashMap)list.get(i * 24);
	      
	      String Test = tempMap.get("std_sch_id").toString();
	      
	      System.out.println(Test);
	      
	      int StdSchId = Integer.parseInt(Test);
	      
	      System.out.println("StdSchId : " + StdSchId);
	      
	      String SchoolName = SUtil.getSchoolName(StdSchId);
	      
	      columnCnt = 0;
	      row = sheet.createRow(rowNo++);
	      
	      cell = row.createCell(0);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("std_grade")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(SchoolName);
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("NAME")+"");
	      for (int j = 0; j < 24; j++)
	      {
	        System.out.println("Score ----" + j + " --");
	        
	        HashMap tempMap2 = (HashMap)list.get(j + i);
	        
	        cell = row.createCell(++columnCnt);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(tempMap2.get("SCORE")+"");
	      }
	    }
	    Date today = new Date();
	    
	    System.out.println();
	    
	    SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
	    
	    String nowDate = date.format(today);
	    String Name = "학생연구역량평가";
	    Name = URLEncoder.encode(Name, "UTF-8");
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=" + Name + "_" + ProgNumber + "기.xls");
	    
	    Cookie cookie = new Cookie("fileDownload", "true");
	    response.addCookie(cookie);
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
	
	@RequestMapping(value="/admin/team/exploringAllExcelDown.do" , method = RequestMethod.GET)
	public void ExploringAllExcelDown(@ModelAttribute("UserExploringVo")UserExploringVo UserExploringVo , HttpServletRequest request , HttpServletResponse response) throws IOException , ParseException {
		
		String ProgId = request.getParameter("ProgId");
	    
	    UserExploringVo.setLab_prog_id(ProgId);
	    
	    ModelMap NameMap = this.userExploringService.getNameAll(UserExploringVo);
	    
	    List<HashMap> Namelist = (List)NameMap.get("namelist");
	    
	    System.out.println("명 : " + Namelist.size());
	    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	    
	    String StartDate = request.getParameter("StartTM");
	    
	    String EndDate = request.getParameter("EndTM");
	    
	    Calendar cal = Calendar.getInstance();
	    
	    Date s1 = dateFormat.parse(StartDate);
	    
	    cal.setTime(s1);
	    
	    System.out.println("StartDate : " + StartDate);
	    
	    System.out.println("EndDate : " + EndDate);
	    
	    System.out.println("S1 : " + s1);
	    
	    int d = 0;
	    
	    List<String> DateList = new ArrayList();
	    
	    List<String> IdList = new ArrayList();
	    
	    System.out.println("Now : " + StartDate);
	    while (!StartDate.equals(EndDate))
	    {
	      System.out.println("Now : " + StartDate);
	      
	      DateList.add(StartDate);
	      
	      cal.add(5, 1);
	      
	      StartDate = dateFormat.format(cal.getTime());
	    }
	    for (int i = 0; i < DateList.size(); i++) {
	      System.out.println(i + "번째 : " + (String)DateList.get(i));
	    }
	    String Id = "";
	    
	    XSSFWorkbook wb = new XSSFWorkbook();
	    XSSFSheet sheet = wb.createSheet("탐구일지 - 학생일지");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
	    
	    System.out.println("???");
	    
	    CellStyle headStyle = wb.createCellStyle();
	    
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_25_PERCENT.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    
	    XSSFCellStyle joinStyle = wb.createCellStyle();
	    joinStyle.setFillForegroundColor(new XSSFColor(new Color(217, 225, 242)));
	    joinStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    joinStyle.setBorderTop(BorderStyle.THIN);
	    joinStyle.setBorderBottom(BorderStyle.THIN);
	    joinStyle.setBorderLeft(BorderStyle.THIN);
	    joinStyle.setBorderRight(BorderStyle.THIN);
	    
	    XSSFCellStyle uptakeStyle = wb.createCellStyle();
	    uptakeStyle.setFillForegroundColor(new XSSFColor(new Color(255, 242, 204)));
	    uptakeStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    uptakeStyle.setBorderTop(BorderStyle.THIN);
	    uptakeStyle.setBorderBottom(BorderStyle.THIN);
	    uptakeStyle.setBorderLeft(BorderStyle.THIN);
	    uptakeStyle.setBorderRight(BorderStyle.THIN);
	    
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
	    cell.setCellValue("과제번호");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("분류");
	    for (int i = 0; i < Namelist.size(); i++)
	    {
	      System.out.println("----name--- :" + i + " / " + Namelist.size());
	      
	      HashMap tempMap = (HashMap)Namelist.get(i);
	      
	      columnCnt = 0;
	      row = sheet.createRow(rowNo++);
	      
	      cell = row.createCell(0);
	      cell.setCellStyle(joinStyle);
	      cell.setCellValue(tempMap.get("std_ur_userid")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(joinStyle);
	      cell.setCellValue(tempMap.get("std_name")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(joinStyle);
	      cell.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(joinStyle);
	      cell.setCellValue("참여도");
	      
	      columnCnt = 0;
	      row = sheet.createRow(rowNo++);
	      
	      cell = row.createCell(0);
	      cell.setCellStyle(uptakeStyle);
	      cell.setCellValue(tempMap.get("std_ur_userid")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(uptakeStyle);
	      cell.setCellValue(tempMap.get("std_name")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(uptakeStyle);
	      cell.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(uptakeStyle);
	      cell.setCellValue("이해도");
	      
	      IdList.add(tempMap.get("std_ur_userid")+"");
	    }
	    for (int j = 0; j < DateList.size(); j++)
	    {
	      rowNo = 0;
	      
	      columnCnt = 4 + j;
	      row = sheet.getRow(rowNo++);
	      
	      cell = row.createCell(columnCnt);
	      cell.setCellStyle(headStyle);
	      cell.setCellValue((String)DateList.get(j));
	      
	      System.out.println((String)DateList.get(j));
	      
	      UserExploringVo.setCLASS_TM((String)DateList.get(j));
	      ModelMap ExploringMap = this.userExploringService.getDateExploringList(UserExploringVo);
	      
	      List<HashMap> exploringlist = (List)ExploringMap.get("exploringlist");
	      
	      int z = 0;
	      if (exploringlist.size() > 0) {
	        for (int k = 0; k < IdList.size(); k++)
	        {
	          System.out.println("k :" + k);
	          System.out.println("z : " + z);
	          
	          HashMap exploringMap = (HashMap)exploringlist.get(z);
	          
	          Id = exploringMap.get("ur_userid")+"";
	          
	          System.out.println("Id" + Id);
	          
	          System.out.println("IdList : " + (String)IdList.get(k));
	          if (((String)IdList.get(k)).equals(Id))
	          {
	            System.out.println("TRUE");
	            
	            row = sheet.getRow(rowNo++);
	            
	            cell = row.createCell(columnCnt);
	            cell.setCellStyle(joinStyle);
	            cell.setCellValue(exploringMap.get("score_join")+"");
	            
	            row = sheet.getRow(rowNo++);
	            
	            cell = row.createCell(columnCnt);
	            cell.setCellStyle(uptakeStyle);
	            cell.setCellValue(exploringMap.get("score_uptake")+"");
	            if (z < exploringlist.size() - 1) {
	              z++;
	            }
	          }
	          else
	          {
	            System.out.println("FLASE");
	            
	            row = sheet.getRow(rowNo++);
	            
	            cell = row.createCell(columnCnt);
	            cell.setCellStyle(joinStyle);
	            cell.setCellValue(" ");
	            
	            row = sheet.getRow(rowNo++);
	            
	            cell = row.createCell(columnCnt);
	            cell.setCellStyle(uptakeStyle);
	            cell.setCellValue(" ");
	          }
	        }
	      } else {
	        for (int k = 0; k < IdList.size(); k++)
	        {
	          row = sheet.getRow(rowNo++);
	          
	          cell = row.createCell(columnCnt);
	          cell.setCellStyle(joinStyle);
	          cell.setCellValue(" ");
	          
	          row = sheet.getRow(rowNo++);
	          
	          cell = row.createCell(columnCnt);
	          cell.setCellStyle(uptakeStyle);
	          cell.setCellValue(" ");
	        }
	      }
	    }
	    int ProgName = Integer.parseInt(ProgId);
	    
	    ProgName -= 2;
	    
	    ProgId = Integer.toString(ProgName);
	    
	    response.setContentType("ms-vnd/excel");String excel_name_is = "탐구일지_" + ProgId + "_기";
	    excel_name_is = URLEncoder.encode(excel_name_is, "UTF-8");
	    response.setHeader("Content-Disposition", 
	      "attachment;filename=" + excel_name_is + ".xlsx");
	    
	    System.out.println("???");
	    
	    Cookie cookie = new Cookie("fileDownload", "true");
	    response.addCookie(cookie);
	    
	    wb.write(response.getOutputStream());
	    
	    wb.close();
		
	}
	
	@RequestMapping(value="/admin/team/reCordAllExcelDown.do" , method = RequestMethod.GET)
	public void RecordAllExcelDown(@ModelAttribute("UserRecordVo")UserRecordVo UserRecordVo , HttpServletRequest request , HttpServletResponse response) throws IOException, ParseException {
		
		String ProgId = request.getParameter("ProgId");
	    
	    UserRecordVo.setLab_prog_id(ProgId);
	    
	    ModelMap NameMap = this.userRecordService.getNameList(UserRecordVo);
	    
	    List<HashMap> Namelist = (List)NameMap.get("namelist");
	    
	    System.out.println("명 : " + Namelist.size());
	    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	    
	    String StartDate = request.getParameter("StartTM");
	    
	    String EndDate = request.getParameter("EndTM");
	    
	    Calendar cal = Calendar.getInstance();
	    
	    Date s1 = dateFormat.parse(StartDate);
	    
	    cal.setTime(s1);
	    
	    System.out.println("StartDate : " + StartDate);
	    
	    System.out.println("EndDate : " + EndDate);
	    
	    System.out.println("S1 : " + s1);
	    
	    int d = 0;
	    
	    List<String> DateList = new ArrayList();
	    
	    List<String> IdList = new ArrayList();
	    
	    System.out.println("Now : " + StartDate);
	    while (!StartDate.equals(EndDate))
	    {
	      System.out.println("Now : " + StartDate);
	      
	      DateList.add(StartDate);
	      
	      cal.add(5, 1);
	      
	      StartDate = dateFormat.format(cal.getTime());
	    }
	    for (int i = 0; i < DateList.size(); i++) {
	      System.out.println(i + "번째 : " + (String)DateList.get(i));
	    }
	    String Id = "";
	    
	    XSSFWorkbook wb = new XSSFWorkbook();
	    XSSFSheet sheet = wb.createSheet("지도일지");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
	    
	    System.out.println("???");
	    
	    CellStyle headStyle = wb.createCellStyle();
	    
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_25_PERCENT.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    
	    XSSFCellStyle joinStyle = wb.createCellStyle();
	    joinStyle.setFillForegroundColor(new XSSFColor(new Color(217, 225, 242)));
	    joinStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    joinStyle.setBorderTop(BorderStyle.THIN);
	    joinStyle.setBorderBottom(BorderStyle.THIN);
	    joinStyle.setBorderLeft(BorderStyle.THIN);
	    joinStyle.setBorderRight(BorderStyle.THIN);
	    
	    XSSFCellStyle uptakeStyle = wb.createCellStyle();
	    uptakeStyle.setFillForegroundColor(new XSSFColor(new Color(255, 242, 204)));
	    uptakeStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    uptakeStyle.setBorderTop(BorderStyle.THIN);
	    uptakeStyle.setBorderBottom(BorderStyle.THIN);
	    uptakeStyle.setBorderLeft(BorderStyle.THIN);
	    uptakeStyle.setBorderRight(BorderStyle.THIN);
	    
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
	    cell.setCellValue("과제번호");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("분류");
	    for (int i = 0; i < Namelist.size(); i++)
	    {
	      System.out.println("----name--- :" + i + " / " + Namelist.size());
	      
	      HashMap tempMap = (HashMap)Namelist.get(i);
	      
	      columnCnt = 0;
	      row = sheet.createRow(rowNo++);
	      
	      cell = row.createCell(0);
	      cell.setCellStyle(joinStyle);
	      cell.setCellValue(tempMap.get("std_ur_userid")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(joinStyle);
	      cell.setCellValue(tempMap.get("std_name")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(joinStyle);
	      cell.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(joinStyle);
	      cell.setCellValue("참여도");
	      
	      columnCnt = 0;
	      row = sheet.createRow(rowNo++);
	      
	      cell = row.createCell(0);
	      cell.setCellStyle(uptakeStyle);
	      cell.setCellValue(tempMap.get("std_ur_userid")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(uptakeStyle);
	      cell.setCellValue(tempMap.get("std_name")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(uptakeStyle);
	      cell.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(uptakeStyle);
	      cell.setCellValue("이해도");
	      
	      IdList.add(tempMap.get("std_ur_userid")+"");
	    }
	    for (int j = 0; j < DateList.size(); j++)
	    {
	      rowNo = 0;
	      
	      columnCnt = 4 + j;
	      row = sheet.getRow(rowNo++);
	      
	      cell = row.createCell(columnCnt);
	      cell.setCellStyle(headStyle);
	      cell.setCellValue((String)DateList.get(j));
	      
	      System.out.println((String)DateList.get(j));
	      
	      UserRecordVo.setCLASS_TM((String)DateList.get(j));
	      ModelMap RecordMap = this.userRecordService.getDateRecordList(UserRecordVo);
	      
	      List<HashMap> recordlist = (List)RecordMap.get("recordlist");
	      
	      int z = 0;
	      if (recordlist.size() > 0) {
	        for (int k = 0; k < IdList.size(); k++)
	        {
	          System.out.println("k :" + k);
	          System.out.println("z : " + z);
	          
	          HashMap exploringMap = (HashMap)recordlist.get(z);
	          
	          Id = exploringMap.get("ur_userid")+"";
	          
	          System.out.println("Id" + Id);
	          
	          System.out.println("IdList : " + (String)IdList.get(k));
	          if (((String)IdList.get(k)).equals(Id))
	          {
	            System.out.println("TRUE");
	            
	            row = sheet.getRow(rowNo++);
	            
	            cell = row.createCell(columnCnt);
	            cell.setCellStyle(joinStyle);
	            cell.setCellValue(exploringMap.get("score_join")+"");
	            
	            row = sheet.getRow(rowNo++);
	            
	            cell = row.createCell(columnCnt);
	            cell.setCellStyle(uptakeStyle);
	            cell.setCellValue(exploringMap.get("score_uptake")+"");
	            if (z < recordlist.size() - 1) {
	              z++;
	            }
	          }
	          else
	          {
	            System.out.println("FLASE");
	            
	            row = sheet.getRow(rowNo++);
	            
	            cell = row.createCell(columnCnt);
	            cell.setCellStyle(joinStyle);
	            cell.setCellValue(" ");
	            
	            row = sheet.getRow(rowNo++);
	            
	            cell = row.createCell(columnCnt);
	            cell.setCellStyle(uptakeStyle);
	            cell.setCellValue(" ");
	          }
	        }
	      } else {
	        for (int k = 0; k < IdList.size(); k++)
	        {
	          row = sheet.getRow(rowNo++);
	          
	          cell = row.createCell(columnCnt);
	          cell.setCellStyle(joinStyle);
	          cell.setCellValue(" ");
	          
	          row = sheet.getRow(rowNo++);
	          
	          cell = row.createCell(columnCnt);
	          cell.setCellStyle(uptakeStyle);
	          cell.setCellValue(" ");
	        }
	      }
	    }
	    int ProgName = Integer.parseInt(ProgId);
	    
	    ProgName -= 2;
	    
	    ProgId = Integer.toString(ProgName);
	    
	    response.setContentType("ms-vnd/excel");String excel_name_is = "지도일지_" + ProgId + "_기";
	    excel_name_is = URLEncoder.encode(excel_name_is, "UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename=" + excel_name_is + ".xlsx");
	    
	    Cookie cookie = new Cookie("fileDownload", "true");
	    response.addCookie(cookie);
	    
	    wb.write(response.getOutputStream());
	    
	    wb.close();
		
	}
	
	@RequestMapping(value="/admin/team/AllExcelDown.do" , method = RequestMethod.GET)
	public void AllExcelDown(@ModelAttribute("UserSrceVo")UserSrceVo userSrceVo ,  UserExploringVo UserExploringVo, UserRecordVo UserRecordVo, HttpServletRequest request , HttpServletResponse response) throws IOException, ParseException {
		
		String ProgNum = request.getParameter("ProgNum");
	    
	    userSrceVo.setLab_prog_id(ProgNum);
	    
	    int ProgNumber = Integer.parseInt(ProgNum);
	    
	    ProgNumber -= 2;
	    
	    ModelMap model = new ModelMap();
	    
	    model = this.adminTeamService.getSrceAllList(userSrceVo);
	    
	    List<HashMap> list = (List)model.get("list");
	    
	    XSSFWorkbook wb = new XSSFWorkbook();
	    
	    Sheet sheet = wb.createSheet("학생연구역량평가지_" + ProgNumber + "기");
	    
	    Row row = null;
	    
	    Cell cell = null;
	    
	    int rowNo = 0;
	    
	    int WidthCnt = 0;
	    
	    CellStyle headStyle = wb.createCellStyle();
	    
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_25_PERCENT.getIndex());
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
	    cell.setCellValue("학년");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("과제번호");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P1");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P2");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P3");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P4");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P5");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("P6");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q1");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q2");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q3");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q4");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q5");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Q6");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R1");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R2");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R3");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R4");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R5");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("R6");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T1");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T2");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T3");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T4");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T5");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("T6");
	    
	    int FullListSize = list.size() / 24;
	    System.out.println("FullListSize : " + FullListSize);
	    for (int i = 0; i < FullListSize; i++)
	    {
	      System.out.println("------excel --- + " + i + " / " + FullListSize);
	      
	      HashMap tempMap = (HashMap)list.get(i * 24);
	      
	      String Test = tempMap.get("std_sch_id").toString();
	      
	      System.out.println(Test);
	      
	      int StdSchId = Integer.parseInt(Test);
	      
	      System.out.println("StdSchId : " + StdSchId);
	      
	      String SchoolName = SUtil.getSchoolName(StdSchId);
	      
	      columnCnt = 0;
	      row = sheet.createRow(rowNo++);
	      
	      cell = row.createCell(0);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("std_grade")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(SchoolName);
	      
	      cell = row.createCell(++columnCnt);
	      cell.setCellStyle(bodyStyle);
	      cell.setCellValue(tempMap.get("NAME")+"");
	      for (int j = 0; j < 24; j++)
	      {
	        System.out.println("Score ----" + j + " --");
	        
	        HashMap tempMap2 = (HashMap)list.get(j + i);
	        
	        cell = row.createCell(++columnCnt);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(tempMap2.get("SCORE")+"");
	      }
	    }
	    String ProgId = request.getParameter("ProgId");
	    
	    UserExploringVo.setLab_prog_id(ProgId); 
	    
	    ModelMap NameMap = this.userExploringService.getNameAll(UserExploringVo);
	    
	    List<HashMap> Namelist = (List)NameMap.get("namelist");
	    
	    System.out.println("명 : " + Namelist.size());
	    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	    
	    String StartDate = request.getParameter("StartTM");
	    
	    String EndDate = request.getParameter("EndTM");
	    
	    Calendar cal = Calendar.getInstance();
	    
	    Date s1 = dateFormat.parse(StartDate);
	    
	    cal.setTime(s1);
	    
	    System.out.println("StartDate : " + StartDate);
	    
	    System.out.println("EndDate : " + EndDate);
	    
	    System.out.println("S1 : " + s1);
	    
	    int d = 0;
	    
	    List<String> DateList = new ArrayList();
	    
	    List<String> IdList = new ArrayList();
	    
	    System.out.println("Now : " + StartDate);
	    while (!StartDate.equals(EndDate))
	    {
	      System.out.println("Now : " + StartDate);
	      
	      DateList.add(StartDate);
	      
	      cal.add(5, 1);
	      
	      StartDate = dateFormat.format(cal.getTime());
	    }
	    for (int i = 0; i < DateList.size(); i++) {
	      System.out.println(i + "번째 : " + (String)DateList.get(i));
	    }
	    String Id = "";
	    
	    XSSFSheet sheet2 = wb.createSheet("탐구일지 - 학생일지");
	    Row row2 = null;
	    Cell cell2 = null;
	    int rowNo2 = 0;
	    
	    System.out.println("???");
	    
	    CellStyle headStyle2 = wb.createCellStyle();
	    
	    headStyle2.setBorderTop(BorderStyle.THIN);
	    headStyle2.setBorderBottom(BorderStyle.THIN);
	    headStyle2.setBorderLeft(BorderStyle.THIN);
	    headStyle2.setBorderRight(BorderStyle.THIN);
	    
	    headStyle2.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_25_PERCENT.getIndex());
	    headStyle2.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    headStyle2.setAlignment(HorizontalAlignment.CENTER);
	    
	    CellStyle bodyStyle2 = wb.createCellStyle();
	    bodyStyle2.setBorderTop(BorderStyle.THIN);
	    bodyStyle2.setBorderBottom(BorderStyle.THIN);
	    bodyStyle2.setBorderLeft(BorderStyle.THIN);
	    bodyStyle2.setBorderRight(BorderStyle.THIN);
	    
	    XSSFCellStyle joinStyle = wb.createCellStyle();
	    joinStyle.setFillForegroundColor(new XSSFColor(new Color(217, 225, 242)));
	    joinStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    joinStyle.setBorderTop(BorderStyle.THIN);
	    joinStyle.setBorderBottom(BorderStyle.THIN);
	    joinStyle.setBorderLeft(BorderStyle.THIN);
	    joinStyle.setBorderRight(BorderStyle.THIN);
	    
	    XSSFCellStyle uptakeStyle = wb.createCellStyle();
	    uptakeStyle.setFillForegroundColor(new XSSFColor(new Color(255, 242, 204)));
	    uptakeStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    uptakeStyle.setBorderTop(BorderStyle.THIN);
	    uptakeStyle.setBorderBottom(BorderStyle.THIN);
	    uptakeStyle.setBorderLeft(BorderStyle.THIN);
	    uptakeStyle.setBorderRight(BorderStyle.THIN);
	    
	    int columnCnt2 = 0;
	    row2 = sheet2.createRow(rowNo2++);
	    
	    cell2 = row2.createCell(0);
	    cell2.setCellStyle(headStyle2);
	    cell2.setCellValue("아이디");
	    
	    cell2 = row2.createCell(++columnCnt2);
	    cell2.setCellStyle(headStyle2);
	    cell2.setCellValue("이름");
	    
	    cell2 = row2.createCell(++columnCnt2);
	    cell2.setCellStyle(headStyle2);
	    cell2.setCellValue("과제번호");
	    
	    cell2 = row2.createCell(++columnCnt2);
	    cell2.setCellStyle(headStyle2);
	    cell2.setCellValue("분류");
	    for (int i = 0; i < Namelist.size(); i++)
	    {
	      System.out.println("----name--- :" + i + " / " + Namelist.size());
	      
	      HashMap tempMap = (HashMap)Namelist.get(i);
	      
	      columnCnt2 = 0;
	      row2 = sheet2.createRow(rowNo2++);
	      
	      cell2 = row2.createCell(0);
	      cell2.setCellStyle(joinStyle);
	      cell2.setCellValue(tempMap.get("std_ur_userid")+"");
	      
	      cell2 = row2.createCell(++columnCnt2);
	      cell2.setCellStyle(joinStyle);
	      cell2.setCellValue(tempMap.get("std_name")+"");
	      
	      cell2 = row2.createCell(++columnCnt2);
	      cell2.setCellStyle(joinStyle);
	      cell2.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell2 = row2.createCell(++columnCnt2);
	      cell2.setCellStyle(joinStyle);
	      cell2.setCellValue("참여도");
	      
	      columnCnt2 = 0;
	      row2 = sheet2.createRow(rowNo2++);
	      
	      cell2 = row2.createCell(0);
	      cell2.setCellStyle(uptakeStyle);
	      cell2.setCellValue(tempMap.get("std_ur_userid")+"");
	      
	      cell2 = row2.createCell(++columnCnt2);
	      cell2.setCellStyle(uptakeStyle);
	      cell2.setCellValue(tempMap.get("std_name")+"");
	      
	      cell2 = row2.createCell(++columnCnt2);
	      cell2.setCellStyle(uptakeStyle);
	      cell2.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell2 = row2.createCell(++columnCnt2);
	      cell2.setCellStyle(uptakeStyle);
	      cell2.setCellValue("이해도");
	      
	      IdList.add(tempMap.get("std_ur_userid")+"");
	    }
	    for (int j = 0; j < DateList.size(); j++)
	    {
	      rowNo2 = 0;
	      
	      columnCnt2 = 4 + j;
	      row2 = sheet2.getRow(rowNo2++);
	      
	      cell2 = row2.createCell(columnCnt2);
	      cell2.setCellStyle(headStyle2);
	      cell2.setCellValue((String)DateList.get(j));
	      
	      System.out.println((String)DateList.get(j));
	      
	      UserExploringVo.setCLASS_TM((String)DateList.get(j));
	      ModelMap ExploringMap = this.userExploringService.getDateExploringList(UserExploringVo);
	      
	      List<HashMap> exploringlist = (List)ExploringMap.get("exploringlist");
	      
	      int z = 0;
	      if (exploringlist.size() > 0) {
	        for (int k = 0; k < IdList.size(); k++)
	        {
	          System.out.println("k :" + k);
	          System.out.println("z : " + z);
	          
	          HashMap exploringMap = (HashMap)exploringlist.get(z);
	          
	          Id = exploringMap.get("ur_userid")+"";
	          
	          System.out.println("Id" + Id);
	          
	          System.out.println("IdList : " + (String)IdList.get(k));
	          if (((String)IdList.get(k)).equals(Id))
	          {
	            System.out.println("TRUE");
	            
	            row2 = sheet2.getRow(rowNo2++);
	            
	            cell2 = row2.createCell(columnCnt2);
	            cell2.setCellStyle(joinStyle);
	            cell2.setCellValue(exploringMap.get("score_join")+"");
	            
	            row2 = sheet2.getRow(rowNo2++);
	            
	            cell2 = row2.createCell(columnCnt2);
	            cell2.setCellStyle(uptakeStyle);
	            cell2.setCellValue(exploringMap.get("score_uptake")+"");
	            if (z < exploringlist.size() - 1) {
	              z++;
	            }
	          }
	          else
	          {
	            System.out.println("FLASE");
	            
	            row2 = sheet2.getRow(rowNo2++);
	            
	            cell2 = row2.createCell(columnCnt2);
	            cell2.setCellStyle(joinStyle);
	            cell2.setCellValue(" ");
	            
	            row2 = sheet2.getRow(rowNo2++);
	            
	            cell2 = row2.createCell(columnCnt2);
	            cell2.setCellStyle(uptakeStyle);
	            cell2.setCellValue(" ");
	          }
	        }
	      } else {
	        for (int k = 0; k < IdList.size(); k++)
	        {
	          row2 = sheet2.getRow(rowNo2++);
	          
	          cell2 = row2.createCell(columnCnt2);
	          cell2.setCellStyle(joinStyle);
	          cell2.setCellValue(" ");
	          
	          row2 = sheet2.getRow(rowNo2++);
	          
	          cell2 = row2.createCell(columnCnt2);
	          cell2.setCellStyle(uptakeStyle);
	          cell2.setCellValue(" ");
	        }
	      }
	    }
	    String ProgId2 = request.getParameter("ProgId");
	    
	    UserRecordVo.setLab_prog_id(ProgId2);
	    
	    ModelMap NameMap2 = this.userRecordService.getNameList(UserRecordVo);
	    
	    List<HashMap> Namelist2 = (List)NameMap2.get("namelist");
	    
	    System.out.println("명 : " + Namelist2.size());
	    
	    SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyyMMdd");
	    
	    String StartDate2 = request.getParameter("StartTM");
	    
	    String EndDate2 = request.getParameter("EndTM");
	    
	    Calendar cal2 = Calendar.getInstance();
	    
	    Date s2 = dateFormat2.parse(StartDate2);
	    
	    cal2.setTime(s2);
	    
	    System.out.println("StartDate2 : " + StartDate2);
	    
	    System.out.println("EndDate2 : " + EndDate2);
	    
	    System.out.println("s2 : " + s2);
	    
	    List<String> DateList2 = new ArrayList();
	    
	    List<String> IdList2 = new ArrayList();
	    
	    System.out.println("Now : " + StartDate2);
	    while (!StartDate2.equals(EndDate2))
	    {
	      System.out.println("Now : " + StartDate2);
	      
	      DateList2.add(StartDate2);
	      
	      cal2.add(5, 1);
	      
	      StartDate2 = dateFormat2.format(cal2.getTime());
	    }
	    for (int i = 0; i < DateList2.size(); i++) {
	      System.out.println(i + "번째 : " + (String)DateList2.get(i));
	    }
	    String Id2 = "";
	    
	    XSSFSheet sheet3 = wb.createSheet("탐구일지 - 기록일지");
	    Row row3 = null;
	    Cell cell3 = null;
	    int rowNo3 = 0;
	    
	    System.out.println("???");
	    
	    CellStyle headStyle3 = wb.createCellStyle();
	    
	    headStyle3.setBorderTop(BorderStyle.THIN);
	    headStyle3.setBorderBottom(BorderStyle.THIN);
	    headStyle3.setBorderLeft(BorderStyle.THIN);
	    headStyle3.setBorderRight(BorderStyle.THIN);
	    
	    headStyle3.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_25_PERCENT.getIndex());
	    headStyle3.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    headStyle3.setAlignment(HorizontalAlignment.CENTER);
	    
	    CellStyle bodyStyle3 = wb.createCellStyle();
	    bodyStyle3.setBorderTop(BorderStyle.THIN);
	    bodyStyle3.setBorderBottom(BorderStyle.THIN);
	    bodyStyle3.setBorderLeft(BorderStyle.THIN);
	    bodyStyle3.setBorderRight(BorderStyle.THIN);
	    
	    XSSFCellStyle joinStyle2 = wb.createCellStyle();
	    joinStyle2.setFillForegroundColor(new XSSFColor(new Color(217, 225, 242)));
	    joinStyle2.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    joinStyle2.setBorderTop(BorderStyle.THIN);
	    joinStyle2.setBorderBottom(BorderStyle.THIN);
	    joinStyle2.setBorderLeft(BorderStyle.THIN);
	    joinStyle2.setBorderRight(BorderStyle.THIN);
	    
	    XSSFCellStyle uptakeStyle2 = wb.createCellStyle();
	    uptakeStyle2.setFillForegroundColor(new XSSFColor(new Color(255, 242, 204)));
	    uptakeStyle2.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    uptakeStyle2.setBorderTop(BorderStyle.THIN);
	    uptakeStyle2.setBorderBottom(BorderStyle.THIN);
	    uptakeStyle2.setBorderLeft(BorderStyle.THIN);
	    uptakeStyle2.setBorderRight(BorderStyle.THIN);
	    
	    int columnCnt3 = 0;
	    row3 = sheet3.createRow(rowNo3++);
	    
	    cell3 = row3.createCell(0);
	    cell3.setCellStyle(headStyle3);
	    cell3.setCellValue("아이디");
	    
	    cell3 = row3.createCell(++columnCnt3);
	    cell3.setCellStyle(headStyle3);
	    cell3.setCellValue("이름");
	    
	    cell3 = row3.createCell(++columnCnt3);
	    cell3.setCellStyle(headStyle3);
	    cell3.setCellValue("과제번호");
	    
	    cell3 = row3.createCell(++columnCnt3);
	    cell3.setCellStyle(headStyle3);
	    cell3.setCellValue("분류");
	    for (int i = 0; i < Namelist2.size(); i++)
	    {
	      System.out.println("----name--- :" + i + " / " + Namelist2.size());
	      
	      HashMap tempMap = (HashMap)Namelist2.get(i);
	      
	      columnCnt3 = 0;
	      row3 = sheet3.createRow(rowNo3++);
	      
	      cell3 = row3.createCell(0);
	      cell3.setCellStyle(joinStyle2);
	      cell3.setCellValue(tempMap.get("std_ur_userid")+"");
	      
	      cell3 = row3.createCell(++columnCnt3);
	      cell3.setCellStyle(joinStyle2);
	      cell3.setCellValue(tempMap.get("std_name")+"");
	      
	      cell3 = row3.createCell(++columnCnt3);
	      cell3.setCellStyle(joinStyle2);
	      cell3.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell3 = row3.createCell(++columnCnt3);
	      cell3.setCellStyle(joinStyle2);
	      cell3.setCellValue("참여도");
	      
	      columnCnt3 = 0;
	      row3 = sheet3.createRow(rowNo3++);
	      
	      cell3 = row3.createCell(0);
	      cell3.setCellStyle(uptakeStyle2);
	      cell3.setCellValue(tempMap.get("std_ur_userid")+"");
	      
	      cell3 = row3.createCell(++columnCnt3);
	      cell3.setCellStyle(uptakeStyle2);
	      cell3.setCellValue(tempMap.get("std_name")+"");
	      
	      cell3 = row3.createCell(++columnCnt3);
	      cell3.setCellStyle(uptakeStyle2);
	      cell3.setCellValue(tempMap.get("lab_num")+"");
	      
	      cell3 = row3.createCell(++columnCnt3);
	      cell3.setCellStyle(uptakeStyle2);
	      cell3.setCellValue("이해도");
	      
	      IdList2.add(tempMap.get("std_ur_userid")+"");
	    }
	    for (int j = 0; j < DateList2.size(); j++)
	    {
	      rowNo3 = 0;
	      
	      columnCnt3 = 4 + j;
	      row3 = sheet3.getRow(rowNo3++);
	      
	      cell3 = row3.createCell(columnCnt3);
	      cell3.setCellStyle(headStyle3);
	      cell3.setCellValue((String)DateList2.get(j));
	      
	      System.out.println((String)DateList2.get(j));
	      
	      UserRecordVo.setCLASS_TM((String)DateList2.get(j));
	      ModelMap RecordMap = this.userRecordService.getDateRecordList(UserRecordVo);
	      
	      List<HashMap> recordlist = (List)RecordMap.get("recordlist");
	      
	      int z = 0;
	      if (recordlist.size() > 0) {
	        for (int k = 0; k < IdList2.size(); k++)
	        {
	          System.out.println("k :" + k);
	          System.out.println("z : " + z);
	          
	          HashMap exploringMap = (HashMap)recordlist.get(z);
	          
	          Id2 = exploringMap.get("ur_userid")+"";
	          
	          System.out.println("Id2" + Id2);
	          
	          System.out.println("IdList2 : " + (String)IdList2.get(k));
	          if (((String)IdList2.get(k)).equals(Id2))
	          {
	            System.out.println("TRUE");
	            
	            row3 = sheet3.getRow(rowNo3++);
	            
	            cell3 = row3.createCell(columnCnt3);
	            cell3.setCellStyle(joinStyle2);
	            cell3.setCellValue(exploringMap.get("score_join")+"");
	            
	            row3 = sheet3.getRow(rowNo3++);
	            
	            cell3 = row3.createCell(columnCnt3);
	            cell3.setCellStyle(uptakeStyle2);
	            cell3.setCellValue(exploringMap.get("score_uptake")+"");
	            if (z < recordlist.size() - 1) {
	              z++;
	            }
	          }
	          else
	          {
	            System.out.println("FLASE");
	            
	            row3 = sheet3.getRow(rowNo3++);
	            
	            cell3 = row3.createCell(columnCnt3);
	            cell3.setCellStyle(joinStyle2);
	            cell3.setCellValue(" ");
	            
	            row3 = sheet3.getRow(rowNo3++);
	            
	            cell3 = row3.createCell(columnCnt3);
	            cell3.setCellStyle(uptakeStyle2);
	            cell3.setCellValue(" ");
	          }
	        }
	      } else {
	        for (int k = 0; k < IdList2.size(); k++)
	        {
	          row3 = sheet3.getRow(rowNo3++);
	          
	          cell3 = row3.createCell(columnCnt3);
	          cell3.setCellStyle(joinStyle2);
	          cell3.setCellValue(" ");
	          
	          row3 = sheet3.getRow(rowNo3++);
	          
	          cell3 = row3.createCell(columnCnt3);
	          cell3.setCellStyle(uptakeStyle2);
	          cell3.setCellValue(" ");
	        }
	      }
	    }
	    int ProgName = Integer.parseInt(ProgId);
	    
	    ProgName -= 2;
	    
	    ProgId = Integer.toString(ProgName);
	    
	    response.setContentType("ms-vnd/excel");
	    String excel_name_is = ProgId + "_기_전체리스트_";
	    excel_name_is = URLEncoder.encode(excel_name_is, "UTF-8");
	    response.setHeader("Content-Disposition", 
	      "attachment;filename=" + excel_name_is + ".xlsx");
	    
	    Cookie cookie = new Cookie("fileDownload", "true");
	    response.addCookie(cookie);
	    
	    wb.write(response.getOutputStream());
	    
	    wb.close();
	  }
		
	
}
