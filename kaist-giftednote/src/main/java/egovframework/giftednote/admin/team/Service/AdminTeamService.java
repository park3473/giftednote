package egovframework.giftednote.admin.team.Service;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.admin.team.Model.AdminTeamVo;
import egovframework.giftednote.user.srce.model.UserSrceVo;

public interface AdminTeamService {

	ModelMap getALLList(AdminTeamVo adminTeamVo);

	ModelMap getTeamList(AdminTeamVo adminTeamVo);

	void setDelete(AdminTeamVo adminTeamVo);

	ModelMap getSrceAllList(UserSrceVo userSrceVo);

}
