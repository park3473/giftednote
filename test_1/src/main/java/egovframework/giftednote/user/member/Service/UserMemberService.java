package egovframework.giftednote.user.member.Service;

import org.springframework.ui.ModelMap;
import java.util.List;


import egovframework.giftednote.user.member.model.UserMemberVo;
import egovframework.giftednote.user.note.model.UserNoteVo;

public interface UserMemberService {
	
	public UserMemberVo getView(UserMemberVo userMembervo);
	
	public String getPW(UserMemberVo userMembervo);
	
	public void insertMember(UserMemberVo userMembervo);

	public ModelMap getListAll();

	public List<?> getList(UserMemberVo userMembervo);

	
}

