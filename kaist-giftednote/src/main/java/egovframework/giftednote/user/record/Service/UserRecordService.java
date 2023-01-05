package egovframework.giftednote.user.record.Service;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.record.model.UserRecordVo;

public interface UserRecordService {

	ModelMap getList(UserRecordVo userRecordVo);

	void setRecord(UserRecordVo userRecordVo);

	void setRecordDelete(UserRecordVo userRecordVo);

	void setRecordUpdate(UserRecordVo userRecordVo);

	int getClassCheck(UserRecordVo userRecordVo);

	ModelMap getTeamNameDay(UserRecordVo userRecordVo);

	ModelMap getNameList(UserRecordVo userRecordVo);

	ModelMap getDateRecordList(UserRecordVo userRecordVo);

}
