package egovframework.giftednote.user.srce.Service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.srce.model.UserSrceVo;

public interface UserSrceService {

	public ModelMap getList(UserSrceVo userSrceVo);

	public List<?> getListAJAX(UserSrceVo userSrceVo);

}
