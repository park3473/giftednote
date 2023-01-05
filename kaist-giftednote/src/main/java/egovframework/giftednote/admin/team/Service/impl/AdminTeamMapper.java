package egovframework.giftednote.admin.team.Service.impl;

import java.util.List;

import egovframework.giftednote.admin.team.Model.AdminTeamVo;
import egovframework.giftednote.user.srce.model.UserSrceVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("AdminTeamMapper")
public interface AdminTeamMapper {

	List<?> getALLList(AdminTeamVo adminTeamVo);

	int getALLListCnt(AdminTeamVo adminTeamVo);

	List<?> getStudentTeamList(AdminTeamVo adminTeamVo);

	List<?> getLeaderTeamList(AdminTeamVo adminTeamVo);

	void setDelete(AdminTeamVo adminTeamVo);

	void setDeleteSRCE(AdminTeamVo adminTeamVo);

	void setDeleteRECORD(AdminTeamVo adminTeamVo);

	void setDeleteEXPLORING(AdminTeamVo adminTeamVo);

	List<?> getSrceAllList(UserSrceVo userSrceVo);

}
