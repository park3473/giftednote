package egovframework.giftednote.user.member.Service.impl;

import egovframework.giftednote.user.member.model.UserMemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserMemberMapper")
public interface UserMemberMapper {
	public UserMemberVo getView(UserMemberVo userMemberVo);
	public String getPW(UserMemberVo userMemberVo);
	public void insertMember(UserMemberVo userMemberVo);
}
