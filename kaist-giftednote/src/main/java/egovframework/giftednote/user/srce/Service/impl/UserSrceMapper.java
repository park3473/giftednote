package egovframework.giftednote.user.srce.Service.impl;

import java.util.List;

import egovframework.giftednote.user.srce.model.UserSrceVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserSrceMapper")
public interface UserSrceMapper {

	public List<?> getList(UserSrceVo userSrceVo);

	public List<?> getListAJAX(UserSrceVo userSrceVo);

	public int getTeamCount(UserSrceVo userSrceVo);

	public void setInsert(UserSrceVo userSrceVo);

	public void setUpdate(UserSrceVo userSrceVo);

	public String getLabName(UserSrceVo userSrceVo);

	public List<?> getTeamList(UserSrceVo userSrceVo);

	public List<?> getScoreList(UserSrceVo userSrceVo);

}
