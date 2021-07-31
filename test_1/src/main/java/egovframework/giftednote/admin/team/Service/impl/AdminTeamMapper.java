package egovframework.giftednote.admin.team.Service.impl;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.admin.team.Model.AdminTeamVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("AdminTeamMapper")
public interface AdminTeamMapper {

	
	public List<?> getALLList(AdminTeamVo adminTeamVo);

	public int getALLListCnt(AdminTeamVo adminTeamVo);

	public void setDelete(AdminTeamVo adminTeamVo);

	public void setDeleteSRCE(AdminTeamVo adminTeamVo);

	public void setDeleteRECORD(AdminTeamVo adminTeamVo);

	public void setDeleteEXPLORING(AdminTeamVo adminTeamVo);

	public List<?> getStudentTeamList(AdminTeamVo adminTeamVo);

	public List<?> getLeaderTeamList(AdminTeamVo adminTeamVo);

}
