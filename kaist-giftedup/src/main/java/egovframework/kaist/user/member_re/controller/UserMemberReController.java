package egovframework.kaist.user.member_re.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.system.util.SUtil;

import egovframework.kaist.admin.member_re.model.AdminReMemberVo;
import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;
import egovframework.kaist.user.buseo.service.UserBuseoService;
import egovframework.kaist.user.member_re.model.UserMemberReVo;
import egovframework.kaist.user.member_re.service.UserMemberReService;
import egovframework.kaist.user.school.model.UserSchoolVo;

@Controller
public class UserMemberReController {

	@Autowired
	UserMemberReService userMember_reService;

	@Autowired
	UserBuseoService userBuseoService;

	@Autowired
	AdminSmsLogService adminSmsLogService;
	
	
	
	
	@Value("#{PUBLIC['SMS.MEMBER_RE.INSERT']}") 
	String MEMBER_RE_INSERT = "";
	
	
	private static final Logger Logger = LoggerFactory.getLogger(UserMemberReController.class);

	@RequestMapping(value = "/user/member_re/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UserSchoolVo") UserSchoolVo userSchoolVo,
			HttpServletRequest request, HttpServletResponse response) {
			
		
		ModelMap model = new ModelMap();
		
		
		model = userMember_reService.getschool(userSchoolVo);
		model.put("SEARCH_TYPE", userSchoolVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userSchoolVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", userSchoolVo);

		

		return new ModelAndView("user/member_re/school_search", "model", model);
	}

	@RequestMapping(value = "/user/member_re/check.do", method = RequestMethod.GET)
	public ModelAndView check(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/member_re/check");
	}
	
	@RequestMapping(value = "/user/member_re/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1";
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		model = userMember_reService.getDcmntTypes();
		model.put("buseo", userBuseoService.getListAll());
		model.put("TYPE", TYPE);
		
		return new ModelAndView("user/member_re/insert", "model", model);
	}
	
	

	@RequestMapping(value = "/user/member_re/insert.do", method = RequestMethod.POST)
	public ModelAndView insertPost(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo,
			MultipartHttpServletRequest  request,  HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
		
		
		ModelMap model = new ModelMap();
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/member/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		userMember_reVo.setFILES(filename);
		
		
		String pass = userMember_reVo.getPASSWORD();
		String id = userMember_reVo.getNAME();
		
		//멘토 임시 비밀번호 발생 6자리
		String pw = "";
		for (int i = 0; i < 6; i++) {
			pw += (char) ((Math.random() *26) + 97);
		}
		userMember_reVo.setTEACHER_PASS(pw);
		ModelMap check_model = new ModelMap();
		check_model = userMember_reService.getStudent(userMember_reVo);
		userMember_reService.setInsert(userMember_reVo);		
		
		//여기에 문자
		AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
		userSmsLogDomain.setMEMBER_ID(SUtil.getUserId(request));

		String test_type = userMember_reVo.getTEACHER_TYPE();
		String phone = "";
		if(test_type.equals("확정")) {
			phone = userMember_reVo.getTEACHER_PHONE();
			userSmsLogDomain.setPHONE(phone);
			userSmsLogDomain.setTYPE("0");
			userSmsLogDomain.setMESSAGE(id + "학생이 2021년 영재키움프로젝트 신입생 지원을 넣었습니다. \n멘토분의 비밀번호는" + pw + "입니다.\n1.http://www.giftedup.org/ 홈페이지에 접속\n2.선발 > 지원서/합격자 조회메뉴 클릭.\n3.학생 지원서 조회 > 멘토 교사 체크 > 학생명,비밀번호 입력\n4.하단 멘토 교사 지원서 작성");
			userSmsLogDomain.setRESERVATION("");
			userSmsLogDomain.setRESERVATION_TM(SUtil.getNowDateTime());
			userSmsLogDomain.setSMS_TYPE("L");
			String message = userSmsLogDomain.getMESSAGE();
			System.out.println("멘토 연락처"+phone);
			System.out.println("멘토에게 보낼 메세지"+userSmsLogDomain.getMESSAGE());
			adminSmsLogService.smsSend(userSmsLogDomain);
		}
		phone = userMember_reVo.getPHONE();
		if(phone.equals("")) {
			phone = userMember_reVo.getTEL();
		}
		//혹시 몰라 이중으로..
		phone = phone.replace("-", "");
		
		userSmsLogDomain.setPHONE(phone);
		userSmsLogDomain.setTYPE("0");
		userSmsLogDomain.setMESSAGE("2021년 영재키움프로젝트 신입생선발 1차 지원에 성공하셨습니다.\n"+id+" 학생의 비밀번호는" + pass + "입니다.\n화면에 나온 서류를 확인해서 이메일 또는 주소로 필요한서류를 보내주시기 바랍니다.\n1. http://www.giftedup.org/ 홈페이지 접속\n2. 선발 > 지원서/합격자 조회 메뉴 클릭\n3. 학생 지원서 조회 > 학생명,비밀번호 입력");
		userSmsLogDomain.setRESERVATION("");
		userSmsLogDomain.setRESERVATION_TM(SUtil.getNowDateTime());
		userSmsLogDomain.setSMS_TYPE("L");
		System.out.println("학생에게 보낼 메세지"+userSmsLogDomain.getMESSAGE());
		System.out.println("학생 전화번호"+userSmsLogDomain.getPHONE());
		String message = userSmsLogDomain.getMESSAGE();
		
		
		userSmsLogDomain.setPHONE(phone);
		//adminSmsLogService.setInsert(userSmsLogDomain);
		adminSmsLogService.smsSend(userSmsLogDomain);
		
		//서류 제출해야되는 내용 가져오기
		
		model = userMember_reService.getDcmnt_name(userMember_reVo.getELIGIBILITY());	
		model.put("DCMNT_TYPE", userMember_reVo.getELIGIBILITY());
		model.put("PASS", pass);
		model.put("ID", id);
		model.put("RTN", "1");
		return new ModelAndView("user/member_re/insert", "model", model);
	}
	
	
	@RequestMapping(value = "/user/member_re/{member_reid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("member_reid") String member_reid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = userMember_reService.getView(member_reid);

		model.put("buseo", userBuseoService.getListAll());
		return new ModelAndView("user/member_re/update", "model", model);
	}
	
	@RequestMapping(value = "/user/member_re/{member_reid}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo,
			MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/member_re/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		userMember_reVo.setFILES(filename);
		boolean rtn = userMember_reService.setUpdate(userMember_reVo);

		return "redirect:../list.do";
	}

	@RequestMapping(value = "/user/member_re/delete.do", method = RequestMethod.GET)
	public String delete(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo, HttpServletRequest request,
			HttpServletResponse response) {

		
		userMember_reService.setDelete(userMember_reVo);
		
		return "redirect:/index.do";
		
	}
	@RequestMapping(value = "/user/member_re/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("UserMember_reVo") UserMemberReVo userMemberReVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userMemberReVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserMemberReVo userMemberDomain = new UserMemberReVo();
				userMemberDomain.setIDX(arrIdx[i]);
				userMember_reService.setDelete(userMemberDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	
	/*11-10 추가 개발 학교 검색 모달창 페이지*/
	@RequestMapping(value="/user/member_re/search_school.do",method = RequestMethod.GET)
	public String school_search(HttpServletRequest request, HttpServletResponse response) {
		return "/user/member_re/school_search";
	}
	
	@RequestMapping(value="/user/member_re/view.do",method = RequestMethod.POST)
	public ModelAndView view(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo, 
			HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		
		System.out.println(userMember_reVo.getNAME());
		System.out.println(userMember_reVo.getPASSWORD());
		String check_pass = userMember_reVo.getTEACHER_PASS();
		
		model = userMember_reService.getStudent(userMember_reVo);
		if(check_pass != null) {
			model.put("rtn", "1");
		}
		if(model.get("view") == null) {
			System.out.println("조회실패");
			return new ModelAndView("/user/member_re/inquiry","view_check","조회실패");
		}
		model.addAttribute(userMember_reVo);
		return new ModelAndView("/user/member_re/view" , "model" , model);	
	}
	
	@RequestMapping(value="/user/member_re/mento_check.do" , method=RequestMethod.POST)
	public ModelAndView mento_check(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo , HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		model.addAttribute(userMember_reVo);
		System.out.println(userMember_reVo.getNAME());
		System.out.println(userMember_reVo.getTEACHER_PASS());
		return new ModelAndView("/user/member_re/mento_check" , "model" , model);
	}
	
	@RequestMapping(value="/user/member_re/mento_all.do",method = RequestMethod.POST)
	public ModelAndView mento_all(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo, 
			HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		
		model = userMember_reService.getStudent(userMember_reVo);
		model.addAttribute(userMember_reVo);
		return new ModelAndView("/user/member_re/mento_all" , "model" , model);
	}
	
	
	@RequestMapping(value = "/user/member_re/student_update.do", method = RequestMethod.POST)
	public ModelAndView student_update(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo,HttpServletRequest request,
			HttpServletResponse response) {

		
		
		ModelMap model = new ModelMap();
		
		String check_pass = userMember_reVo.getTEACHER_PASS();
		
		
		
		model = userMember_reService.getStudent(userMember_reVo);
		if(check_pass != null) {
			model.put("rtn", "1");
		}
		model.addAttribute(userMember_reVo);
		return new ModelAndView("/user/member_re/student_update" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/member_re/update",method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo,String MCP,HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
		String rtn = "2";
		String student_check = userMember_reVo.getLETER_RCMND();
		String mento_check = userMember_reVo.getTEACHER_PASS();
		if(student_check == null) {
			
			//여기에 문자
			AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
			userSmsLogDomain.setMEMBER_ID(SUtil.getUserId(request));

			String phone = "";
			String id = userMember_reVo.getNAME();
			String pw = userMember_reVo.getTEACHER_PASS();
			System.out.println(pw);
			System.out.println(id);
			System.out.println(MCP);
			if(MCP.equals("1") && userMember_reVo.getTEACHER_TYPE().equals("확정")) {
				phone = userMember_reVo.getTEACHER_PHONE();
				userSmsLogDomain.setPHONE(phone);
				userSmsLogDomain.setTYPE("0");
				userSmsLogDomain.setMESSAGE(id + "학생 이 신입생 지원을 넣으셨습니다 \n멘토분의 비밀번호는" + pw + "입니다.\n1.http://www.giftedup.org/ 카이스트 홈페이지에 접속\n2.상단의 선발 아래의 지원서/합격자 조회 클릭.\n3.학생 지원서 조회 에 멘토교사 체크 후 학생명과 발급받은 비밀번호 입력한뒤 조회\n4.밑에 멘토교사 지원서 작성 버튼 클릭");
				userSmsLogDomain.setRESERVATION("");
				userSmsLogDomain.setRESERVATION_TM(SUtil.getNowDateTime());
				String message = userSmsLogDomain.getMESSAGE();
				userSmsLogDomain.setSMS_TYPE("L");
				System.out.println("멘토 연락처" + phone);
				System.out.println("멘토에게 보낼 메세지" + userSmsLogDomain.getMESSAGE());
				adminSmsLogService.smsSend(userSmsLogDomain);
			}
			
			
			ModelMap model = new ModelMap();
			rtn = "1";
			model.put("PASS",userMember_reVo.getPASSWORD());
			model.put("NAME",userMember_reVo.getNAME());
			model.put("rtn",rtn);
			userMember_reService.Update(userMember_reVo);
			model = userMember_reService.getStudent(userMember_reVo);
			return new ModelAndView("/user/member_re/view" , "model" , model);	
		}
		if(mento_check != null) {
			rtn = "1";
			System.out.println(rtn);
		}
		ModelMap model = new ModelMap();
		model.put("PASS",userMember_reVo.getTEACHER_PASS());
		model.put("NAME",userMember_reVo.getNAME());
		model.put("rtn", rtn);
		userMember_reService.Update(userMember_reVo);
		model = userMember_reService.getStudent(userMember_reVo);
		model.put("rtn", rtn);
		return new ModelAndView("/user/member_re/view" , "model" , model);	
	}
	
	@RequestMapping(value="/user/member_re/inquiry.do",method = RequestMethod.GET)
	public String inquiry(HttpServletRequest request, HttpServletResponse response) {
		return "/user/member_re/inquiry";
	}
	
	@RequestMapping(value = "/user/member_re/completion.do", method = RequestMethod.GET)
	public String completion(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo, HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println(userMember_reVo.getIDX());
		userMember_reService.completion(userMember_reVo);
		
		return "redirect:/index.do";
		
	}
	
	@RequestMapping(value="/user/member_re/pass_check.do",method = RequestMethod.POST , produces = "application/text; charset=utf8")
	@ResponseBody
	public String pass_check(@ModelAttribute("UserMember_reVo") UserMemberReVo userMember_reVo, HttpServletRequest request,
			HttpServletResponse response) throws JsonProcessingException{
		String name = userMember_reVo.getNAME();
		String rtn = userMember_reService.pass_check(userMember_reVo);
		String full = rtn + ","+ name;
		return full;
	}
	
	
	@RequestMapping(value ="/user/member_re/new_inquiry.do" , method = RequestMethod.GET)
	public ModelAndView NewInquiry(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/user/member_re/new_inquiry");
	}
	
	@RequestMapping(value ="/user/member_re/new_inquiry.do" , method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public String NewInquiryCheck(@ModelAttribute("AdminReMemberVo")AdminReMemberVo adminReMemberVo , HttpServletRequest request, HttpServletResponse response)throws JsonProcessingException {
		String type = request.getParameter("VIEW_TYPE");
		adminReMemberVo.setID("유형"+type);
		List<AdminReMemberVo> list = userMember_reService.getReCheck(adminReMemberVo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	
	
}
