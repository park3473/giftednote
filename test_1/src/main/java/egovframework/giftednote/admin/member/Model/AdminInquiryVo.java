package egovframework.giftednote.admin.member.Model;

import egovframework.giftednote.user.SearchVo;

public class AdminInquiryVo extends SearchVo {

	String I_IDX = "";
	String IDX = "";
	String CREATE_TM = "";
	String NAME = "";
	String CONTENT = "";
	String STAT = "";
	String ANSWER= "";
	String A_CREATE_TM = "";
	String A_NAME = "";
	String TITLE = "";
	
	int LIMIT;
	int OFFSET;
	
	
	public String getI_IDX() {
		return I_IDX;
	}
	public void setI_IDX(String i_IDX) {
		I_IDX = i_IDX;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getSTAT() {
		return STAT;
	}
	public void setSTAT(String sTAT) {
		STAT = sTAT;
	}
	public String getANSWER() {
		return ANSWER;
	}
	public void setANSWER(String aNSWER) {
		ANSWER = aNSWER;
	}
	public String getA_CREATE_TM() {
		return A_CREATE_TM;
	}
	public void setA_CREATE_TM(String a_CREATE_TM) {
		A_CREATE_TM = a_CREATE_TM;
	}
	public String getA_NAME() {
		return A_NAME;
	}
	public void setA_NAME(String a_NAME) {
		A_NAME = a_NAME;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
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
	
	
	
}
