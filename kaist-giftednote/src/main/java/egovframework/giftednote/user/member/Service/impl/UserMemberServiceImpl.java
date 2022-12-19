package egovframework.giftednote.user.member.Service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.giftednote.user.member.Service.UserMemberService;
import egovframework.giftednote.user.member.model.UserMemberVo;
import egovframework.giftednote.user.note.model.UserNoteVo;


@Service("userMemberService")
@Transactional
public class UserMemberServiceImpl implements UserMemberService {
	
	@Resource(name = "UserMemberMapper")
	private UserMemberMapper userMemberMapper;
	protected Log log = LogFactory.getLog(UserMemberServiceImpl.class);
	@Override
	public UserMemberVo getView(UserMemberVo userMembervo) {
		return userMemberMapper.getView(userMembervo);
	}
	@Override
	public String getPW(UserMemberVo userMembervo) {
		// TODO Auto-generated method stub
		return userMemberMapper.getPW(userMembervo);
	}
	@Override
	public void insertMember(UserMemberVo userMembervo) {
		// TODO Auto-generated method stub
		userMemberMapper.insertMember(userMembervo);
		return;
	}
	@Override
	public ModelMap getListAll() {
		// TODO Auto-generated method stub
		ModelMap modelMap = new ModelMap();
		List<?> list = userMemberMapper.getListAll();
		modelMap.addAttribute("list",list);
		return modelMap;
	}
	@Override
	public List<?> getList(UserMemberVo userMembervo) {
		// TODO Auto-generated method stub
		return userMemberMapper.getList(userMembervo);
	}
	@Override
	public UserMemberVo getMyInfo(UserMemberVo userMemberVo) {
		// TODO Auto-generated method stub
		return userMemberMapper.getMyInfo(userMemberVo);
	}
	@Override
	public void setMyInfo(UserMemberVo userMemberVo) {
		// TODO Auto-generated method stub
		userMemberMapper.setMyInfo(userMemberVo);
	}
	

}
