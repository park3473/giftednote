package egovframework.giftednote.admin.member.Service;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.admin.member.Model.AdminMemberVo;

public interface AdminMemberService {

	public ModelMap getALLList(AdminMemberVo adminMemberVo);

	public void setMember(AdminMemberVo adminMemberVo);

	public void setDelete(AdminMemberVo adminMemberVo);

	public int IdCheck(AdminMemberVo adminMemberVo);

	public void SetInsert(AdminMemberVo vo);

	public ModelMap getALLMEMBER();
	
}
