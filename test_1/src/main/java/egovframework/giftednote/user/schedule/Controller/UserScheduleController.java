package egovframework.giftednote.user.schedule.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import egovframework.giftednote.user.schedule.Service.UserScheduleService;

@Controller
public class UserScheduleController {

	@Autowired
	UserScheduleService userScheduleService;
	
	private static final Logger Logger = LoggerFactory.getLogger(UserScheduleController.class);
	
	
	
	
}
