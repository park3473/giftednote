package egovframework.giftednote.user.exploring.Service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.exploring.Service.UserExploringService;
import egovframework.giftednote.user.exploring.model.UserExploringVo;

@Service("UserExploringService")
public class UserExploringServiceImpl implements UserExploringService {
	@Resource(name = "UserExploringMapper")
	private UserExploringMapper userExploringMapper;

	@Override
	public ModelMap getList(UserExploringVo UserExploringVo) {
		// TODO Auto-generated method stub
		ModelMap modelMap = new ModelMap();
		List<?> list = userExploringMapper.getList(UserExploringVo);
		
		modelMap.addAttribute("list", list);
		
		return modelMap;
	}

	@Override
	public void setExplor(UserExploringVo userExploringVo) {
		// TODO Auto-generated method stub
		userExploringMapper.setExplor(userExploringVo);
	}

	@Override
	public int getClassCheck(UserExploringVo userExploringVo) {
		// TODO Auto-generated method stub
		return userExploringMapper.getClassCheck(userExploringVo);
	}

	@Override
	public void setExploringDelete(UserExploringVo userExploringVo) {
		// TODO Auto-generated method stub
		userExploringMapper.setExploringDelete(userExploringVo);
	}
}
