package egovframework.giftednote.user.member.Service;

import org.springframework.ui.ModelMap;
import java.util.List;

import egovframework.giftednote.user.member.model.SchoolVo;
import egovframework.giftednote.user.member.model.UserInquiryVo;
import egovframework.giftednote.user.member.model.UserMemberVo;
import egovframework.giftednote.user.note.model.UserNoteVo;

public interface UserMemberService {
	
	public UserMemberVo getView(UserMemberVo userMembervo);
	
	public String getPW(UserMemberVo userMembervo);
	
	public void insertMember(UserMemberVo userMembervo);

	public ModelMap getListAll();

	public List<?> getList(UserMemberVo userMembervo);

	public UserMemberVo getMyInfo(UserMemberVo userMemberVo);

	public void setMyInfo(UserMemberVo userMemberVo);

	public ModelMap getSchool(SchoolVo schoolVo);

	public int setCheckId(UserMemberVo userMemberVo);

	public List<?> getMyInquiry(UserInquiryVo userInquiryVo);

	public void setInquiryInsert(UserInquiryVo userInquiryVo);

	public void setInquiryUpdate(UserInquiryVo userInquiryVo);

	public ModelMap getInquiry(UserInquiryVo userInquiryVo);


	
}

