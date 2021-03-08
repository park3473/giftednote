package egovframework.kaist.admin.member_re.service.impl;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminMember_reMapper")
public interface AdminMemberReMapper {

	public List<?> getListAll();
	
	public List<?> getList(AdminMemberReVo adminMember_reVo);
	
	public boolean setUpdate(AdminMemberReVo adminMember_reVo);

	public ModelMap setUpdate(String idx);

	public AdminMemberReVo getView(String Id) ;
	
	public int getListCnt(AdminMemberReVo adminMember_reVo);

	public boolean setUpdateTypeToText(AdminMemberReVo userMember_reDomain);

	public List<?> getListPass();

	public ModelMap setDcmntUpdate(String dcmnt_check);

	public List<AdminDcmntVo> getDcmnt(AdminMemberReVo adminMember_reVo);

	public void setDcmntCheck(DcmntVo dcmnt_Vo);

	public void setAllComplete();

	public List<?> getStat();

	public List<?> getMeStat();

}