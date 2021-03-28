package egovframwork.giftednote.admin.member.Servic.Impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("AdminMemberMapper")
public interface AdminMemberMapper {

	public List<?> getALLList();

	
}
