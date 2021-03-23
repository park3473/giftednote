package egovframework.giftednote.user.exploring.Controller;

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

import egovframework.giftednote.user.exploring.Service.UserExploringService;
import egovframework.giftednote.user.exploring.model.UserExploringVo;
import egovframework.giftednote.user.record.Service.UserRecordService;



@Controller
public class UserExploringContorller {
	@Autowired
	UserExploringService userExploringService;
	

	@RequestMapping(value="/exploring/exploring.do" , method = RequestMethod.GET)
	public ModelAndView Exploring(@ModelAttribute("UserExploringVo") UserExploringVo UserExploringVo ,HttpServletRequest request, HttpServletResponse response){
		UserExploringVo.setIDX(request.getParameter("IDX"));
		UserExploringVo.setN_IDX(request.getParameter("N_IDX"));
		ModelMap model = new ModelMap();
		model = userExploringService.getList(UserExploringVo);
		model.put("IDX", request.getParameter("IDX"));
		model.put("N_IDX", request.getParameter("N_IDX"));
		return new ModelAndView("/view/exploring/exploring","model",model);
	}
	
	@RequestMapping(value="/exploring/setExplor.do", method=RequestMethod.POST)
	public void setExplor(@ModelAttribute("UserExploringVo") UserExploringVo UserExploringVo ,HttpServletRequest request, HttpServletResponse response) {
		userExploringService.setExplor(UserExploringVo);
	}
	
}
