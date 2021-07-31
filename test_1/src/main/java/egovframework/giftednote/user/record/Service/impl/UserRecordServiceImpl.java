package egovframework.giftednote.user.record.Service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
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

	@Override
	public ModelMap getTeam(UserRecordVo userRecordVo) {
		
		ModelMap modelMap = new ModelMap();
		
		List<?> teammodel = userrecordmapper.getTeam(userRecordVo);
		System.out.println(teammodel.size());
		for(int i =0; i < teammodel.size(); i++) {
			System.out.println(teammodel.get(i));
			HashMap dd = (HashMap) teammodel.get(i);
			System.out.println(dd.get("IDX"));
			String dsadas = String.valueOf( dd.get("IDX"));
			System.out.println(dsadas);
			userRecordVo.setIDX(dsadas);
			System.out.println(userRecordVo.getIDX());
			System.out.println("====3===");
			List<?> forlist = userrecordmapper.getForTeam(userRecordVo);
			System.out.println("===2===");
			
			modelMap.put("ForTeamList"+i+"", forlist);
		}
		
		return modelMap;
	}


	@Override
	public ModelMap getTeamNameDay(UserRecordVo userRecordVo) {
		ModelMap modelMap = new ModelMap();
		
		List<?> DayList = userrecordmapper.getDayList(userRecordVo);
		List<?> TeamList = userrecordmapper.getTeamList(userRecordVo);
		
		for(int i = 0; i < TeamList.size(); i++) {
			HashMap TeamIDX = (HashMap) TeamList.get(i);
			userRecordVo.setIDX(String.valueOf(TeamIDX.get("ur_id")));
			List<?> forlist = userrecordmapper.getForTeam(userRecordVo);
			modelMap.put("ScoreList"+i+"", forlist);
		}
		
		modelMap.put("DayList", DayList);
		modelMap.put("TeamList", TeamList);
		
		return modelMap;
	}

	@Override
	public void setRecordUpdate(UserRecordVo userRecordVo) {
		// TODO Auto-generated method stub
		userrecordmapper.setRecordUpdate(userRecordVo);
	}

	@Override
	public int getClassCheck(UserRecordVo userRecordVo) {
		// TODO Auto-generated method stub
		int count = userrecordmapper.getClassCheck(userRecordVo);
		
		return count;
	}

	@Override
	public void setRecordDelete(UserRecordVo userRecordVo) {
		// TODO Auto-generated method stub
		userrecordmapper.setRecordDelete(userRecordVo);
	}

}
