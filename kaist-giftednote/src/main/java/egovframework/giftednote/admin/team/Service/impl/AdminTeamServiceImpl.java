package egovframework.giftednote.admin.team.Service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.giftednote.admin.team.Model.AdminTeamVo;
import egovframework.giftednote.admin.team.Service.AdminTeamService;
import egovframework.giftednote.user.srce.model.UserSrceVo;

@Service
public class AdminTeamServiceImpl implements AdminTeamService {

	@Resource(name="AdminTeamMapper")
	private AdminTeamMapper adminTeamMapper;
	
	@Override
	public ModelMap getALLList(AdminTeamVo adminTeamVo) {

		ModelMap model = new ModelMap();
	    
	    List<?> list = this.adminTeamMapper.getALLList(adminTeamVo);
	    System.out.println("size : " + list.size());
	    model.addAttribute("list", list);
	    int itemtotalcount = this.adminTeamMapper.getALLListCnt(adminTeamVo);
	    int itemCount = adminTeamVo.getITEM_COUNT();
	    int itempage = adminTeamVo.getPAGE();
	    PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);
	    if (pageVo.isItempagenext()) {
	      model.put("itempagenext", "true");
	    } else {
	      model.put("itempagenext", "false");
	    }
	    model.put("page", Integer.valueOf(pageVo.getItempage()));
	    model.put("itemCount", Integer.valueOf(pageVo.getItemCount()));
	    model.put("itempagestart", Integer.valueOf(pageVo.getItempagestart()));
	    model.put("itempageend", Integer.valueOf(pageVo.getItempageend()));
	    model.put("itemtotalcount", Integer.valueOf(pageVo.getItemtotalcount()));
	    model.put("itemtotalpage", Integer.valueOf(pageVo.getItemtotalpage()));
	    
	    return model;
		
	}

	@Override
	public ModelMap getTeamList(AdminTeamVo adminTeamVo) {
		ModelMap model = new ModelMap();
	    
	    List<?> studentlist = this.adminTeamMapper.getStudentTeamList(adminTeamVo);
	    
	    List<?> leaderlist = this.adminTeamMapper.getLeaderTeamList(adminTeamVo);
	    
	    model.put("studentlist", studentlist);
	    
	    model.put("leaderlist", leaderlist);
	    
	    return model;
	}

	@Override
	public void setDelete(AdminTeamVo adminTeamVo) {
		this.adminTeamMapper.setDelete(adminTeamVo);
	    this.adminTeamMapper.setDeleteSRCE(adminTeamVo);
	    this.adminTeamMapper.setDeleteRECORD(adminTeamVo);
	    this.adminTeamMapper.setDeleteEXPLORING(adminTeamVo);
	}

	@Override
	public ModelMap getSrceAllList(UserSrceVo userSrceVo) {
		 ModelMap model = new ModelMap();
		    
		 List<?> SrceAllList = this.adminTeamMapper.getSrceAllList(userSrceVo);
		    
		 model.put("list", SrceAllList);
		    
		 return model;
	}

}
