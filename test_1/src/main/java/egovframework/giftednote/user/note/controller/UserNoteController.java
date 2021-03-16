package egovframework.giftednote.user.note.controller;

import java.io.IOException;

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
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.giftednote.user.member.Service.UserMemberService;
import egovframework.giftednote.user.note.model.UserNoteVo;
import egovframework.giftednote.user.note.service.UserNoteService;
import egovframework.giftednote.user.team.model.UserTeamVo;

@Controller
public class UserNoteController {

	@Autowired
	UserNoteService userNoteService;
	
	@Autowired
	UserMemberService userMemberService;
	
	
	
	private static final Logger Logger = LoggerFactory.getLogger(UserNoteController.class);
	
	@RequestMapping(value = "/note/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UserNoteVo") UserNoteVo UserNoteVo,
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

		UserNoteVo.setPAGE(Integer.parseInt(PAGE));
		UserNoteVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = UserNoteVo.getPAGE() * UserNoteVo.getITEM_COUNT();
		
		UserNoteVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		UserNoteVo.setOFFSET(pagelimit);
		UserNoteVo.setEMAIL(request.getParameter("EMAIL"));
		model = userNoteService.getList(UserNoteVo);
		
		
		model.put("SEARCH_TYPE", UserNoteVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", UserNoteVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", UserNoteVo);

		return new ModelAndView("view/note/main", "model", model);
	}
	
	@RequestMapping(value="/note/insert.do" , method = RequestMethod.GET)
	public ModelAndView InsertView(@ModelAttribute("UserNoteVo") UserNoteVo UserNoteVo, HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		String idx = request.getParameter("IDX");
		
		
		model = userMemberService.getListAll();
		
		return new ModelAndView("view/note/insert" , "model", model);
	}
	@RequestMapping(value="/note/insert.do" , method = RequestMethod.POST)
	public void InsertNote(@ModelAttribute("UserNoteVo") UserNoteVo UserNoteVo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		userNoteService.setNote(UserNoteVo);
		System.out.println(UserNoteVo.getN_IDX());
		response.getWriter().println(UserNoteVo.getN_IDX());
	}
	
	//team 인원 넣기
	@RequestMapping(value="/user/note/team_insert.do" , method = RequestMethod.POST)
	public void team_insert(@ModelAttribute("UserTeamVo") UserTeamVo UserTeamVo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		userNoteService.setTeam(UserTeamVo);
	}
	
	//detail 페이지 가기
	@RequestMapping(value="/note/insert.do" , method = RequestMethod.GET)
	public ModelAndView Detail(@ModelAttribute("UserNoteVo") UserNoteVo UserNoteVo, HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		String idx = request.getParameter("IDX");
		
		
		return new ModelAndView("view/note/insert" , "model", model);
	}
	
}
