package egovframework.giftednote.user.note.model;

import egovframework.giftednote.user.SearchVo;

public class UserNoteVo extends SearchVo{
	
	 String N_IDX = "";
	  String IMAGE = "";
	  String TITLE = "";
	  String TOPIC = "";
	  String LEADER = "";
	  String ASSI = "";
	  String INTRO = "";
	  String START_TM = "";
	  String END_TM = "";
	  String DEAD = "";
	  String IDX = "";
	  String EMAIL = "";
	  String SEARCH_TYPE = "";
	  String SEARCH_TEXT = "";
	  
	  int LIMIT;
	  int OFFSET;
	  
	  String lab_prog_id = "";
	  String lab_id = "";
	  String lab_coll_cd = "";
	  String lab_ur_userid = "";
	  String lab_num = "";
	  String lab_name = "";
	  String lab_study_title = "";
	  String lab_studey_title_en = "";
	  String lab_position = "";
	  String lab_room_name = "";
	  String lab_room_url = "";
	  String lab_room_position = "";
	  String lab_room_tel1 = "";
	  String lab_room_tel2 = "";
	  String lab_student_capacity = "";
	  String lab_student_attiude = "";
	  String lab_select = "";
	  String lab_assign_student = "";
	  String lab_reg_dt = "";
	  String lab_mod_dt = "";
	  String lab_report_abstract = "";
	  String lab_report_tags = "";
	  String lab_report_abstract_with_brace = "";
	  String lab_report_uid = "";
	  String ur_userid = "";
	  String type = "";
	  
	public String getN_IDX() {
		return N_IDX;
	}
	public void setN_IDX(String n_IDX) {
		N_IDX = n_IDX;
	}
	public String getIMAGE() {
		return IMAGE;
	}
	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getTOPIC() {
		return TOPIC;
	}
	public void setTOPIC(String tOPIC) {
		TOPIC = tOPIC;
	}
	public String getLEADER() {
		return LEADER;
	}
	public void setLEADER(String lEADER) {
		LEADER = lEADER;
	}
	public String getASSI() {
		return ASSI;
	}
	public void setASSI(String aSSI) {
		ASSI = aSSI;
	}
	public String getINTRO() {
		return INTRO;
	}
	public void setINTRO(String iNTRO) {
		INTRO = iNTRO;
	}
	public String getSTART_TM() {
		return START_TM;
	}
	public void setSTART_TM(String sTART_TM) {
		START_TM = sTART_TM;
	}
	public String getEND_TM() {
		return END_TM;
	}
	public void setEND_TM(String eND_TM) {
		END_TM = eND_TM;
	}
	public String getDEAD() {
		return DEAD;
	}
	public void setDEAD(String dEAD) {
		DEAD = dEAD;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
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
	public String getLab_prog_id() {
		return lab_prog_id;
	}
	public void setLab_prog_id(String lab_prog_id) {
		this.lab_prog_id = lab_prog_id;
	}
	public String getLab_id() {
		return lab_id;
	}
	public void setLab_id(String lab_id) {
		this.lab_id = lab_id;
	}
	public String getLab_coll_cd() {
		return lab_coll_cd;
	}
	public void setLab_coll_cd(String lab_coll_cd) {
		this.lab_coll_cd = lab_coll_cd;
	}
	public String getLab_ur_userid() {
		return lab_ur_userid;
	}
	public void setLab_ur_userid(String lab_ur_userid) {
		this.lab_ur_userid = lab_ur_userid;
	}
	public String getLab_num() {
		return lab_num;
	}
	public void setLab_num(String lab_num) {
		this.lab_num = lab_num;
	}
	public String getLab_name() {
		return lab_name;
	}
	public void setLab_name(String lab_name) {
		this.lab_name = lab_name;
	}
	public String getLab_study_title() {
		return lab_study_title;
	}
	public void setLab_study_title(String lab_study_title) {
		this.lab_study_title = lab_study_title;
	}
	public String getLab_studey_title_en() {
		return lab_studey_title_en;
	}
	public void setLab_studey_title_en(String lab_studey_title_en) {
		this.lab_studey_title_en = lab_studey_title_en;
	}
	public String getLab_position() {
		return lab_position;
	}
	public void setLab_position(String lab_position) {
		this.lab_position = lab_position;
	}
	public String getLab_room_name() {
		return lab_room_name;
	}
	public void setLab_room_name(String lab_room_name) {
		this.lab_room_name = lab_room_name;
	}
	public String getLab_room_url() {
		return lab_room_url;
	}
	public void setLab_room_url(String lab_room_url) {
		this.lab_room_url = lab_room_url;
	}
	public String getLab_room_position() {
		return lab_room_position;
	}
	public void setLab_room_position(String lab_room_position) {
		this.lab_room_position = lab_room_position;
	}
	public String getLab_room_tel1() {
		return lab_room_tel1;
	}
	public void setLab_room_tel1(String lab_room_tel1) {
		this.lab_room_tel1 = lab_room_tel1;
	}
	public String getLab_room_tel2() {
		return lab_room_tel2;
	}
	public void setLab_room_tel2(String lab_room_tel2) {
		this.lab_room_tel2 = lab_room_tel2;
	}
	public String getLab_student_capacity() {
		return lab_student_capacity;
	}
	public void setLab_student_capacity(String lab_student_capacity) {
		this.lab_student_capacity = lab_student_capacity;
	}
	public String getLab_student_attiude() {
		return lab_student_attiude;
	}
	public void setLab_student_attiude(String lab_student_attiude) {
		this.lab_student_attiude = lab_student_attiude;
	}
	public String getLab_select() {
		return lab_select;
	}
	public void setLab_select(String lab_select) {
		this.lab_select = lab_select;
	}
	public String getLab_assign_student() {
		return lab_assign_student;
	}
	public void setLab_assign_student(String lab_assign_student) {
		this.lab_assign_student = lab_assign_student;
	}
	public String getLab_reg_dt() {
		return lab_reg_dt;
	}
	public void setLab_reg_dt(String lab_reg_dt) {
		this.lab_reg_dt = lab_reg_dt;
	}
	public String getLab_mod_dt() {
		return lab_mod_dt;
	}
	public void setLab_mod_dt(String lab_mod_dt) {
		this.lab_mod_dt = lab_mod_dt;
	}
	public String getLab_report_abstract() {
		return lab_report_abstract;
	}
	public void setLab_report_abstract(String lab_report_abstract) {
		this.lab_report_abstract = lab_report_abstract;
	}
	public String getLab_report_tags() {
		return lab_report_tags;
	}
	public void setLab_report_tags(String lab_report_tags) {
		this.lab_report_tags = lab_report_tags;
	}
	public String getLab_report_abstract_with_brace() {
		return lab_report_abstract_with_brace;
	}
	public void setLab_report_abstract_with_brace(String lab_report_abstract_with_brace) {
		this.lab_report_abstract_with_brace = lab_report_abstract_with_brace;
	}
	public String getLab_report_uid() {
		return lab_report_uid;
	}
	public void setLab_report_uid(String lab_report_uid) {
		this.lab_report_uid = lab_report_uid;
	}
	public String getUr_userid() {
		return ur_userid;
	}
	public void setUr_userid(String ur_userid) {
		this.ur_userid = ur_userid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	  
	  
	
	
	
	
}
