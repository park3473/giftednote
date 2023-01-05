package egovframework.giftednote.admin.member.Service.impl;

import java.util.List;

import egovframework.giftednote.admin.member.Model.AdminMemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("AdminMemberMapper")
public interface AdminMemberMapper {

	public List<?> getList();

	public void setMember(AdminMemberVo adminMemberVo);

	public List<?> getStudentList(AdminMemberVo adminMemberVo);

	public int getStudentListCnt(AdminMemberVo adminMemberVo);

	public List<?> getLeaderList(AdminMemberVo adminMemberVo);

	public int getLeaderListCnt(AdminMemberVo adminMemberVo);

	public void setDelete(AdminMemberVo adminMemberVo);

	public void setTeamDelete(AdminMemberVo adminMemberVo);

	public void setRecordDelete(AdminMemberVo adminMemberVo);

	public void setSrceDelete(AdminMemberVo adminMemberVo);

	public void setExploringDelete(AdminMemberVo adminMemberVo);

	public int IdCheck(AdminMemberVo adminMemberVo);

	public List<?> getALLMEMBER();

	public void SetInsert(AdminMemberVo vo);

	
}
