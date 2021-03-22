package egovframework.giftednote.user.record.Service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.record.Service.UserRecordService;
import egovframework.giftednote.user.record.model.UserRecordVo;

@Service("UserRecordService")
public class UserRecordServiceImpl implements UserRecordService {
	
	@Resource(name = "UserRecordMapper")
	private UserRecordMapper userrecordmapper;

	@Override
	public ModelMap getList(UserRecordVo userRecordVo) {
		// TODO Auto-generated method stub
		ModelMap modelMap = new ModelMap();
		List<?> list = userrecordmapper.getList(userRecordVo);
		List<?> teamlist = userrecordmapper.getTeamList(userRecordVo);
		int teamcount = userrecordmapper.getTeamCount(userRecordVo);
		int daycount = userrecordmapper.getDayCount(userRecordVo);
		List<?> daylist = userrecordmapper.getDayList(userRecordVo);
		
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("teamlist", teamlist);
		modelMap.addAttribute("daylist", daylist);
		modelMap.put("teamcount",teamcount);
		modelMap.put("daycount", daycount);
		
		
		return modelMap;
	}

	@Override
	public void setRecord(UserRecordVo userRecordVo) {
		// TODO Auto-generated method stub
		userrecordmapper.setRecord(userRecordVo);
	}

}
