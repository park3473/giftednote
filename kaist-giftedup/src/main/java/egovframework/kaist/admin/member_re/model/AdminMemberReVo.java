package egovframework.kaist.admin.member_re.model;

import egovframework.kaist.admin.SearchVo;

public class AdminMemberReVo extends SearchVo {

	String MEMBER_ID = ""; 
	String PASSWORD = ""; 
	String NAME = ""; 
	String PHONE = ""; 
	String EMAIL = ""; 
	String JOIN_TM = ""; 
	String CREATE_TM = ""; 
	String TYPE = ""; 
	String TYPE_SUB = ""; 
	String NAME_ENG = ""; 
	String NAME_HANJA = ""; 
	String ADDRESS_LOCAL = ""; 
	String SCHOOL_NAME = ""; 
	
	String SCHOOL_TYPE = "";
	String SCHOOL_YEAR = "";
	String SCHOOL_GROUP = "";
	
	String BIRTH = ""; 
	String SEX = ""; 
	String ZIPCODE = ""; 
	String ADDRESS = ""; 
	String ADDRESS_DETAIL = ""; 
	String LOGIN_TM = ""; 
	String UPDATE_TM = ""; 
	String TEACHER_NAME = ""; 
	
	String TEACHER_SEX = "";
	String TEACHER_BIRTH = "";
	String TEACHER_PHONE = "";
	String TEACHER_EMAIL= "";
	String TEACHER_SCHOOL_NAME = "";
	String TEACHER_SIDO_NAME = "";
	String TEACHER_MAJOR = "";
	String TEACHER_PASS= "";
	String TEACHER_TYPE= "";
	
	String DEFAULT = ""; 
	String TEL = ""; 
	String FILES = ""; 
	String IDX = "";
	String SUPPORT_AREA = "";
	
	String ELIGIBILITY = "";
	String EXP = "";
	String EXP_TYPE = "";
	String EXP_DATA = "";

	String SCORE = "";
	String RESULT = "";
	String SELF_INTR_1="";
	String SELF_INTR_2="";
	String SELF_INTR_3="";
	String TEACHER_MTV="";
	String LETER_RCMND="";
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	String DCMNT_CHECK="";
	String DCMNT_TYPE="";
	String DCMNT_NAME="";
	String UP = "";
	String DOWN = "";
	
