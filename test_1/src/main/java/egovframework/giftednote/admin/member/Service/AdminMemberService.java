package egovframework.giftednote.admin.member.Service;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.admin.member.Model.AdminInquiryVo;
import egovframework.giftednote.admin.member.Model.AdminMemberVo;

public interface AdminMemberService {

	public ModelMap getALLList(AdminMemberVo adminMemberVo);

	public void setMember(AdminMemberVo adminMemberVo);

	public void setDelete(AdminMemberVo adminMemberVo);

	public ModelMap getAllInquiryList(AdminInquiryVo adminInquiryVo);

	public ModelMap getInquiry(AdminInquiryVo adminInquiryVo);

	public void SetInquiry(AdminInquiryVo adminInquiryVo);

	public void SetInsert(AdminMemberVo adminMemberVo);

	public int IdCheck(AdminMemberVo adminMemberVo);

	public ModelMap getALLMEMBER();
	
}
