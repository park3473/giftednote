package egovframework.kaist.user.member_re.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.user.member_re.model.UserMemberReVo;
import egovframework.kaist.user.school.model.UserSchoolVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMember_reMapper")
public interface UserMemberReMapper {

	public List<?> getListAll();
	
	public int setInsert(UserMemberReVo userMember_reDomain);

	public boolean setUpdate(UserMemberReVo userMember_reDomain);

	public boolean setDelete(UserMemberReVo userMember_reDomain) ;

	public UserMemberReVo getView(String Id) ;

	public List<?> getList(UserMemberReVo userMember_reVo);

	public int getListCnt(UserMemberReVo userMember_reVo);

	public List<?> getschool(UserSchoolVo userSchoolVo);

	public UserMemberReVo getStudent(UserMemberReVo userMember_reVo);

	public void Update(UserMemberReVo userMember_reVo);

	public UserMemberReVo getMentor(UserMemberReVo userMember_reVo);

	public void completion(UserMemberReVo userMember_reVo);

	public String pass_check(UserMemberReVo userMember_reVo);

	
}
