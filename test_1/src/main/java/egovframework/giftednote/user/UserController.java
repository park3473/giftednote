package egovframework.giftednote.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {


	private static final Logger Logger = LoggerFactory.getLogger(UserController.class);
	

	
	
	
	@RequestMapping(value = {"/view/index.do", "/index.do", "/"}, method = RequestMethod.GET)
	public String buseo(HttpServletRequest request, HttpServletResponse response
			 ) {
		HttpSession session = request.getSession();
		//로그인 테스트
		String session_login = (String) session.getAttribute("session_login");
		String session_user_id = (String) session.getAttribute("session_id");
		String session_user_type = (String) session.getAttribute("session_level");
		String type = "no";
		if(session_user_type == "1") {
			type = "student";
		}else if(session_user_type == "2") {
			type ="mento";
		}
		if(session_login == "ok") {
			return "redirect:/note/list.do?USER_ID="+session_user_id+"&TYPE="+type;
		}
		
		if(session.getAttribute("session_level") == "99") {
			return "redirect:/admin/member/list.do";
		}
		
		return "index";
	}
	
	@RequestMapping(value="/test.do" , method = RequestMethod.GET)
	public String test(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "/";
	}
	
	
	
	
}