	public String getDCMNT_TYPE() {
		return DCMNT_TYPE;
	}
	public void setDCMNT_TYPE(String dCMNT_TYPE) {
		DCMNT_TYPE = dCMNT_TYPE;
	}
	public String getDCMNT_NAME() {
		return DCMNT_NAME;
	}
	public void setDCMNT_NAME(String dCMNT_NAME) {
		DCMNT_NAME = dCMNT_NAME;
	}
	public String getDCMNT_CHECK() {
		return DCMNT_CHECK;
	}
	public void setDCMNT_CHECK(String dCMNT_CHECK) {
		DCMNT_CHECK = dCMNT_CHECK;
	}
	public String getSCHOOL_GROUP() {
		return SCHOOL_GROUP;
	}
	public void setSCHOOL_GROUP(String sCHOOL_GROUP) {
		SCHOOL_GROUP = sCHOOL_GROUP;
	}
	public String getTEACHER_MTV() {
		return TEACHER_MTV;
	}
	public void setTEACHER_MTV(String tEACHER_MTV) {
		TEACHER_MTV = tEACHER_MTV;
	}
	public String getLETER_RCMND() {
		return LETER_RCMND;
	}
	public void setLETER_RCMND(String lETER_RCMND) {
		LETER_RCMND = lETER_RCMND;
	}
	public String getTEACHER_EMAIL() {
		return TEACHER_EMAIL;
	}
	public void setTEACHER_EMAIL(String tEACHER_EMAIL) {
		TEACHER_EMAIL = tEACHER_EMAIL;
	}
	public String getSCHOOL_TYPE() {
		return SCHOOL_TYPE;
	}
	public void setSCHOOL_TYPE(String sCHOOL_TYPE) {
		SCHOOL_TYPE = sCHOOL_TYPE;
	}
	public String getSCHOOL_YEAR() {
		return SCHOOL_YEAR;
	}
	public void setSCHOOL_YEAR(String sCHOOL_YEAR) {
		SCHOOL_YEAR = sCHOOL_YEAR;
	}
	public String getTEACHER_SEX() {
		return TEACHER_SEX;
	}
	public void setTEACHER_SEX(String tEACHER_SEX) {
		TEACHER_SEX = tEACHER_SEX;
	}
	public String getTEACHER_BIRTH() {
		return TEACHER_BIRTH;
	}
	public void setTEACHER_BIRTH(String tEACHER_BIRTH) {
		TEACHER_BIRTH = tEACHER_BIRTH;
	}
	public String getTEACHER_PHONE() {
		return TEACHER_PHONE;
	}
	public void setTEACHER_PHONE(String tEACHER_PHONE) {
		TEACHER_PHONE = tEACHER_PHONE;
	}
	public String getTEACHER_SCHOOL_NAME() {
		return TEACHER_SCHOOL_NAME;
	}
	public void setTEACHER_SCHOOL_NAME(String tEACHER_SCHOOL_NAME) {
		TEACHER_SCHOOL_NAME = tEACHER_SCHOOL_NAME;
	}
	public String getTEACHER_SIDO_NAME() {
		return TEACHER_SIDO_NAME;
	}
	public void setTEACHER_SIDO_NAME(String tEACHER_SIDO_NAME) {
		TEACHER_SIDO_NAME = tEACHER_SIDO_NAME;
	}
	public String getTEACHER_MAJOR() {
		return TEACHER_MAJOR;
	}
	public void setTEACHER_MAJOR(String tEACHER_MAJOR) {
		TEACHER_MAJOR = tEACHER_MAJOR;
	}
	public String getELIGIBILITY() {
		return ELIGIBILITY;
	}
	public void setELIGIBILITY(String eLIGIBILITY) {
		ELIGIBILITY = eLIGIBILITY;
	}
	public String getEXP() {
		return EXP;
	}
	public void setEXP(String eXP) {
		EXP = eXP;
	}
	public String getEXP_TYPE() {
		return EXP_TYPE;
	}
	public void setEXP_TYPE(String eXP_TYPE) {
		EXP_TYPE = eXP_TYPE;
	}
	public String getEXP_DATA() {
		return EXP_DATA;
	}
	public void setEXP_DATA(String eXP_DATA) {
		EXP_DATA = eXP_DATA;
	}
	public String getSCORE() {
		return SCORE;
	}
	public void setSCORE(String sCORE) {
		SCORE = sCORE;
	}
	public String getRESULT() {
		return RESULT;
	}
	public void setRESULT(String rESULT) {
		RESULT = rESULT;
	}
	public String getSUPPORT_AREA() {
		return SUPPORT_AREA;
	}
	public void setSUPPORT_AREA(String sUPPORT_AREA) {
		SUPPORT_AREA = sUPPORT_AREA;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getJOIN_TM() {
		return JOIN_TM;
	}
	public void setJOIN_TM(String jOIN_TM) {
		JOIN_TM = jOIN_TM;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getTYPE_SUB() {
		return TYPE_SUB;
	}
	public void setTYPE_SUB(String tYPE_SUB) {
		TYPE_SUB = tYPE_SUB;
	}
	public String getNAME_ENG() {
		return NAME_ENG;
	}
	public void setNAME_ENG(String nAME_ENG) {
		NAME_ENG = nAME_ENG;
	}
	public String getNAME_HANJA() {
		return NAME_HANJA;
	}
	public void setNAME_HANJA(String nAME_HANJA) {
		NAME_HANJA = nAME_HANJA;
	}
	public String getADDRESS_LOCAL() {
		return ADDRESS_LOCAL;
	}
	public void setADDRESS_LOCAL(String aDDRESS_LOCAL) {
		ADDRESS_LOCAL = aDDRESS_LOCAL;
	}
	public String getSCHOOL_NAME() {
		return SCHOOL_NAME;
	}
	public void setSCHOOL_NAME(String sCHOOL_NAME) {
		SCHOOL_NAME = sCHOOL_NAME;
	}
	public String getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(String bIRTH) {
		BIRTH = bIRTH;
	}
	public String getSEX() {
		return SEX;
	}
	public void setSEX(String sEX) {
		SEX = sEX;
	}
	public String getZIPCODE() {
		return ZIPCODE;
	}
	public void setZIPCODE(String zIPCODE) {
		ZIPCODE = zIPCODE;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getADDRESS_DETAIL() {
		return ADDRESS_DETAIL;
	}
	public void setADDRESS_DETAIL(String aDDRESS_DETAIL) {
		ADDRESS_DETAIL = aDDRESS_DETAIL;
	}
	public String getLOGIN_TM() {
		return LOGIN_TM;
	}
	public void setLOGIN_TM(String lOGIN_TM) {
		LOGIN_TM = lOGIN_TM;
	}
	public String getUPDATE_TM() {
		return UPDATE_TM;
	}
	public void setUPDATE_TM(String uPDATE_TM) {
		UPDATE_TM = uPDATE_TM;
	}
	
	public String getTEACHER_NAME() {
		return TEACHER_NAME;
	}
	public void setTEACHER_NAME(String tEACHER_NAME) {
		TEACHER_NAME = tEACHER_NAME;
	}
	public String getDEFAULT() {
		return DEFAULT;
	}
	public void setDEFAULT(String dEFAULT) {
		DEFAULT = dEFAULT;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
	}
	public String getSEARCH_TYPE() {
		return SEARCH_TYPE;
	}
	public void setSEARCH_TYPE(String sEARCH_TYPE) {
		SEARCH_TYPE = sEARCH_TYPE;
	}
	public String getSEARCH_TEXT() {
		return SEARCH_TEXT;
	}
	public void setSEARCH_TEXT(String sEARCH_TEXT) {
		SEARCH_TEXT = sEARCH_TEXT;
	}
	public int getLIMIT() {
		return LIMIT;
	}
	public void setLIMIT(int lIMIT) {
		LIMIT = lIMIT;
	}
	public int getOFFSET() {
		return OFFSET;
	}
	public void setOFFSET(int oFFSET) {
		OFFSET = oFFSET;
	}
	public String getUP() {
		return UP;
	}
	public void setUP(String uP) {
		UP = uP;
	}
	public String getDOWN() {
		return DOWN;
	}
	public void setDOWN(String dOWN) {
		DOWN = dOWN;
	}
	public String getTEACHER_PASS() {
		return TEACHER_PASS;
	}
	public void setTEACHER_PASS(String tEACHER_PASS) {
		TEACHER_PASS = tEACHER_PASS;
	}
	public String getTEACHER_TYPE() {
		return TEACHER_TYPE;
	}
	public void setTEACHER_TYPE(String tEACHER_TYPE) {
		TEACHER_TYPE = tEACHER_TYPE;
	}
	public String getSELF_INTR_1() {
		return SELF_INTR_1;
	}
	public void setSELF_INTR_1(String sELF_INTR_1) {
		SELF_INTR_1 = sELF_INTR_1;
	}
	public String getSELF_INTR_2() {
		return SELF_INTR_2;
	}
	public void setSELF_INTR_2(String sELF_INTR_2) {
		SELF_INTR_2 = sELF_INTR_2;
	}
	public String getSELF_INTR_3() {
		return SELF_INTR_3;
	}
	public void setSELF_INTR_3(String sELF_INTR_3) {
		SELF_INTR_3 = sELF_INTR_3;
	}

	
	
	
	
}
