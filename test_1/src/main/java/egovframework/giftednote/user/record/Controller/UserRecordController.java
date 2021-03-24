package egovframework.giftednote.user.record.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.giftednote.user.note.model.UserNoteVo;
import egovframework.giftednote.user.record.Service.UserRecordService;
import egovframework.giftednote.user.record.model.UserRecordVo;


@Controller
public class UserRecordController {
	
	@Autowired
	UserRecordService userRecordService;
	
	
	@RequestMapping(value="/record/list.do" , method = RequestMethod.GET)
	public ModelAndView Record(@ModelAttribute("UserRecordVo") UserRecordVo UserRecordVo ,HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserRecordVo.setN_IDX(request.getParameter("N_IDX"));
		ModelMap model = new ModelMap();
		
		model = userRecordService.getList(UserRecordVo);
		String N_IDX = UserRecordVo.getN_IDX();
		model.put("N_IDX", N_IDX);
		return new ModelAndView("/view/record/record" , "model" , model);
	}
	@RequestMapping(value="/user/record_insert.do" , method = RequestMethod.POST)
	public void RecordInsert(@ModelAttribute("UserRecordVo") UserRecordVo UserRecordVo ,HttpServletRequest request, HttpServletResponse response) throws IOException {
		userRecordService.setRecord(UserRecordVo);
	}
}
