package egovframework.giftednote.admin.team.Service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.admin.team.Model.AdminTeamVo;

public interface AdminTeamService {

	public ModelMap getALLList(AdminTeamVo adminTeamVo);

	public ModelMap getTeamList(AdminTeamVo adminTeamVo);

	public void setDelete(AdminTeamVo adminTeamVo);

}
