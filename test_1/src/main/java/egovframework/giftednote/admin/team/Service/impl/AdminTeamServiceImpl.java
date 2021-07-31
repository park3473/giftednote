package egovframework.giftednote.admin.team.Service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.giftednote.admin.team.Model.AdminTeamVo;
import egovframework.giftednote.admin.team.Service.AdminTeamService;


@Service
public class AdminTeamServiceImpl implements AdminTeamService {

	@Resource(name = "AdminTeamMapper")
	private AdminTeamMapper adminTeamMapper;
	
	@Override
	public ModelMap getALLList(AdminTeamVo adminTeamVo) {
		ModelMap model = new ModelMap();
		
		List<?> list = adminTeamMapper.getALLList(adminTeamVo);
		System.out.println("size : "+list.size());
		model.addAttribute("list",list);
		int itemtotalcount = adminTeamMapper.getALLListCnt(adminTeamVo);
		int itemCount = adminTeamVo.getITEM_COUNT();
		int itempage = adminTeamVo.getPAGE();
		PageVO pageVo = new PageVO(itemCount , itemtotalcount,itempage);
		if(pageVo.isItempagenext() == true) {
			model.put("itempagenext", "true");
		}else {
			model.put("itempagenext", "false");
		}
		model.put("page", pageVo.getItempage());
		model.put("itemCount", pageVo.getItemCount());
		model.put("itempagestart", pageVo.getItempagestart());
		model.put("itempageend", pageVo.getItempageend());
		model.put("itemtotalcount", pageVo.getItemtotalcount());
		model.put("itemtotalpage", pageVo.getItemtotalpage());
		
		
		return model;
	}

	@Override
	public ModelMap getTeamList(AdminTeamVo adminTeamVo) {
		// TODO Auto-generated method stub
		ModelMap model = new ModelMap();
		
		List<?> studentlist = adminTeamMapper.getStudentTeamList(adminTeamVo);
		
		List<?> leaderlist = adminTeamMapper.getLeaderTeamList(adminTeamVo);
		
		model.put("studentlist", studentlist);
		
		model.put("leaderlist", leaderlist);
		
		
		return model;
	}

	@Override
	public void setDelete(AdminTeamVo adminTeamVo) {
		// TODO Auto-generated method stub
		//System.out.println(adminTeamVo.getIDX());
		//System.out.println(adminTeamVo.getN_IDX());
		
		adminTeamMapper.setDelete(adminTeamVo);
		adminTeamMapper.setDeleteSRCE(adminTeamVo);
		adminTeamMapper.setDeleteRECORD(adminTeamVo);
		adminTeamMapper.setDeleteEXPLORING(adminTeamVo);
		
		
	}

}
