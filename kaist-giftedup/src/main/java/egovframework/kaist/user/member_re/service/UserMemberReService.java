package egovframework.kaist.user.member_re.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.member_re.model.AdminReMemberVo;
import egovframework.kaist.user.member_re.model.UserMemberReVo;
import egovframework.kaist.user.school.model.UserSchoolVo;

public interface UserMemberReService {

	public int setInsert(UserMemberReVo userMember_reDomain);

	public boolean setUpdate(UserMemberReVo userMember_reDomain);
	
	public boolean setDelete(UserMemberReVo userMember_reDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getMember_reIdCheck(String member_reId);

	public ModelMap getList(UserMemberReVo adminMember_reVo);

	public ModelMap getschool(UserSchoolVo userSchoolVo);

	public ModelMap getStudent(UserMemberReVo userMember_reVo);

	public void Update(UserMemberReVo userMember_reVo);

	public void completion(UserMemberReVo userMember_reVo);

	public String pass_check(UserMemberReVo userMember_reVo);

	public ModelMap getDcmntTypes();

	public ModelMap getDcmnt_name(String eligibility);

	public List<AdminReMemberVo> getReCheck(AdminReMemberVo adminReMemberVo);




}
