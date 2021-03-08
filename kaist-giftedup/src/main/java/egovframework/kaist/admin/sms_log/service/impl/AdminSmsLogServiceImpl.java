package egovframework.kaist.admin.sms_log.service.impl;
 

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;
import com.thoughtworks.xstream.core.util.Base64Encoder;

import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;
import java.util.Base64;



@Service("adminSmsLogService")
@Transactional
public class AdminSmsLogServiceImpl implements AdminSmsLogService {

	
	@Resource(name = "adminSmsLogMapper")
	private AdminSmsLogMapper adminSmsLogMapper;
	
	@Value("#{PUBLIC['SMS.SEND.PHONE1']}") 
	String SEND_PHONE1 = "";
	
	@Value("#{PUBLIC['SMS.SEND.PHONE2']}") 
	String SEND_PHONE2 = "";
	
	@Value("#{PUBLIC['SMS.SEND.PHONE3']}") 
	String SEND_PHONE3 = "";

			
	
	protected Log log = LogFactory.getLog(AdminSmsLogServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminSmsLogVo domain) {
		return adminSmsLogMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminSmsLogVo domain) {
		return adminSmsLogMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminSmsLogVo domain) {
		return adminSmsLogMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSmsLogMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminSmsLogVo vo = adminSmsLogMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getSmsLogIdCheck(String sms_logId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSmsLogMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("sms_logId : " + sms_logId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(sms_logId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminSmsLogVo adminSmsLogVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSmsLogMapper.getList(adminSmsLogVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminSmsLogMapper.getListCnt(adminSmsLogVo);
		
		int itemCount = adminSmsLogVo.getITEM_COUNT();
		int itempage = adminSmsLogVo.getPAGE();

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
	public void setSendSms() {
		
		
		List<?> list = adminSmsLogMapper.getListSmsSend();
		for(int i = 0; i < list.size(); i++)
		{
			HashMap smsMap = (HashMap) list.get(i);
			
			String IDX = smsMap.get("IDX")+"";
			String MESSAGE = smsMap.get("MESSAGE")+"";
			String PHONE = smsMap.get("PHONE")+"";
					
			String STATUS = "-1";
			try {
				AdminSmsLogVo adminSmsLogVo = new AdminSmsLogVo();
				adminSmsLogVo.setPHONE(PHONE);
				adminSmsLogVo.setMESSAGE(MESSAGE);
				STATUS = smsSend(adminSmsLogVo);
			} catch (NoSuchAlgorithmException | IOException e) {
				e.printStackTrace();
			}
			
			if(!STATUS.equals("1"))
			{
				smsMap.put("MESSAGE_ERROR", STATUS);
				STATUS = "-1";
			}

			smsMap.remove("STATUS");
			smsMap.put("STATUS", STATUS);
			adminSmsLogMapper.setUpdateSend(smsMap);
		}
	}

	public String smsSend(AdminSmsLogVo adminSmsLogVo) throws IOException, NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		System.out.println("---임플--");
		String charsetType = "EUC-KR"; // EUC-KR 또는 UTF-8
		String APIKEY = "858f1645ba29ea0e7d0342b66cc3248d";

		
		String message = adminSmsLogVo.getMESSAGE();
		String parm_msg = message;
		String subject = "";//제목 :LMS로 전송
		if(adminSmsLogVo.getSMS_TYPE() == null) {
			if(parm_msg.length() > 79)
			{
				parm_msg = parm_msg.substring(0,80);
			}
		}
		
		String phone = adminSmsLogVo.getPHONE();
		String parm_rphone = phone; //받는번호
		String parm_sphone1 = SEND_PHONE1; //보내는번호1
		String parm_sphone2 = SEND_PHONE2; //보내는번호2
		String parm_sphone3 = SEND_PHONE3;//보내는번호3
		
		//예약 여부 확인 date
		String parm_rdate = "";
		if(adminSmsLogVo.getRESERVATION_DT() != null) {
			String date = adminSmsLogVo.getRESERVATION_DT();
			System.out.println(date);
			parm_rdate = date;
		}
		
		String parm_rtime = "";
		//예약여부 확인 time
		if(adminSmsLogVo.getRESERVATION_TM() != null) {
			String time = adminSmsLogVo.getRESERVATION_TM();
			System.out.println(time);
			parm_rtime = time; //예약시간 173000 시분초
		}
		
		String parm_testflag = ""; //테스트일경우 Y
		String parm_destination = "";//메시지에 받는 사람 이름을 넣고 싶을 때 이용합니다. destination 값을 "휴대폰번호|이름" 과 같이 '|'문자로 구분해서 입력하시고, msg값에 “{name}” 이라는 문구를 입력 후 전송하시면 됩니다. 
		String parm_repeatFlag = ""; //반복 설정을 원하는 경우 : Y 반복 설정을 원하지 않는 경우 입력하지 마세요. 
		String parm_repeatNum = "";//1~10회 가능. 
		String parm_repeatTime = "";//15분 이상부터 가능.  
		String parm_returnurl = ""; //메시지 전송 후 이동할 페이지 
		String parm_nointeractive = ""; //사용할 경우 : 1 성공시 대화 상자(alert)를 사용 하지 않게 합니다
		String parm_smsType = ""; //SMS,LMS를 구분해서 발송처리. value=L은 LMS 발송
		if(adminSmsLogVo.getSMS_TYPE() != null) {
			parm_smsType = adminSmsLogVo.getSMS_TYPE();
		}
		
		
		String sms_url = "";
		sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
		String user_id = base64Encode("inctcokr1"); // SMS아이디
		String secure = base64Encode(APIKEY);// 인증키
		String msg = base64Encode(parm_msg);
		String rphone = base64Encode(parm_rphone);
		String sphone1 = base64Encode(parm_sphone1);
		String sphone2 = base64Encode(parm_sphone2);
		String sphone3 = base64Encode(parm_sphone3);
		String rdate = base64Encode(parm_rdate);
		String rtime = base64Encode(parm_rtime);
		String mode = base64Encode("1");

		

		String testflag = base64Encode(parm_testflag);
		String destination = base64Encode(parm_destination);
		String repeatFlag = base64Encode(parm_repeatFlag);
		String repeatNum = base64Encode(parm_repeatNum);
		String repeatTime = base64Encode(parm_repeatTime);
		String returnurl = base64Encode(parm_returnurl);
		String nointeractive = base64Encode(parm_nointeractive);
		String smsType = base64Encode(parm_smsType);

		String[] host_info = sms_url.split("/");
		String host = host_info[2];
		String path = "/" + host_info[3];
		int port = 80;

		// 데이터 맵핑 변수 정의
		String arrKey[] = new String[] { "user_id", "secure", "msg", "rphone", "sphone1", "sphone2", "sphone3", "rdate",
				"rtime", "mode", "testflag", "destination", "repeatFlag", "repeatNum", "repeatTime", "smsType",
				"subject" };
		String valKey[] = new String[arrKey.length];
		valKey[0] = user_id;
		valKey[1] = secure;
		valKey[2] = msg;
		valKey[3] = rphone;
		valKey[4] = sphone1;
		valKey[5] = sphone2;
		valKey[6] = sphone3;
		valKey[7] = rdate;
		valKey[8] = rtime;
		valKey[9] = mode;
		valKey[10] = testflag;
		valKey[11] = destination;
		valKey[12] = repeatFlag;
		valKey[13] = repeatNum;
		valKey[14] = repeatTime;
		valKey[15] = smsType;
		valKey[16] = subject;

		String boundary = "";
		Random rnd = new Random();
		String rndKey = Integer.toString(rnd.nextInt(32000));
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] bytData = rndKey.getBytes();
		md.update(bytData);
		byte[] digest = md.digest();
		for (int i = 0; i < digest.length; i++) {
			boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
		}
		boundary = "---------------------" + boundary.substring(0, 11);

		// 본문 생성
		String data = "";
		String index = "";
		String value = "";
		for (int i = 0; i < arrKey.length; i++) {
			index = arrKey[i];
			value = valKey[i];
			data += "--" + boundary + "\r\n";
			data += "Content-Disposition: form-data; name=\"" + index + "\"\r\n";
			data += "\r\n" + value + "\r\n";
			data += "--" + boundary + "\r\n";
		}

		//System.out.println(data);

		InetAddress addr = InetAddress.getByName(host);
		Socket socket = new Socket(host, port);
		// 헤더 전송
		BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
		wr.write("POST " + path + " HTTP/1.0\r\n");
		wr.write("Content-Length: " + data.length() + "\r\n");
		wr.write("Content-type: multipart/form-data, boundary=" + boundary + "\r\n");
		wr.write("\r\n");

		// 데이터 전송
		wr.write(data);
		wr.flush();

		// 결과값 얻기
		BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(), charsetType));
		String line;
		String alert = "";
		ArrayList tmpArr = new ArrayList();
		while ((line = rd.readLine()) != null) {
			tmpArr.add(line);
		}
		wr.close();
		rd.close();

		String tmpMsg = (String) tmpArr.get(tmpArr.size() - 1);
		String[] rMsg = tmpMsg.split(",");
		String Result = rMsg[0]; // 발송결과
		String Count = ""; // 잔여건수
		if (rMsg.length > 1) {
			Count = rMsg[1];
		}

		String rtn = "1";
		// 발송결과 알림
		if (Result.equals("success")) {
			alert = "성공적으로 발송하였습니다.";
			alert += " 잔여건수는 " + Count + "건 입니다.";
			rtn = "1";
		} else if (Result.equals("reserved")) {
			alert = "성공적으로 예약되었습니다";
			alert += " 잔여건수는 " + Count + "건 입니다.";
			rtn = "1";
		} else if (Result.equals("3205")) {
			alert = "잘못된 번호형식입니다.";
			rtn = Result+"";
		} else {
			alert = "[Error]" + Result;
			rtn = Result+"";
		}
		System.out.println(alert);
		return rtn;
/*
		if (nointeractive.equals("1") && !(Result.equals("Test Success!")) && !(Result.equals("success"))
				&& !(Result.equals("reserved"))) {
			System.out.println("<script>alert('" + alert + "')</script>");
		} else if (!(nointeractive.equals("1"))) {
			System.out.println("<script>alert('" + alert + "')</script>");
		}

		System.out.println("<script>location.href='" + returnurl + "';</script>");*/
		// }
	}

	public static String nullcheck(String str, String Defaultvalue) throws Exception {
		String ReturnDefault = "";
		if (str == null) {
			ReturnDefault = Defaultvalue;
		} else if (str == "") {
			ReturnDefault = Defaultvalue;
		} else {
			ReturnDefault = str;
		}
		return ReturnDefault;
	}

	/**
	 * BASE64 Encoder
	 * 
	 * @param str
	 * @return
	 */
	public static String base64Encode(String str) throws java.io.IOException {
		Base64Encoder encoder = new Base64Encoder();
		byte[] strByte = str.getBytes();
		String result = encoder.encode(strByte);
		return result;
	}
}
