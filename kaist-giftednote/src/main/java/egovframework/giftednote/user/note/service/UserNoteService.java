package egovframework.giftednote.user.note.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.comment.model.UserCommentVo;
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

	public void CommentSet(UserCommentVo userCommentVo);

	public void CommentUpdate(UserCommentVo userCommentVo);

	public void CommentDelete(UserCommentVo userCommentVo);

	public void NoteComplete(UserNoteVo userNoteVo);

	public ModelMap getTeamList(UserNoteVo userNoteVo);

}
