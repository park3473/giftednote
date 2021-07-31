<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script src="${pageContext.request.contextPath}/resources/sweetalert/jquery-1.12.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->
<!--공통상단-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/terms.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/login.css" type="text/css">
<!--공통상단 끝-->

<style>
    a {
        color: #ffffff;
        text-decoration: none !important;
    }
    
    .address_input input{
    	width : 50% !important;
    	float: left;
    }
</style>
<%@ include file="../../include/head.jsp" %>
    
    
    

<!-- 로그인 폼 -->
<section id="new_login" class="login_wrap">
    <div class="login_area">
        <div class="login_con">
            <div class="login_size">
                <div class="logo_box">
                    <img src="${pageContext.request.contextPath }/resources/img/logo.png">
                </div>
                <!--이용약관 내용-->
                                    <div class="terms_wrap">
                                        <div class="terms_area">
                                            <div class="personal_wrap">
                                                <div class="title">
                                                    <h2>개인정보 수집·이용 동의</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공 받는 자</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ KAIST 과학영재교육연구원</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자의 개인정보 이용목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 사업 운영 및 지원</p>
                                                                <p>■ 사업 운영 및 결과보고서 작성 사업관리</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 제공되는 개인정보의 항목</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ [필수항목] : 성명 , 연락처 , 학교명 , 학년 , 주소 , 생년월일 </p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는자의 개인정보 보유 및 이용기간</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 이용은 수집일로부터 사업 종료시까지</p>
                                                                <p>■ 보유는 사업 종료시 부터 3년</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 수집 및 이용 거부에 따른 불이익 또는 제한사항</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재노트 프로젝트 참여 제한 및 이수증 발급 불가</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join1" name="join1" onclick="javascript:all_check()">
                                                    </div>
                                                    <label for="join1">확인 및 동의합니다.</label>
                                                </div>
                                            </div>
                                            <div class="personal_wrap">
                                                <div class="title">
                                                    <h2>개인정보 제 3자 제공 동의</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공 받는자(3자)</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 교육부, 시·도교육청</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자(3자)의 개인정보 이용목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재노트 프로젝트 사업 관리 및 대상자 지원</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자(3자)에게 제공되는 개인정보의 항목</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ [필수항목] : 성명 , 연락처 , 학교명 , 학년 , 주소 , 생년월일 </p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자(3자)의 개인정보 보유 및 이용기간</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 이용은 수집일로부터 사업 종료시 까지</p>
                                                                <p>■ 보유는 사업 종료시 부터 3년</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 3자 제공 동의 거부 시 불이익 또는 제한사항</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재노트 프로젝트 참여 제한 및 이수증 발급 불가</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join2" name="join2" onclick="javascript:all_check()">
                                                    </div>
                                                    <label for="join2">확인 및 동의합니다.</label>
                                                </div>
                                            </div>
                                            
                                            <div class="personal_wrap personal_wrap_auto">
                                                <ul class="personal_list">
                                                    <li>
                                                        <p>개인정보 제공자가 동의한 내용 외의 다른 목적으로 개인정보를 이용하지 않으며, 정보주체는 개인정보처리자 (KAIST 과학영재교육연구원)에게 본인의 개인정보에 대한 열람, 정정, 삭제를 요구할 수 있습니다.</p>
                                                    </li>
                                                    <li>
                                                        <p>『 개인정보 보호법 제15조(개인정보의 수집•이용), 제17조(개인정보의 제공), 제18조(개인정보의 이용제공 ‧ 제한), 제22조(동의를 받는 방법) 』 에 의거 개인정보 처리에 관하여 고지를 받았으며, 본인은 위와 같이 개인정보  수집 및 이용 ‧ 제공에 동의합니다.</p>
                                                    </li>
                                                </ul>
                                            </div>
                                            
                                            <div class="all_check_box">
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join_all" onclick="checkAll(); " name="join_all">
                                                    </div>
                                                    <label for="join_all">모두 동의합니다.</label>
                                                </div>
                                            </div>
                                            
                                            <!--보드 검색_버튼-->
                                            <div class="board_btn_wrap">
                                                <div class="board_btn">
                                                    <button class="delete" href="#" onclick="goNext()">다음</button>
                                                </div>
                                            </div>
                                            <!--보드 검색_버튼 end-->
                                            
                                        </div>
                                    </div>
                                    <!--이용약관 내용 end-->
            </div>
        </div>
    </div>
</section>
<!-- 로그인 폼 end -->
<!-- js 시작 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function goNext(){
	    var form = document.memberForm;
	    if($("input[name='join1']:checked").val() == "on" && $("input[name='join2']:checked").val() == "on"){
	    	location.href='${pageContext.request.contextPath}/user/member/register.do';
	    } else{
	        alert("약관에 동의를 하셔야 합니다.");
	        return false;
	    }
	}
	
	function checkAll(){
	    if($("input[name='join_all']").is(':checked') == true){
	    	var check = $("input[name='join_all']").is(":checked");
	        $("input[name='join1']").prop("checked", true);
	        $("input[name='join2']").prop("checked", true);
	//        $("input[name='join3']").attr("checked", check);
	        $("input[name='join4']").prop("checked", true);
	    }else{
	    	var check = $("input[name='join_all']").is(":checked");
	        $("input[name='join1']").prop("checked", false);
	        $("input[name='join2']").prop("checked", false);
	//        $("input[name='join3']").attr("checked", check);
	        $("input[name='join4']").prop("checked", false);
	    }
	    
	}
	
	function all_check(){
	    var check1 = $("input[name='join1']").is(":checked");
	    var check2 = $("input[name='join2']").is(":checked");
	//    var check3 = $("input[name='join3']").is(":checked");
	    var check4 = $("input[name='join4']").is(":checked");
	
	    if(check1 && check2 && check4){
	    	//alert(check1 && check2 && check4);
	        $("input[name='join_all']").prop("checked", true);
	    }else{
	    	//alert(check1 && check2 && check4);
	        $("input[name='join_all']").prop("checked", false);
	    }

	}
</script>


<!-- js 끝 -->