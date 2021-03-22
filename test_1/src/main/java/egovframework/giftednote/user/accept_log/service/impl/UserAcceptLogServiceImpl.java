package egovframework.giftednote.user.accept_log.service.impl;
 


import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import egovframework.giftednote.manager.accept_log.service.UserAcceptLogService;


@Service("UserAcceptLogService")
@Transactional
public class UserAcceptLogServiceImpl implements UserAcceptLogService {

	
	@Resource(name = "UserAcceptLogMapper")
	private UserAcceptLogMapper UserAcceptLogMapper;
	
	protected Log log = LogFactory.getLog(UserAcceptLogServiceImpl.class);

	@Override
	public void setLog(String clientIp) {
		// TODO Auto-generated method stub\
		UserAcceptLogMapper.setLog(clientIp);
		return;
	}
		
}
