package egovframework.giftednote.user.member.Service;

import egovframework.giftednote.user.member.model.UserMemberVo;

public interface UserMemberService {
	public UserMemberVo getView(UserMemberVo userMembervo);
	public String getPW(UserMemberVo userMembervo);
	public void insertMember(UserMemberVo userMembervo);
}

