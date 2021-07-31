package egovframework.giftednote.admin.team.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import egovframework.giftednote.admin.team.Model.AdminTeamVo;
import egovframework.giftednote.admin.team.Service.AdminTeamService;



@Controller
public class AdminTeamController {
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminTeamController.class);
	
	
	@Autowired
	AdminTeamService adminTeamService;
	
	
	@RequestMapping(value="admin/team/note_list.do" , method = RequestMethod.GET)
	public ModelAndView AdminTeamList(@ModelAttribute("AdminTeamVo") AdminTeamVo adminTeamVo , HttpServletRequest request, HttpServletResponse response) {
		String PAGE = request.getParameter("PAGE") != null ? request.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request.getParameter("ITEM_COUNT") : "10";
			
		if(PAGE == null)
		{
			PAGE = "0";
		}
		
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}
		
		adminTeamVo.setPAGE(Integer.parseInt(PAGE));
		adminTeamVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminTeamVo.getPAGE() * adminTeamVo.getITEM_COUNT();
		
		adminTeamVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminTeamVo.setOFFSET(pagelimit);
		
		model = adminTeamService.getALLList(adminTeamVo);
		
		/*
		 * controller 테스트
		response.setContentType("text/html; charset=euc-kr");
		response.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('controller 자바스크립트 테스트')</script>");
		out.flush();
		*/
		model.put("beforeDomain", adminTeamVo);
		
		return new ModelAndView("/admin/note/list","model",model);
	}
	
	//teamList 가져오기
	@RequestMapping(value="/admin/team/getTeamList.do" , method = RequestMethod.GET)
	public ModelAndView GetTeamList(@ModelAttribute("AdminTeamVo") AdminTeamVo adminTeamVo , HttpServletRequest request, HttpServletResponse response){
		ModelMap model = new ModelMap();
		
		adminTeamVo.setLab_id(request.getParameter("lab_id"));
		
		model = adminTeamService.getTeamList(adminTeamVo);
		
		
		return new ModelAndView("/admin/note/teamlist","model",model);
		
	}
	
	@RequestMapping(value="/admin/team/delete.do" , method = RequestMethod.POST)
	public void teamdelete(@ModelAttribute("AdminTeamVo") AdminTeamVo adminTeamVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		adminTeamService.setDelete(adminTeamVo);
		
		PrintWriter out = response.getWriter();
		out.println(true);
		
	}
	
}
