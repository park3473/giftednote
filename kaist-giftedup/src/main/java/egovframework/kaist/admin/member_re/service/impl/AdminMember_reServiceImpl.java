package egovframework.kaist.admin.member_re.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.admin.member_re.service.AdminMemberReService;

@Service("adminMember_reService")
@Transactional
public class AdminMember_reServiceImpl implements AdminMemberReService {

	
	@Resource(name = "adminMember_reMapper")
	private AdminMemberReMapper adminMember_reMapper;
	
	protected Log log = LogFactory.getLog(AdminMember_reServiceImpl.class);

	@Override
	public boolean setUpdate(AdminMemberReVo adminMember_reVo) {
		return adminMember_reMapper.setUpdate(adminMember_reVo);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getListPass() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getListPass();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminMemberReVo vo = adminMember_reMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getIdxCheck(String idx) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("idx : " + idx);
			System.out.println("map.get(\"IDX\") : " + map.get("IDX"));
			if(map.get("IDX").equals(idx))
			{
				return true;
			}
		}
		return false;
	}


	@Override
	public ModelMap getList(AdminMemberReVo adminMember_reVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getList(adminMember_reVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		int itemtotalcount = adminMember_reMapper.getListCnt(adminMember_reVo);
		int itemCount = adminMember_reVo.getITEM_COUNT();
		int itempage = adminMember_reVo.getPAGE();
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
	public boolean setUpdateTypeToText(AdminMemberReVo adminMember_reDomain) {
		return adminMember_reMapper.setUpdateTypeToText(adminMember_reDomain);
	}

	@Override
	public ModelMap setDcmntUpdate(String dcmnt_check) {
		return adminMember_reMapper.setDcmntUpdate(dcmnt_check);
	}

	@Override
	public List<AdminDcmntVo> getDcmnt(AdminMemberReVo adminMember_reVo) {
		return adminMember_reMapper.getDcmnt(adminMember_reVo);
	}

	@Override
	public void setDcmntCheck(DcmntVo dcmnt_Vo) {
		
		adminMember_reMapper.setDcmntCheck(dcmnt_Vo);
	}

	@Override
	public void setAllComplete() {
		adminMember_reMapper.setAllComplete();
	}

	@Override
	public ModelMap getStat() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getStat();
		List<?> me_list = adminMember_reMapper.getMeStat();
		
		modelMap.addAttribute("me_list", me_list);
		modelMap.addAttribute("list",list);
		System.out.println("--------size : " + list.size());
		return modelMap;
		
	}

}
