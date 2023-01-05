package egovframework.giftednote.user.member.Service.impl;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.member.model.SchoolVo;
import egovframework.giftednote.user.member.model.UserMemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserMemberMapper")
public interface UserMemberMapper {
	public UserMemberVo getView(UserMemberVo userMemberVo);
	
	public String getPW(UserMemberVo userMemberVo);
	
	public void insertMember(UserMemberVo userMemberVo);
	
	public List<?> getListAll();
	
	public List<?> getList(UserMemberVo userMembervo);

	public UserMemberVo getMyInfo(UserMemberVo userMemberVo);

	public void setMyInfo(UserMemberVo userMemberVo);

	public List<?> getSchool(SchoolVo schoolVo);

	public int setCheckId(UserMemberVo userMemberVo);
}
