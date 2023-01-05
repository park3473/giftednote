package egovframework.giftednote.user.record.Service.impl;

import java.util.List;

import egovframework.giftednote.user.record.model.UserRecordVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserRecordMapper")
public interface UserRecordMapper {

	List<?> getList(UserRecordVo userRecordVo);

	List<?> getTeamList(UserRecordVo userRecordVo);
	
	List<?> getDayList(UserRecordVo userRecordVo);

	int getTeamCount(UserRecordVo userRecordVo);

	int getDayCount(UserRecordVo userRecordVo);

	void setRecord(UserRecordVo userRecordVo);

	List<?> getForTeam(UserRecordVo userRecordVo);

	int getClassCheck(UserRecordVo userRecordVo);

	void setRecordUpdate(UserRecordVo userRecordVo);

	void setRecordDelete(UserRecordVo userRecordVo);

	List<?> getDateRecordList(UserRecordVo userRecordVo);

	List<?> getNameList(UserRecordVo userRecordVo);
	
}
