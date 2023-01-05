package egovframework.giftednote.user.note.service.impl;

import java.util.List;

import egovframework.giftednote.user.comment.model.UserCommentVo;
import egovframework.giftednote.user.note.model.UserNoteVo;
import egovframework.giftednote.user.note_detail.model.UserNoteDetailVo;
import egovframework.giftednote.user.team.model.UserTeamVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserNoteMapper")
public interface UserNoteMapper {

	public List<?> getList(UserNoteVo userNoteVo);

	public int getListCnt(UserNoteVo userNoteVo);

	public void setNote(UserNoteVo userNoteVo);

	public void setTeam(UserTeamVo userTeamVo);

	public List<?> getDetail(UserNoteDetailVo userNoteDetailVo);

	public int getDetailCnt(UserNoteDetailVo userNoteDetailVo);

	public List<?> getContent(UserNoteDetailVo userNoteDetailVo);

	public void setDetail(UserNoteDetailVo userNoteDetailVo);

	public void InsertPage(UserNoteDetailVo userNoteDetailVo);

	public List<?> getComment(UserNoteDetailVo userNoteDetailVo);

	public void CommentSet(UserCommentVo userCommentVo);

	public void CommentUpdate(UserCommentVo userCommentVo);

	public void CommentDelete(UserCommentVo userCommentVo);

	public void NoteComplete(UserNoteVo userNoteVo);

	public void setFirstPage(UserNoteVo userNoteVo);

	public List<?> getStudentNoteList(UserNoteVo userNoteVo);

	public int getStudentListCnt(UserNoteVo userNoteVo);

	public List<?> getMentoNoteList(UserNoteVo userNoteVo);

	public int getMentoListCnt(UserNoteVo userNoteVo);

	public List<?> getDetailAll(UserNoteDetailVo userNoteDetailVo);

	public String getCollCd(UserNoteDetailVo userNoteDetailVo);

	public List<?> getTeamList(UserNoteVo userNoteVo);


	

}
