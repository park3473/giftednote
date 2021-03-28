package egovframework.giftednote.admin.member.Service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("AdminMemberMapper")
public interface AdminMemberMapper {

	public List<?> getList();

	
}
