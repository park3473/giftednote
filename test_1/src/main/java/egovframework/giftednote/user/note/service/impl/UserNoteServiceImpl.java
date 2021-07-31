package egovframework.giftednote.user.note.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.giftednote.user.comment.model.UserCommentVo;
import egovframework.giftednote.user.note.model.UserNoteVo;
import egovframework.giftednote.user.note.service.UserNoteService;
import egovframework.giftednote.user.note_detail.model.UserNoteDetailVo;
import egovframework.giftednote.user.team.model.UserTeamVo;


@Service("UserNoteService")
public class UserNoteServiceImpl implements UserNoteService {

	@Resource(name = "UserNoteMapper")
	private UserNoteMapper usernotemapper;
	
	@Override
	public ModelMap getList(UserNoteVo UserNoteVo) {
		// TODO Auto-generated method stub
		ModelMap modelMap = new ModelMap();
		System.out.println(UserNoteVo.getType());
		if(UserNoteVo.getType().equals("student")) {
			List<?> list = usernotemapper.getStudentNoteList(UserNoteVo);
		
			modelMap.addAttribute("list",list);
			System.out.println("------------------size : " + list.size());
		
			System.out.println(UserNoteVo.getEMAIL());
			int itemtotalcount = usernotemapper.getStudentListCnt(UserNoteVo);
			int itemCount = UserNoteVo.getITEM_COUNT();
			int itempage = UserNoteVo.getPAGE();
			PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);
			if (pageVo.isItempagenext() == true) {
				modelMap.put("itempagenext", "true");
			} else {
				modelMap.put("itempagenext", "false");
			}
			modelMap.put("page", pageVo.getItempage());
			modelMap.put("itemCount", pageVo.getItemCount());
			modelMap.put("itempagestart", pageVo.getItempagestart());
			modelMap.put("itempageend", pageVo.getItempageend());
			modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
			modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
			return modelMap;
		}else if(UserNoteVo.getType().equals("mento")){
			List<?> list = usernotemapper.getMentoNoteList(UserNoteVo);
		
			modelMap.addAttribute("list",list);
			System.out.println("------------------size : " + list.size());
		
			System.out.println(UserNoteVo.getEMAIL());
			int itemtotalcount = usernotemapper.getMentoListCnt(UserNoteVo);
			int itemCount = UserNoteVo.getITEM_COUNT();
			int itempage = UserNoteVo.getPAGE();
			PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);
			if (pageVo.isItempagenext() == true) {
				modelMap.put("itempagenext", "true");
			} else {
				modelMap.put("itempagenext", "false");
			}
			modelMap.put("page", pageVo.getItempage());
			modelMap.put("itemCount", pageVo.getItemCount());
			modelMap.put("itempagestart", pageVo.getItempagestart());
			modelMap.put("itempageend", pageVo.getItempageend());
			modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
			modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
			return modelMap;
		}else {
			modelMap.put("note_list", 0);
			
			return modelMap;
		}
	}

	@Override
	public void setNote(UserNoteVo userNoteVo) {
		// TODO Auto-generated method stub
		usernotemapper.setNote(userNoteVo);
		usernotemapper.setFirstPage(userNoteVo);
		
	}

	@Override
	public void setTeam(UserTeamVo userTeamVo) {
		// TODO Auto-generated method stub
		usernotemapper.setTeam(userTeamVo);
	}

	@Override
	public ModelMap getDetail(UserNoteDetailVo userNoteDetailVo) {
		// TODO Auto-generated method stub
		ModelMap modelMap = new ModelMap();
		
		List<?> list = usernotemapper.getDetail(userNoteDetailVo);
		modelMap.addAttribute("list",list);
		int PageCount = usernotemapper.getDetailCnt(userNoteDetailVo);
		modelMap.put("Pagecount", PageCount);
		
		List<?> AllList = usernotemapper.getDetailAll(userNoteDetailVo);
		
		String coll = usernotemapper.getCollCd(userNoteDetailVo);
		
		modelMap.put("coll", coll);
		
		modelMap.put("AllList", AllList);
		
		// 07 - 26 코멘트 제거
		//List<?> colist = usernotemapper.getComment(userNoteDetailVo);
		//modelMap.addAttribute("colist",colist);
		
		return modelMap;
	}

	@Override
	public List<?> getContent(UserNoteDetailVo userNoteDetailVo) {
		// TODO Auto-generated method stub
		return usernotemapper.getContent(userNoteDetailVo);
	}

	@Override
	public void setDetail(UserNoteDetailVo userNoteDetailVo) {
		// TODO Auto-generated method stub
		usernotemapper.setDetail(userNoteDetailVo);
	}

	@Override
	public void InsertPage(UserNoteDetailVo userNoteDetailVo) {
		// TODO Auto-generated method stub
		usernotemapper.InsertPage(userNoteDetailVo);
	}

	@Override
	public void CommentSet(UserCommentVo userCommentVo) {
		// TODO Auto-generated method stub
		usernotemapper.CommentSet(userCommentVo);
	}

	@Override
	public void CommentUpdate(UserCommentVo userCommentVo) {
		// TODO Auto-generated method stub
		usernotemapper.CommentUpdate(userCommentVo);
	}

	@Override
	public void CommentDelete(UserCommentVo userCommentVo) {
		// TODO Auto-generated method stub
		usernotemapper.CommentDelete(userCommentVo);
	}

	@Override
	public void NoteComplete(UserNoteVo userNoteVo) {
		// TODO Auto-generated method stub
		usernotemapper.NoteComplete(userNoteVo);
	}

	@Override
	public ModelMap getDetailAll(UserNoteDetailVo userNoteDetailVo) {
		// TODO Auto-generated method stub
		ModelMap model = new ModelMap();
		
		List<?> list = usernotemapper.getDetailAll(userNoteDetailVo);
		
		List<?> type = usernotemapper.getNote(userNoteDetailVo);
		
		model.put("note", type);
		model.put("list", list);
		return model;
	}

	@Override
	public ModelMap getTeamList(UserNoteVo userNoteVo) {
		ModelMap modelMap = new ModelMap();
		
		List<?> teamlist = usernotemapper.getTeamList(userNoteVo);
		
		modelMap.put("teamlist", teamlist);
		
		return modelMap;
	}

	

}
