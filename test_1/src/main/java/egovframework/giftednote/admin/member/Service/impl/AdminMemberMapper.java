package egovframework.giftednote.admin.member.Service.impl;

import java.util.List;

import egovframework.giftednote.admin.member.Model.AdminInquiryVo;
import egovframework.giftednote.admin.member.Model.AdminMemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("AdminMemberMapper")
public interface AdminMemberMapper {

	public List<?> getList(AdminMemberVo adminMemberVo);

	public void setMember(AdminMemberVo adminMemberVo);

	public int getListCnt(AdminMemberVo adminMemberVo);

	public void setDelete(AdminMemberVo adminMemberVo);

	public void setTeamDelete(AdminMemberVo adminMemberVo);

	public void setRecordDelete(AdminMemberVo adminMemberVo);

	public void setSrceDelete(AdminMemberVo adminMemberVo);

	public void setExploringDelete(AdminMemberVo adminMemberVo);

	public List<?> getInquiryList(AdminInquiryVo adminInquiryVo);

	public int getInquiryListCnt(AdminInquiryVo adminInquiryVo);

	public AdminInquiryVo getInquiry(AdminInquiryVo adminInquiryVo);

	public void setInquiry(AdminInquiryVo adminInquiryVo);

	public void SetInsert(AdminMemberVo adminMemberVo);

	public int IdCheck(AdminMemberVo adminMemberVo);

	public List<?> getALLMEMBER();

	
}
