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
                <div class="login_cont">
                    <div class="login_form">
                        <form class="form" action="${pageContext.request.contextPath}/user/member/register.do" method="post" id="member_login_form" name="member_login_form">
                            <ul class="login_input login_input_full">
                                <li class="login_input_ob name_input">
                                    <div class="txt">
                                        <span>이름</span>
                                    </div>
                                    <div class="login_input_size">
                                        <input type="text" id="name" name="NAME" placeholder="이름을 입력해주세요">
                                    </div>
                                </li>
                                <li class="login_input_ob id_input">
                                    <div class="txt">
                                        <span>이메일</span>
                                    </div>
                                    <button  type="button" onclick="id_check()">중복 검색</button>
                                    <div class="login_input_size">
                                        <input type="text" id="ID" name="EMAIL" placeholder="이메일을 입력해주세요" id_check="">
                                        
                                    </div>
                                </li>
                                <li class="login_input_ob pw_input">
                                    <div class="txt">
                                        <span>비밀번호</span>
                                    </div>
                                    <div class="login_input_size">
                                        <input type="password" onkeyup="login_enter();" class="login_input" id="PASSWORD" name="PASSWORD" placeholder="비밀번호">
                                    </div>
                                </li>
                                <li class="login_input_ob pw_input">
                                    <div class="txt">
                                        <span>주소</span>
                                    </div>
                                    <button type="button" onclick="zipCode();">주소 검색</button>
                                    <div class="login_input_size address_input">
                                        <input type="text" id="address" name="RODE_ADDRESS" placeholder="주소를 검색하여주세요.">
                                        <input type="text" id="address_detail" name="ADDRESS_DETAIL" placeholder="상세주소를 입력하여주세요.">
                                        <input type="hidden" id="address_full" name="ADDRESS">
                                    </div>
                                </li>
                                 <li class="login_input_ob pw_input">
                                    <div class="txt">
                                        <span>학교검색</span>
                                    </div>
                                    <button type="button" onclick="javascript:void(window.open('/user/member/school.do', '학교 검색','width=930, height=500'))">학교검색</button>
                                    <div class="login_input_size">
                                        <input type="text" id="SCHOOL_NAME" name="SCHOOL_NAME" placeholder="학교를 검색하여주세요.">
                                    </div>
                                </li>
                                <li class="login_input_ob pw_input">
                                    <div class="txt">
                                        <span>휴대폰</span>
                                    </div>
                                    <div class="login_input_size">
                                        <input type="text" id="phone" name="PHONE" placeholder="휴대폰 번호를 입력해주세요.">
                                    </div>
                                </li>
                                <li class="login_input_ob pw_input">
                                    <div class="txt">
                                        <span>직업 선택</span>
                                    </div>
                                    <div class="login_input_size">
                                        <select  id="level" name="LEVEL" >
                                            <option value="">
                                                직업을 선택하여주세요.
                                            </option>
                                            <option value="2">
                                                교수 or 조교
                                            </option>
                                            <option value="1">
                                                학생
                                            </option>
                                        </select>
                                    </div>
                                </li>
                            </ul>
                            <div class="join_submit_btn">
                                <div class="join_txt">
                                    <p>※ 회원가입 후 "이메일 주소/비밀번호" 입력하여 로그인이 가능합니다.</p>
                                </div>
                                <ul class="join_btn">
                                    <li class="submit_btn">
                                        <input ID="RE_BT" type="button" onclick="insert_member();" id="REGISTER"  value="저장">
                                    </li>
                                    <li class="cancel_btn">
                                        <input onclick="location.href='${pageContext.request.contextPath}/index.do'" value="취소">
                                    </li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 로그인 폼 end -->
<!-- js 시작 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function zipCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            console.log(data);
            $('#address').val(data.roadAddress);
        }
    }).open();
}


function id_check(){
	if($('#ID').val() == ''){
		alert('중복 검색할 아이디를 입력하여 주세요');
		return;
	}else if($('#ID').attr('id_check') == 'okok'){
		alert('이미 중복 확인한 아이디입니다.');
	}else{
	
		var EMAIL = $('#ID').val();
		$.ajax({
			type : "POST",
			url : "/user/member/id_check.do",
			cache : false,
			data : ({
				EMAIL : EMAIL
			}),
			dataType : "json",
			success: function(data , status, xhr){
					if(data == true){
						var id_hold = confirm("사용하실수 있는 아이디 입니다. 사용하시겠습니까?");
						if(id_hold == true){
							$('#ID').attr('readonly','readonly');
							$('#ID').attr('id_check','okok')
						}else if(id_hold == false){
							$('#ID').val('');
						}
					}else if(data == false){
						alert("사용할수 없는 아이디 입니다.")
					}else{
						alert('오류 입니다.');
					}
				}
		})
	}
	
}


function insert_member(){
	if($('#ID').attr('id_check') != 'okok'){
		alert('아이디 중복체크를 해주세요.')
		return;
	}
	if($('#name').val() == ''){
		alert('이름을 입력하여주세요')
		return;
	}
	if($('#ID').val() == ''){
		alert('아이디를 입력하여 주세요')
		return;
	}
	if($('#PASSWORD').val() == ''){
		alert('비밀번호를 입력하여 주세요')
		return;
	}
	if($('#address').val() == ''){
		alert('주소를 검색하여 입력하여 주세요')
		return;
	}
	if($('#address_detail').val() == ''){
		alert('상세 주소를 입력하여 주세요')
		return;
	}
	
	var full_address_name = $('#address').val() + "[" + $('#address_detail').val() + "]"
	$('#address_full').val(full_address_name)
	
	
	if($('#SCHOOL_NAME').val() == ''){
		alert('학교를 검색하여 정보를 입력하세요')
		return;
	}
	if($('#phone').val() == ''){
		alert('핸드폰 번호를 입력하여주세요')
		return;
	}
	if($('#LEVEL').val() == ''){
		alert('권한을 설정하여 주세요')
		return;
	}
	
	console.log($("#member_login_form").serializeArray());
	$('#member_login_form').submit();
}

</script>


<!-- js 끝 -->