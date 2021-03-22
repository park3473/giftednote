package egovframework.giftednote.user.record.Service;

import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.record.model.UserRecordVo;

public interface UserRecordService {

	ModelMap getList(UserRecordVo userRecordVo);

	void setRecord(UserRecordVo userRecordVo);

}
