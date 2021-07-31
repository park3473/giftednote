package egovframework.giftednote.user.srce.Service.impl;

import java.util.HashMap;
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

	@Override
	public void setInsert(UserSrceVo userSrceVo) {
		// TODO Auto-generated method stub
		userSrceMapper.setInsert(userSrceVo);
	}

	@Override
	public void setUpdate(UserSrceVo userSrceVo) {
		// TODO Auto-generated method stub
		userSrceMapper.setUpdate(userSrceVo);
	}

	@Override
	public ModelMap getTeamList(UserSrceVo userSrceVo) {
		ModelMap model = new ModelMap();
		
		List<?> TeamName = userSrceMapper.getTeamList(userSrceVo);
		model.put("TeamList", TeamName);
		
		
		for(int i = 0; i < TeamName.size(); i++) {
			HashMap hashmap = (HashMap) TeamName.get(i);
			
			String IDX = String.valueOf(hashmap.get("ur_id"));
			System.out.println(String.valueOf(hashmap.get("ur_id")));
			userSrceVo.setIDX(IDX);
			System.out.println(IDX);
			List<?> ScoreList = userSrceMapper.getScoreList(userSrceVo);
			
			model.put("TeamScoreList"+i+"", ScoreList);
		}
		
		
		
		return model;
	}
}
