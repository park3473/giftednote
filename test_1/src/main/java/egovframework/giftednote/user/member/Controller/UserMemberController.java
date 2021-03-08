package egovframework.giftednote.user.member.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.giftednote.user.member.Service.UserMemberService;
import egovframework.giftednote.user.member.model.UserMemberVo;

@Controller
public class UserMemberController {
	
	
	@Autowired
	UserMemberService UserMemberService;
	
	private static final Logger Logger = LoggerFactory.getLogger(UserMemberController.class);
	
	@RequestMapping(value="/user/member/login.do" , method = RequestMethod.POST)
	public ModelAndView MemberLogin(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) {
		System.out.println(userMembervo.getEMAIL());
		System.out.println(userMembervo.getPASSWORD());
		ModelMap model = new ModelMap();
		
		UserMemberVo userMembervo2 = UserMemberService.getView(userMembervo);
		//System.out.println(userMembervo2);
		if(userMembervo2 == null) {
			System.out.println("로그인 실패");
			return new ModelAndView("view/index" , "check" , "fail");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("session_login", "ok");
			session.setAttribute("session_email", userMembervo.getEMAIL());

			return new ModelAndView("view/note/main" , "check" , "ture");
		}
	}
	@RequestMapping(value="/user/member/pw_re.do" , method = RequestMethod.POST)
	public ModelAndView MemberPwRe(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		String pw = UserMemberService.getPW(userMembervo);
		System.out.println(pw);
		return new ModelAndView("view/index" , "PASSWORD" , pw);
	}
	@RequestMapping(value="/user/member/register.do" , method = RequestMethod.GET)
	public ModelAndView MemberRegister(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("view/member/register");
	}
	@RequestMapping(value="/user/member/register.do" , method = RequestMethod.POST)
	public ModelAndView Register(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response){
		
		UserMemberService.insertMember(userMembervo);
		return new ModelAndView("view/index");
	}
	
	@RequestMapping(value="/user/member/view.do" ,  method = RequestMethod.POST)
	public ModelAndView MemberView(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("view/index");
	}
	
}
