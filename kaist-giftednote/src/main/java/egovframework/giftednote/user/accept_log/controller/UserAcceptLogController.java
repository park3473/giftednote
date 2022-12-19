package egovframework.giftednote.user.accept_log.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import egovframework.giftednote.manager.accept_log.service.UserAcceptLogService;

@Controller
public class UserAcceptLogController {

	@Autowired
	UserAcceptLogService UserAcceptLogService;
	
	protected Log log = LogFactory.getLog(UserAcceptLogController.class);
	
	
	
}
