package egovframework.giftednote.admin.member.Controller;

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

import egovframework.giftednote.admin.member.Model.AdminMemberVo;
import egovframework.giftednote.admin.member.Service.AdminMemberService;

@Controller
public class AdminMemberController {
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	
	@Autowired
	AdminMemberService adminMemberService;
	
	@RequestMapping(value="/admin/member/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminMemberList(@ModelAttribute("AdminMemberVo") AdminMemberVo AdminMemberVo ,HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		model = adminMemberService.getALLList();
		System.out.println("dddd");
		return new ModelAndView("admin/member/list","model",model);
	}

}
