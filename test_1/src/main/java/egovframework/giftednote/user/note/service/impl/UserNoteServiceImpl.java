package egovframework.giftednote.user.note.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.giftednote.user.note.model.UserNoteVo;
import egovframework.giftednote.user.note.service.UserNoteService;


@Service("UserNoteService")
public class UserNoteServiceImpl implements UserNoteService {

	@Resource(name = "UserNoteMapper")
	private UserNoteMapper usernotemapper;
	
	@Override
	public ModelMap getList(UserNoteVo UserNoteVo) {
		// TODO Auto-generated method stub
		ModelMap modelMap = new ModelMap();
		List<?> list = usernotemapper.getList(UserNoteVo);
		modelMap.addAttribute("list",list);
		System.out.println("------------------size : " + list.size());
		int itemtotalcount = usernotemapper.getListCnt(UserNoteVo);
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
	}

	@Override
	public void setNote(UserNoteVo userNoteVo) {
		// TODO Auto-generated method stub
		usernotemapper.setNote(userNoteVo);
	}

}
