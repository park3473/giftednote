package egovframework.giftednote.user.note.service.impl;

import java.util.List;

import egovframework.giftednote.user.note.model.UserNoteVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserNoteMapper")
public interface UserNoteMapper {

	public List<?> getList(UserNoteVo userNoteVo);

	public int getListCnt(UserNoteVo userNoteVo);

	public void setNote(UserNoteVo userNoteVo);


	

}
