package egovframework.giftednote.admin.member.Service;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.admin.member.Model.AdminMemberVo;

public interface AdminMemberService {

	public ModelMap getALLList();

	public void setMember(AdminMemberVo adminMemberVo);
	
}
