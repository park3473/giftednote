package egovframework.giftednote.admin.member.Service.impl;

import java.util.List;

import egovframework.giftednote.admin.member.Model.AdminMemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("AdminMemberMapper")
public interface AdminMemberMapper {

	public List<?> getList();

	public void setMember(AdminMemberVo adminMemberVo);

	
}
