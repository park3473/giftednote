package egovframework.kaist.admin.member_re.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;

public interface AdminMemberReService {

	public ModelMap getList(AdminMemberReVo adminMember_reVo);
	
	ModelMap getView(String id);

	public boolean setUpdate(AdminMemberReVo adminMember_reVo);
	
	public ModelMap getListAll();
	
	public boolean getIdxCheck(String idx);

	public boolean setUpdateTypeToText(AdminMemberReVo adminMember_reDomain);

	public ModelMap getListPass();

	public ModelMap setDcmntUpdate(String dcmnt_check);

	public List<AdminDcmntVo> getDcmnt(AdminMemberReVo adminMember_reVo);

	public void setDcmntCheck(DcmntVo dcmnt_Vo);

	public void setAllComplete();

	public ModelMap getStat();



}
