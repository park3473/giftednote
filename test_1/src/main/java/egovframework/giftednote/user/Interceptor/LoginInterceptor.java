package egovframework.giftednote.user.Interceptor;

import java.util.Locale;

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

import egovframework.giftednote.manager.accept_log.service.UserAcceptLogService;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	@Value("#{DB['currentPrjName']}")
	public String currentPrjName;

	protected Log log = LogFactory.getLog(LoginInterceptor.class);


	@Autowired
	SessionLocaleResolver localeResolver;
	
	@Autowired
	UserAcceptLogService AcceptLogService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		boolean rtn = true;
		String langage = session.getAttribute("ssion_langage") + "";
		if(langage.equals("")
			|| langage.equals("null"))
		{
			session.setAttribute("ssion_langage", "kr");
			localeResolver.setDefaultLocale(Locale.KOREAN);
		}else
		{
			session.setAttribute("ssion_langage", langage);
			if(langage.equals("kr"))
			{
				localeResolver.setDefaultLocale(Locale.KOREAN);
			}else if(langage.equals("us"))
			{
				localeResolver.setDefaultLocale(Locale.US);
			}
			
		}
		
		session.setAttribute("requestURI", request.getRequestURI());
		
		
		//LOGIN 관려
		
		String check = (String) session.getAttribute("session_login");
		if(check == null) {
			rtn = false;
		}else if(!check.equals("ok")){
			rtn = false;
		}
		System.out.println("login_status:=="+rtn);
		if(rtn == false) {
			String url = request.getRequestURI();
			System.out.println(request.getRequestURI());
			if(request.getRequestURI().indexOf("/index.do") > -1 
				|| request.getRequestURI().indexOf("/login.do") > -1
				|| request.getRequestURI().indexOf("/admin/member/list.do") > -1 
				|| request.getRequestURI().indexOf("/admin/team/list.do") > -1 ){
					System.out.println("????");
			}else {
				log.info(" sendRedirect _login_ " + rtn);
				response.sendRedirect(request.getContextPath()+"/index.do");
				//response.sendRedirect(request.getContextPath()+"/index.do?URL="+request.getRequestURI());
				return false;
			}
		}
		
		
		String ip_test = (String) session.getAttribute("ip_session");
		System.out.println(ip_test);
		
		//ip얻기
		System.out.println("세션 아이피 확인"+ip_test);
		if(ip_test == null){
			String ip = request.getHeader("X-FORWARDED-FOR"); 
	        
	        //proxy 환경일 경우
	        if (ip == null || ip.length() == 0) {
	            ip = request.getHeader("Proxy-Client-IP");
	        }

	        //웹로직 서버일 경우
	        if (ip == null || ip.length() == 0) {
	            ip = request.getHeader("WL-Proxy-Client-IP");
	        }

	        if (ip == null || ip.length() == 0) {
	            ip = request.getRemoteAddr() ;
	        }
	        String clientIp = ip;
	        System.out.println("접속 한 아이피"+clientIp);
	        AcceptLogService.setLog(clientIp);
	        session.setAttribute("ip_session", clientIp);
	        return true;
		}
		
	

		return true;
		
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
