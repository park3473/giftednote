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
        color: #ffffff !important;
        text-decoration: none !important;
    }
</style>
    
    
    

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
                                    <div class="login_input_size">
                                        <input type="text" id="ID" name="EMAIL" placeholder="이메일을 입력해주세요">
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
                                    <div class="login_input_size">
                                        <input type="text" id="address" name="ADDRESS" placeholder="주소를 입력해주세요">
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
                                        <input ID="RE_BT" type="submit" id="REGISTER"  value="저장">
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
<script type="text/javascript">
</script>
<!-- js 끝 -->