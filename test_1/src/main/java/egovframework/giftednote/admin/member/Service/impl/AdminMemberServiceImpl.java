package egovframework.giftednote.admin.member.Service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.giftednote.admin.member.Model.AdminInquiryVo;
import egovframework.giftednote.admin.member.Model.AdminMemberVo;
import egovframework.giftednote.admin.member.Service.AdminMemberService;


@Service("AdminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

		@Resource(name = "AdminMemberMapper")
		private AdminMemberMapper adminMemberMapper;

		@Override
		public ModelMap getALLList(AdminMemberVo adminMemberVo) {
			// TODO Auto-generated method stub
			ModelMap modelMap = new ModelMap();
			
			System.out.println(adminMemberVo.getLIMIT());
			System.out.println(adminMemberVo.getOFFSET());
			
			List<?> list = adminMemberMapper.getList(adminMemberVo);
			modelMap.addAttribute("list",list);
			int itemtotalcount = adminMemberMapper.getListCnt(adminMemberVo);
			int itemCount = adminMemberVo.getITEM_COUNT();
			int itempage = adminMemberVo.getPAGE();
			PageVO pageVo = new PageVO(itemCount , itemtotalcount,itempage);
			if(pageVo.isItempagenext() == true) {
				modelMap.put("itempagenext", "true");
			}else {
				modelMap.put("itempagenext", "false");
			}
			
			System.out.println(pageVo.getItempage());
			modelMap.put("page", pageVo.getItempage());
			modelMap.put("itemCount", pageVo.getItemCount());
			modelMap.put("itempagestart", pageVo.getItempagestart());
			modelMap.put("itempageend", pageVo.getItempageend());
			modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
			modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
			
			
			return modelMap;
		}

		@Override
		public void setMember(AdminMemberVo adminMemberVo) {
			// TODO Auto-generated method stub
			adminMemberMapper.setMember(adminMemberVo);
		}

		@Override
		public void setDelete(AdminMemberVo adminMemberVo) {
			// TODO Auto-generated method stub
			System.out.println(adminMemberVo.getIDX());
			adminMemberMapper.setDelete(adminMemberVo);
			adminMemberMapper.setTeamDelete(adminMemberVo);
			adminMemberMapper.setRecordDelete(adminMemberVo);
			adminMemberMapper.setSrceDelete(adminMemberVo);
			adminMemberMapper.setExploringDelete(adminMemberVo);
		}

		@Override
		public ModelMap getAllInquiryList(AdminInquiryVo adminInquiryVo) {
			
			ModelMap modelMap = new ModelMap();
			
			System.out.println(adminInquiryVo.getLIMIT());
			System.out.println(adminInquiryVo.getOFFSET());
			
			List<?> list = adminMemberMapper.getInquiryList(adminInquiryVo);
			modelMap.addAttribute("list",list);
			int itemtotalcount = adminMemberMapper.getInquiryListCnt(adminInquiryVo);
			int itemCount = adminInquiryVo.getITEM_COUNT();
			int itempage = adminInquiryVo.getPAGE();
			PageVO pageVo = new PageVO(itemCount , itemtotalcount,itempage);
			if(pageVo.isItempagenext() == true) {
				modelMap.put("itempagenext", "true");
			}else {
				modelMap.put("itempagenext", "false");
			}
			
			System.out.println(pageVo.getItempage());
			modelMap.put("page", pageVo.getItempage());
			modelMap.put("itemCount", pageVo.getItemCount());
			modelMap.put("itempagestart", pageVo.getItempagestart());
			modelMap.put("itempageend", pageVo.getItempageend());
			modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
			modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
			
			
			return modelMap;
		}

		@Override
		public ModelMap getInquiry(AdminInquiryVo adminInquiryVo) {
			// TODO Auto-generated method stub
			ModelMap model = new ModelMap();
			AdminInquiryVo vo = adminMemberMapper.getInquiry(adminInquiryVo);
			model.put("view", vo);
			
			return model;
		}

		@Override
		public void SetInquiry(AdminInquiryVo adminInquiryVo) {
			// TODO Auto-generated method stub
			adminMemberMapper.setInquiry(adminInquiryVo);
		}

		@Override
		public void SetInsert(AdminMemberVo adminMemberVo) {
			// TODO Auto-generated method stub
			adminMemberMapper.SetInsert(adminMemberVo);
		}

		@Override
		public int IdCheck(AdminMemberVo adminMemberVo) {
			// TODO Auto-generated method stub
			int result = adminMemberMapper.IdCheck(adminMemberVo);
			
			return result;
		}

		@Override
		public ModelMap getALLMEMBER() {
			// TODO Auto-generated method stub
			ModelMap modelMap = new ModelMap();
			
			List<?> list = adminMemberMapper.getALLMEMBER();
			
			modelMap.put("list", list);
			return modelMap;
		}
	
}
