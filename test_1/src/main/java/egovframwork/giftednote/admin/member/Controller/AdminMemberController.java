package egovframwork.giftednote.admin.member.Controller;

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

import egovframework.giftednote.user.member.model.UserMemberVo;
import egovframwork.giftednote.admin.member.Model.AdminMemberVo;
import egovframwork.giftednote.admin.member.Service.AdminMemberService;

@Controller
public class AdminMemberController {
	
	@Autowired
	AdminMemberService adminMemberService;

	
	@RequestMapping(value="/user/dddd.do" , method = RequestMethod.GET)
	public ModelAndView AdminMemberList(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo ,HttpServletRequest request, HttpServletResponse response ) {
		System.out.println("---1---");
		ModelMap model = new ModelMap();
		
		model = adminMemberService.getALLList();
		System.out.println("----2---");
		return new ModelAndView("view/admin/member" , "model",model);
		
	
	}
	
	@RequestMapping(value="/admin/member/register.do" , method = RequestMethod.GET)
	public ModelAndView MemberRegister(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("view/member/register");
	}
	
	
	
}
