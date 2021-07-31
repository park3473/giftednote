package egovframework.kaist.user.member_re.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;
import com.system.util.SUtil;

import egovframework.kaist.admin.dcmnt.service.impl.AdminDcmntMapper;
import egovframework.kaist.admin.member_re.model.AdminReMemberVo;
import egovframework.kaist.admin.member_re.service.impl.AdminMemberReMapper;
import egovframework.kaist.user.member_re.model.UserMemberReVo;
import egovframework.kaist.user.member_re.service.UserMemberReService;
import egovframework.kaist.user.school.model.UserSchoolVo;

@Service("userMember_reService")
@Transactional
public class UserMember_reServiceImpl implements UserMemberReService {

	
	@Resource(name = "adminDcmntMapper")
	private AdminDcmntMapper adminDcmntMapper;
	
	@Resource(name = "userMember_reMapper")
	private UserMemberReMapper userMember_reMapper;
	
	@Resource(name = "adminMember_reMapper")
	private AdminMemberReMapper adminMember_reMapper;
	
	protected Log log = LogFactory.getLog(UserMember_reServiceImpl.class);
	
 
	@Override
	public int setInsert(UserMemberReVo domain) {
		
		if(domain.equals("미확정"))
		{
			domain.setSEX("");
		}
		
		return userMember_reMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserMemberReVo domain) {
		return userMember_reMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserMemberReVo domain) {
		return userMember_reMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMember_reMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserMemberReVo vo = userMember_reMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getMember_reIdCheck(String member_reId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMember_reMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("member_reId : " + member_reId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(member_reId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserMemberReVo userMember_reVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMember_reMapper.getList(userMember_reVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userMember_reMapper.getListCnt(userMember_reVo);
		
		int itemCount = userMember_reVo.getITEM_COUNT();
		int itempage = userMember_reVo.getPAGE();

		PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);

		if (pageVo.isItempagenext() == true) {
			modelMap.put("itempagenext", "true");
		} else {
			modelMap.put("itempagenext", "false");
		}

		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());


		
		return modelMap;
		
	}

	@Override
	public ModelMap getschool(UserSchoolVo userSchoolVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMember_reMapper.getschool(userSchoolVo);
		modelMap.addAttribute("list", list);
		System.out.println(list.size());
		
		return modelMap;
	}

	@Override
	public ModelMap getStudent(UserMemberReVo userMember_reVo) {
		// TODO Auto-generated method stub
		String check_pass = userMember_reVo.getTEACHER_PASS();
		if(check_pass == null) {
			ModelMap modelMap = new ModelMap();
			UserMemberReVo view = userMember_reMapper.getStudent(userMember_reVo);
			modelMap.addAttribute("view", view);
			return modelMap;
		}else if(check_pass != null){
			ModelMap modelMap = new ModelMap();
			UserMemberReVo view = userMember_reMapper.getMentor(userMember_reVo);
			modelMap.addAttribute("view", view);
			
			return modelMap;
		}else {
			ModelMap modelMap = new ModelMap();
			return modelMap;
		}
	}

	@Override
	public void Update(UserMemberReVo userMember_reVo) {
		
		userMember_reMapper.Update(userMember_reVo);
	}

	@Override
	public void completion(UserMemberReVo userMember_reVo) {
		
		userMember_reMapper.completion(userMember_reVo);
	}

	@Override
	public String pass_check(UserMemberReVo userMember_reVo) {
		String rtn = userMember_reMapper.pass_check(userMember_reVo);
		return rtn;
	}

	@Override
	public ModelMap getDcmntTypes() {
		ModelMap modelMap = new ModelMap();
		List<?> types = adminDcmntMapper.getDcmntTypeList();
		modelMap.addAttribute("types", types);
		System.out.println("---types : " + types.size());
		return modelMap;
	}

	@Override
	public ModelMap getDcmnt_name(String eligibility) {
		// TODO Auto-generated method stub
		ModelMap modelMap = new ModelMap();
		System.out.println(eligibility);
		List<?> names = adminDcmntMapper.getDcmntName(eligibility);
		modelMap.addAttribute("names",names);
		System.out.println("--names :"+names.size());
		
		return modelMap;
	}

	@Override
	public List<AdminReMemberVo> getReCheck(AdminReMemberVo adminReMemberVo) {
		// TODO Auto-generated method stub
		System.out.println(adminReMemberVo.getID());
		System.out.println(adminReMemberVo.getSTUDENT_NAME());
		System.out.println(adminReMemberVo.getSTUDENT_PHONE());
		System.out.println(adminReMemberVo.getTEACHER_NAME());
		System.out.println(adminReMemberVo.getTEACHER_PHONE());
		return adminMember_reMapper.getReMember(adminReMemberVo);
	}

	
		
}
