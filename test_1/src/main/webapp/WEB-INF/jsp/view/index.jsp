<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->

<c:if test="${ssion_langage == 'kr'}">자가진단</c:if>
<c:if test="${ssion_langage != 'kr'}">자가진단(영어)</c:if>
<div>
	<form action="${pageContext.request.contextPath}/user/member/login.do" method="post" id="member_login_form" name="member_login_form" >
		<input type="text" id="ID" name="EMAIL">
		<input type="password" id="PASSWORD" name="PASSWORD">
		<input type="submit" id="LOGIN" value="로그인">
	</form>
</div>
<div>
	<a href="${pageContext.request.contextPath}/user/member/register.do" style="color:black !important">회원가입</a>
</div>
<div>
	<div id="bt_pw" onclick="javascript:bt_pw()">비밀번호 찾기</div>
</div>
<div style="display:none" id="ff">
	<div>
		<form action="${pageContext.request.contextPath}/user/member/pw_re.do" method="post" id="member_pw_re_form" name="member_pw_re_form">
			<input type="text" id="ID" name="EMAIL">
			<input type="submit" id="pw_re" value="비밀번호 찾기">
		</form>
	</div>
</div>
<div>
	${PASSWORD}
</div>
<!--공통상단-->
<%@ include file="./include/header.jsp" %>
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

<!--메인버튼 끝-->

<!--공통하단-->
<%@ include file="./include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
alert('${ip_session}');
function bt_pw(){
	$('#ff').css('display','block');
	
}
</script>
<!-- js 끝 -->