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
		
		return userExploringMapper.getClassCheck(userExploringVo);
	}

	@Override
	public void setExploringDelete(UserExploringVo userExploringVo) {
		
		userExploringMapper.setExploringDelete(userExploringVo);
		
	}

	@Override
	public ModelMap getDateExploringList(UserExploringVo userExploringVo) {
		
		ModelMap modelMap = new ModelMap();
	    List<?> exploringlist = this.userExploringMapper.getDateExploringList(userExploringVo);
	    
	    modelMap.put("exploringlist", exploringlist);
	    
	    return modelMap;
		
	}

	@Override
	public ModelMap getNameAll(UserExploringVo userExploringVo) {
		ModelMap modelMap = new ModelMap();
	    
	    List<?> namelist = this.userExploringMapper.getAllNameList(userExploringVo);
	    
	    modelMap.put("namelist", namelist);
	    
	    return modelMap;
	}
}
