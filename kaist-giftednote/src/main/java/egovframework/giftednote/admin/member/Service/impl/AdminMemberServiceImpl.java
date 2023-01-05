package egovframework.giftednote.admin.member.Service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.giftednote.admin.member.Model.AdminMemberVo;
import egovframework.giftednote.admin.member.Service.AdminMemberService;


@Service("AdminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

		@Resource(name = "AdminMemberMapper")
		private AdminMemberMapper adminMemberMapper;

		@Override
		public void setMember(AdminMemberVo adminMemberVo) {
			// TODO Auto-generated method stub
			adminMemberMapper.setMember(adminMemberVo);
		}

		@Override
		public ModelMap getALLList(AdminMemberVo adminMemberVo) {
			ModelMap modelMap = new ModelMap();
		    
		    System.out.println(adminMemberVo.getLIMIT());
		    System.out.println(adminMemberVo.getOFFSET());
		    
		    int itemtotalcount = 0;
		    if (adminMemberVo.getUr_level().equals("2"))
		    {
		      List<?> list = this.adminMemberMapper.getStudentList(adminMemberVo);
		      modelMap.addAttribute("list", list);
		      itemtotalcount = this.adminMemberMapper.getStudentListCnt(adminMemberVo);
		    }
		    else if (adminMemberVo.getUr_level().equals("3"))
		    {
		      List<?> list = this.adminMemberMapper.getLeaderList(adminMemberVo);
		      modelMap.addAttribute("list", list);
		      itemtotalcount = this.adminMemberMapper.getLeaderListCnt(adminMemberVo);
		    }
		    int itemCount = adminMemberVo.getITEM_COUNT();
		    int itempage = adminMemberVo.getPAGE();
		    PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);
		    if (pageVo.isItempagenext()) {
		      modelMap.put("itempagenext", "true");
		    } else {
		      modelMap.put("itempagenext", "false");
		    }
		    System.out.println(pageVo.getItempage());
		    modelMap.put("page", Integer.valueOf(pageVo.getItempage()));
		    modelMap.put("itemCount", Integer.valueOf(pageVo.getItemCount()));
		    modelMap.put("itempagestart", Integer.valueOf(pageVo.getItempagestart()));
		    modelMap.put("itempageend", Integer.valueOf(pageVo.getItempageend()));
		    modelMap.put("itemtotalcount", Integer.valueOf(pageVo.getItemtotalcount()));
		    modelMap.put("itemtotalpage", Integer.valueOf(pageVo.getItemtotalpage()));
		    
		    return modelMap;
		}

		@Override
		public void setDelete(AdminMemberVo adminMemberVo) {
			// TODO Auto-generated method stub
			System.out.println(adminMemberVo.getIDX());
		    this.adminMemberMapper.setDelete(adminMemberVo);
		    this.adminMemberMapper.setTeamDelete(adminMemberVo);
		    this.adminMemberMapper.setRecordDelete(adminMemberVo);
		    this.adminMemberMapper.setSrceDelete(adminMemberVo);
		    this.adminMemberMapper.setExploringDelete(adminMemberVo);
			
		}

		@Override
		public int IdCheck(AdminMemberVo adminMemberVo) {
			int result = this.adminMemberMapper.IdCheck(adminMemberVo);
		    
		    return result;
		}

		@Override
		public void SetInsert(AdminMemberVo vo) {
			// TODO Auto-generated method stub
			adminMemberMapper.SetInsert(vo);
		}

		@Override
		public ModelMap getALLMEMBER() {
			 ModelMap modelMap = new ModelMap();
			    
			 List<?> list = this.adminMemberMapper.getALLMEMBER();
			    
			modelMap.put("list", list);
			return modelMap;
		}
	
}
