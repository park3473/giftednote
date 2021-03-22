package egovframework.giftednote.user.exploring.Service;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.exploring.model.UserExploringVo;

public interface UserExploringService {

	public ModelMap getList(UserExploringVo UserExploringVo);

}
