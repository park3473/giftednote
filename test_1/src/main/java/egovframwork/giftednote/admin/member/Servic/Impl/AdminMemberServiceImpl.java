package egovframwork.giftednote.admin.member.Servic.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import egovframwork.giftednote.admin.member.Service.AdminMemberService;


@Service("AdminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

		@Resource(name = "AdminMemberMapper")
		private AdminMemberMapper adminMemberMapper;

		@Override
		public ModelMap getALLList() {
			// TODO Auto-generated method stub
			System.out.println("ddsadsadsa");
			ModelMap modelMap = new ModelMap();
			List<?> list = adminMemberMapper.getALLList();
			modelMap.addAttribute("list",list);
			return modelMap;
		}
	
}
