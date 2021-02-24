package egovframework.firequiz.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		
		System.out.println("????");
		return "view/index";
	}
	
	
}
