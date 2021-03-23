package egovframework.giftednote.user.exploring.Service.impl;

import java.util.List;

import egovframework.giftednote.user.exploring.model.UserExploringVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserExploringMapper")
public interface UserExploringMapper {

	public List<?> getList(UserExploringVo userExploringVo);

	public void setExplor(UserExploringVo userExploringVo);


}
