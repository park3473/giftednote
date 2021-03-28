package egovframework.giftednote.admin.member.Service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import egovframework.giftednote.admin.member.Service.AdminMemberService;


@Service("AdminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

		@Resource(name = "AdminMemberMapper")
		private AdminMemberMapper adminMemberMapper;

		@Override
		public ModelMap getALLList() {
			// TODO Auto-generated method stub
			System.out.println("ddsadsadsa");
			ModelMap modelMap = new ModelMap();
			List<?> list = adminMemberMapper.getList();
			modelMap.addAttribute("list",list);
			return modelMap;
		}
	
}
