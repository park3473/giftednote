package egovframework.giftednote.user.accept_log.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
         
@Mapper("UserAcceptLogMapper")
public interface UserAcceptLogMapper {

	public void setLog(String clientIp);

	
}
