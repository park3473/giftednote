package egovframework.giftednote.user.srce.Service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.srce.model.UserSrceVo;

public interface UserSrceService {

	public ModelMap getList(UserSrceVo userSrceVo);

	public List<?> getListAJAX(UserSrceVo userSrceVo);

	public void setInsert(UserSrceVo userSrceVo);

	public void setUpdate(UserSrceVo userSrceVo);

	public String getLabName(UserSrceVo userSrceVo);

	public ModelMap getTeamList(UserSrceVo userSrceVo);

}
