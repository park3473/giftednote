package egovframework.giftednote.user.srce.Service.impl;

import java.util.List;

import egovframework.giftednote.user.srce.model.UserSrceVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserSrceMapper")
public interface UserSrceMapper {

	public List<?> getList(UserSrceVo userSrceVo);

	public List<?> getListAJAX(UserSrceVo userSrceVo);

}
