package egovframework.giftednote.user.note.service;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.note.model.UserNoteVo;
import egovframework.giftednote.user.team.model.UserTeamVo;

public interface UserNoteService {

	ModelMap getList(UserNoteVo userNoteVo);

	void setNote(UserNoteVo userNoteVo);

	void setTeam(UserTeamVo userTeamVo);

}
