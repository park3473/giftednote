<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script src="${pageContext.request.contextPath}/resources/sweetalert/jquery-1.12.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->

<c:if test="${ssion_langage == 'kr'}">자가진단</c:if>
<c:if test="${ssion_langage != 'kr'}">자가진단(영어)</c:if>
<div>
<c:if test="${session_login == 'ok'}">로그인 온</c:if>
<p>${session_email}</p>
</div>
<!--공통상단-->
<%@ include file="../include/header.jsp" %>
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
<%@ include file="../include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
alert('${ip_session}');
if('${check}' == 'fail'){
	alert("실패");
}else{
	alert("성공")
}
</script>
<!-- js 끝 -->