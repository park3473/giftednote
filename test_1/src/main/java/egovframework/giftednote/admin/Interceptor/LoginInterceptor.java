package egovframework.giftednote.admin.Interceptor;

import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	@Value("#{DB['currentPrjName']}")
	public String currentPrjName;

	protected Log log = LogFactory.getLog(LoginInterceptor.class);


	@Autowired
	SessionLocaleResolver localeResolver;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		
		HttpSession session = request.getSession();
		session.setAttribute("requestURI", request.getRequestURI());
		String ip = (String) session.getValue("ip_session");
		
		ip = "115.91.131.154";
		
		//접속 가능한 아이피들 목록
		String[] adminip = {"115.91.131.154",""};
		
		boolean what = false;
		
		what = Arrays.asList(adminip).contains(ip);
		
		
		
		if(what)
		{
			if(session.getAttribute("session_login") == "ok") {
				
				
				
			}else {
				
				session.setAttribute("session_login", "ok");
				session.setAttribute("session_name", "관리자");
				session.setAttribute("session_id", "관리자");
				session.setAttribute("session_ip", ip);
				session.setAttribute("session_level", "99");
				session.setAttribute("session_type", "admin");
			}
			
			
			return true;
			
			
		}else 
		{
			response.setContentType("text/html; charset=utf-8");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('허용된 IP로 접속해주시기 바랍니다.'); location.href='/index.do';</script>");
			out.flush();
			
			return false;
		}
		
		
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("======================================           END          ======================================\n");
		}
	}
	
	

}
