package egovframework.giftednote.user.member.Controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.enterprise.inject.Model;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.giftednote.user.member.Service.UserMemberService;
import egovframework.giftednote.user.member.model.SchoolVo;
import egovframework.giftednote.user.member.model.UserMemberVo;

@Controller
public class UserMemberController {
	
	
	@Autowired
	UserMemberService userMemberService;
	
	private static final Logger Logger = LoggerFactory.getLogger(UserMemberController.class);
	
	@RequestMapping(value="/user/member/login.do" , method = RequestMethod.POST)
	public void MemberLogin(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) {
		System.out.println(userMembervo.getEMAIL());
		System.out.println(userMembervo.getPASSWORD());
		ModelMap model = new ModelMap();
		
		UserMemberVo userMembervo2 = userMemberService.getView(userMembervo);
		//System.out.println(userMembervo2);
		if(userMembervo2 == null) {
			Logger.debug("이메일 혹은 패스워드를 재확인 해주십시오.");
			try {
				response.getWriter().println("false:-1");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			System.out.println(userMembervo2.getIDX());
			Logger.debug("로그인 성공 하였습니다.");
			HttpSession session = request.getSession();
			session.setAttribute("session_login", "ok");
			session.setAttribute("session_idx", userMembervo2.getIDX());
			session.setAttribute("session_email", userMembervo2.getEMAIL());
			session.setAttribute("session_name", userMembervo2.getNAME());
			session.setAttribute("session_level", userMembervo2.getLEVEL());
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@RequestMapping(value="/user/member/pw_re.do" , method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String MemberPwRe(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		String pw = userMemberService.getPW(userMembervo);
		System.out.println(pw);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(pw);
		return jsonStr;
	}
	
	@RequestMapping(value="/user/member/register.do" , method = RequestMethod.GET)
	public ModelAndView MemberRegister(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("user/member/register");
	}
	
	@RequestMapping(value="/user/member/logout.do" , method = RequestMethod.GET)
	public String MemberLogOut(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		session.setAttribute("session_login", null);
		session.setAttribute("session_idx",null);
		session.setAttribute("session_email", null);
		session.setAttribute("session_name", null);
		session.setAttribute("session_level", null);
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/user/member/register.do" , method = RequestMethod.POST)
	public ModelAndView Register(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response){
		
		userMemberService.insertMember(userMembervo);
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/user/member/view.do" ,  method = RequestMethod.POST)
	public ModelAndView MemberView(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/user/member/search.do" ,  method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String search(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		List<?> list = userMemberService.getList(userMembervo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	
	@RequestMapping(value="/user/myinfo/view.do" , method = RequestMethod.GET)
	public ModelAndView MyInfoView(@ModelAttribute("UserMemberVo")UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response) {
		UserMemberVo.setEMAIL(request.getParameter("EMAIL"));
		UserMemberVo userMember = userMemberService.getMyInfo(UserMemberVo);
		return new ModelAndView("user/myinfo/view" , "model" , userMember);
	}
	
	@RequestMapping(value="/user/myinfo/update.do" , method = RequestMethod.POST)
	public void MyInfoUpdate(@ModelAttribute("UserMemberVo")UserMemberVo UserMemberVo,HttpServletRequest request , HttpServletResponse response) throws IOException {
		userMemberService.setMyInfo(UserMemberVo);
		response.getWriter().println("true");
	}
	
	@RequestMapping(value="/user/school.do" , method = RequestMethod.GET)
	public ModelAndView School(@ModelAttribute("SchoolVo") SchoolVo SchoolVo , HttpServletRequest request , HttpServletResponse response) {
		
		 ModelMap model = new ModelMap();
		    
		    model = userMemberService.getSchool(SchoolVo);
		    
		    return new ModelAndView("user/member/school", "model", model);
		
	}
	
	@RequestMapping(value="/user/member/id_check.do" , method = RequestMethod.POST)
	@ResponseBody
	public void ID_CHECK(@ModelAttribute("UserMemberVo") UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		int result = userMemberService.setCheckId(UserMemberVo);
		
		if(result == 1) {
			PrintWriter out = response.getWriter();
			out.println(false);
		}
		else if(result == 0) {
			PrintWriter out = response.getWriter();
			out.print(true);
		}
		else {
			
			PrintWriter out = response.getWriter();
			out.println("오류");
					
		}
		
	}
	
	@RequestMapping(value = "/user/member/check.do" , method = RequestMethod.GET)
	public String Check(HttpServletRequest request , HttpServletResponse response) {
		
		return "/user/member/check";
		
	}
	
	@RequestMapping(value="/user/member/sms_test" , method = RequestMethod.GET)
	public String sms_test(HttpServletRequest request , HttpServletResponse response) {
		System.out.println("dd");
		
		return "redirect:/";
	}
	
	
}
