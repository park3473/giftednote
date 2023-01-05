<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!--삭제금지-->
<!--공통상단-->
<!--CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tail.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/index.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/login.css" type="text/css">
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- fontawasome/lineawasome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawasome/all.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<!--공통상단 끝-->

<style>
    a {
        color: #ffffff !important;
        text-decoration: none !important;
    }

    .video_wrap {
        position: fixed;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
    }

    @media all and (max-width: 801px) {
        .video_wrap {
            display: none;
        }
    }

</style>

<!-- 
<a href="${pageContext.request.contextPath}/langage.do?langage=kr">한국어</a>
<a href="${pageContext.request.contextPath}/langage.do?langage=us">영어</a> 
테스트  : <spring:message code="index.test"/> 
<c:if test="${ssion_langage == 'kr'}">
한국어

</c:if>
<c:if test="${ssion_langage == 'us'}">
영어
</c:if>
-->

    
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
                        <form class="form" action="#" method="post" id="member_login_form" name="member_login_form">
                            <ul class="login_input">
                            	<li class="login_input_check_type">
                            		<div class="login_input_size">
                            			<ul>
                            				<li id="login_input_radio_li">
                            					<span>회원 유형</span>
                            				</li>
                            				<li id="login_input_radio_li">
                            					<input type="radio" name="type" id="type_student" value="student">
                            					<label for="type">학생</label>
                            				</li>
                            				<li id="login_input_radio_li">
                            					<input type="radio" name="type" id="type_mento" value="mento">
                            					<label for="type">지도자</label>
                            				</li>
                            			</ul>
                            		</div>
                            	</li>
                                <li class="login_input_ob id_input">
                                    <div class="txt">
                                        <span>아이디</span>
                                    </div>
                                    <div class="login_input_size">
                                        <input type="text" id="ID" onkeyup="login_enter();" name="ur_userid" placeholder="아이디">
                                    </div>
                                </li>
                                <li class="login_input_ob pw_input">
                                    <div class="txt">
                                        <span>이름</span>
                                    </div>
                                    <div class="login_input_size">
                                        <input type="text" onkeyup="login_enter();" class="login_input" id="ur_name" name="ur_name" placeholder="이름">
                                    </div>
                                </li>
                            </ul>
                            <div class="button_box">
                                <button type="button" id="login_button" onclick="javascript:login()">로그인</button>
                            </div>
                        </form>
                        <div id="admin_button_box">
                        		<button type="button" id="admin_login_button" class="${ip_session }" onclick="admin_login()">관리자 로그인</button>
                        	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 로그인 폼 end -->



<!-- 비밀번호 찾기 end -->

    

<!--공통하단-->
<%@ include file="./user/include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
	//alert('${ip_session}');
	function bt_pwss(){
		$('#pw_modal').show();
		
	}
	function login() {
		if($('input[name="type"]:checked').val() == null){
			alert('회원 유형을 선택해 주세요.');
	        return;
		}
		
	    if ($('#ID').val() == '') {
	        alert('아이디를 입력 해주세요');
	        return;
	    }
	    if ($('#NAME').val() == '') {
	        alert('이름 입력 해주세요');
	        return;
	    }
	
	    var URL = '${pageContext.request.contextPath}/user/member/login.do'
	    var formData = $("#member_login_form").serialize();
	
	    console.log(formData);
	
	    $.ajax({
	        type: "POST",
	        url: URL,
	        cache: false,
	        data: formData,
	        success: function(result) {
	            var s = result.indexOf("true");
	            if (s > -1) {
	                idchk = true;
	                location.href = '${pageContext.request.contextPath}/note/list.do?USER_ID='+$('#ID').val()+'&TYPE='+$('input[name="type"]:checked').val()+'';
	                return;
	            } else if (result.indexOf("false:-1") > -1) {
	                Swal.fire('아이디 또는 회원유형을 재확인 해주십시오.');
	                return;
	            }      
	        }
	    });
	}
	/* 비밀번호 찾기 기능 제거
	function password_re_search(){
		var EMAIL = $('#password_re_email').val() 
		$.ajax({
		        type: "POST",
		        url: "/user/member/pw_re.do",
		        cache: false,
		        data: ({
		        	EMAIL : EMAIL
		        }),
		        dataType : "json",
		        success: function(data,status,xhr) {
		        	console.log(data.pw);
		        	var password = data;
		        	console.log(password);
		            Swal.fire('비밀번호는'+password+'입니다.');
		        }
		    });
	}
	*/
	function login_enter(){
		
		if(window.event.keyCode == 13){
			login();
		}
		
	}
	
	function admin_login(){
		location.href="${pageContext.request.contextPath}/admin/team/note_list.do";
	}
	
	
</script>
<!-- js 끝 -->