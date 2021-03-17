package egovframework.giftednote.user.note.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.note.model.UserNoteVo;
import egovframework.giftednote.user.note_detail.model.UserNoteDetailVo;
import egovframework.giftednote.user.team.model.UserTeamVo;

public interface UserNoteService {

	public ModelMap getList(UserNoteVo userNoteVo);

	public void setNote(UserNoteVo userNoteVo);

	public void setTeam(UserTeamVo userTeamVo);

	public ModelMap getDetail(UserNoteDetailVo userNoteDetailVo);

	public List<?> getContent(UserNoteDetailVo userNoteDetailVo);

	public void setDetail(UserNoteDetailVo userNoteDetailVo);

	public void InsertPage(UserNoteDetailVo userNoteDetailVo);

}
