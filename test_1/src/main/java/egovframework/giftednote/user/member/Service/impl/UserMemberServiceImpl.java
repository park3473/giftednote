package egovframework.giftednote.user.member.Service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import egovframework.giftednote.user.member.Service.UserMemberService;
import egovframework.giftednote.user.member.model.UserMemberVo;


@Service("userMemberService")
@Transactional
public class UserMemberServiceImpl implements UserMemberService {
	
	@Resource(name = "UserMemberMapper")
	private UserMemberMapper UserMemberMapper;
	protected Log log = LogFactory.getLog(UserMemberServiceImpl.class);
	@Override
	public UserMemberVo getView(UserMemberVo userMembervo) {
		return UserMemberMapper.getView(userMembervo);
	}
	@Override
	public String getPW(UserMemberVo userMembervo) {
		// TODO Auto-generated method stub
		return UserMemberMapper.getPW(userMembervo);
	}
	@Override
	public void insertMember(UserMemberVo userMembervo) {
		// TODO Auto-generated method stub
		UserMemberMapper.insertMember(userMembervo);
		return;
	}
	

}
