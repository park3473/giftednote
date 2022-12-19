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
                                <li class="login_input_ob id_input">
                                    <div class="txt">
                                        <span>이메일</span>
                                    </div>
                                    <div class="login_input_size">
                                        <input type="text" id="ID" onkeyup="login_enter();" name="EMAIL" placeholder="이메일">
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
                            </ul>
                            <div class="button_box">
                                <button type="button" onclick="javascript:login()">로그인</button>
                            </div>
                        </form>
                    </div>
                    <div class="login_button">
                        <ul class="btn_box">
                            <li id="join_btn" class="btn_ob btn_ob_01">
                                <button type="button" onclick="location.href='${pageContext.request.contextPath}/user/member/register.do'">회원가입</button>
                            </li>
                            <li id="pw_btn" class="btn_ob btn_ob_02">
                                <button type="button" id="bt_pw" onclick="javascript:bt_pwss()">비밀번호 찾기</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 로그인 폼 end -->


<!-- 비밀번호 찾기 -->
<div id="pw_modal" class="join_modal">
    <div class="join_modal_con">
        <div class="pw_box">
            <div class="join_title">
                <!-- 공통타이틀 -->
                <div class="all_title">
                    <div class="line"><span></span></div>
                    <h2>비밀번호 찾기</h2>
                </div>
                <!-- 공통타이틀 -->

                <!-- 닫기 -->
                <div class="close_btn">
                    <a href="#">
                        <i class="las la-times"></i>
                    </a>
                </div>
            </div>

            <div class="pw_cont">
                <div class="pw_cont_box">
                    <div class="pw_title">
                        <h2>비밀번호를 잊어버리셨나요?</h2>
                        <p>기존에 가입하신 이메일을 입력하시면 알람창으로 확인이 가능합니다.</p>
                    </div>
                    <div class="pw_size">
                        <input type="text" id="password_re_email" name="EMAIL">
                    </div>
                    <div class="pw_btn">
                        <input type="button" onclick="javascript:password_re_search()" id="pw_re" value="비밀번호 찾기">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호 찾기 end -->

    

<!--공통하단-->
<%@ include file="./include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
	//alert('${ip_session}');
	function bt_pwss(){
		$('#pw_modal').show();
		
	}
	function login() {
	    if ($('#ID').val() == '') {
	        alert('아이디를 입력 해주세요');
	        return;
	    }
	    if ($('#PASSWORD').val() == '') {
	        alert('패스워드 입력 해주세요');
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
	                location.href = '${pageContext.request.contextPath}/note/list.do?EMAIL='+$('#ID').val();
	                return;
	            } else if (result.indexOf("false:-1") > -1) {
	                Swal.fire('이메일 혹은 패스워드를 재확인 해주십시오.');
	                return;
	            }      
	        }
	    });
	}

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
	
	function login_enter(){
		if(window.event.keyCode == 13){
			login();
		}
	}
	
	
</script>
<!-- js 끝 -->