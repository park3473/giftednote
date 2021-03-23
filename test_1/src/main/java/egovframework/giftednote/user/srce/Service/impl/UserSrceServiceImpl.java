package egovframework.giftednote.user.srce.Service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.srce.Service.UserSrceService;
import egovframework.giftednote.user.srce.model.UserSrceVo;

@Service("UserSrceService")
public class UserSrceServiceImpl implements UserSrceService {
	@Resource(name = "UserSrceMapper")
	private UserSrceMapper userSrceMapper;

	@Override
	public ModelMap getList(UserSrceVo userSrceVo) {
		// TODO Auto-generated method stub
		ModelMap model = new ModelMap();
		List<?> list = userSrceMapper.getList(userSrceVo);
		System.out.println("---size--:"+list.size());
		model.addAttribute("list", list);
		
		return model;
	}

	@Override
	public List<?> getListAJAX(UserSrceVo userSrceVo) {
		// TODO Auto-generated method stub
		return userSrceMapper.getListAJAX(userSrceVo);
	}
}
