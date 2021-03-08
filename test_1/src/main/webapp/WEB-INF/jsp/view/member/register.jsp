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
<%@ include file="../include/header.jsp" %>
<!--공통상단 끝-->

<style>
    a {
        color: #ffffff !important;
        text-decoration: none !important;
    }
</style>
	<form action="${pageContext.request.contextPath}/user/member/register.do" method="post" id="member_login_form" name="member_login_form" >
		<div>
			<ul>
				<li>
					<label>이메일</label>
					<input type="text" id="ID" name="EMAIL">
				</li>
				<li>			
					<label>비밀번호</label>
					<input type="password" id="PASSWORD" name="PASSWORD">
				</li>
				<li>
					<label>주소</label>
					<input type="text" id="address" name="ADDRESS">
				</li>
				<li>
					<label>핸드폰</label>
					<input type="text" id="phone" name="PHONE">
				</li>
				<li>
					<label>이름</label>
					<input type="text" id="name" name="NAME">
				</li>
				<li>
					<input type="submit" id="LOGIN"  value="회원가입">
				</li>
			</ul>
		</div>
	</form>
<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
</script>
<!-- js 끝 -->