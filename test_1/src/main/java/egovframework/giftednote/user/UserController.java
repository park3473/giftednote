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
		String session_email = (String) session.getAttribute("session_email");
		if(session_login == "ok") {
			return "redirect:/note/list.do?EMAIL="+session_email;
		}
		
		return "view/index";
	}
	
	
}
