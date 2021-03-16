<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->
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
    .test_div > .test_p{
    	display:none;
    }
    #detail_show > .test_p{
    	display:block;
    }

</style>
<div>
	<div>
		<div>
			<div>
				<div>
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li onclick="location.href='${pageContext.request.contextPath}/note/insert.do?IDX=${session_idx}'">추가</li>
					</ul>
				</div>
			
				<c:forEach var="item" items="${model.list}" varStatus="var">
				<div style="width:300px;" onclick="javascript:detail(${item.N_IDX})" id="${item.N_IDX }_detail" class="test_div">
						<img style="width:300px;"src="${pageContext.request.contextPath}/resources/upload/note_img/${item.IMAGE }.png">
						<div id="${item.N_IDX }_idx" class="test_p">
							<p>${item.TITLE }</p>
							<p>${item.TOPIC }</p>
							<p>${item.LEADER }</p>
							<p>${item.ASSI }</p>
							<p>${item.INTRO }</p>
							<p>${item.START_TM }</p>
							<p>${item.END_TM }</p>
						</div>
				</div>
				</c:forEach>
				<div>
					<div id="detail_show">
					
					</div>
					<div id="detail_wrap" style="display:none">
						<div id="detail_wrap_bt">작성하러가기</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
/*
alert('${ip_session}');
if('${check}' == 'fail'){
	alert("실패");
}else{
	alert("성공")
}
*/
	function detail(idx){
		const element = document.getElementById(idx+'_detail');
		  //alert(element.innerHTML);
		  $('#detail_show').html(element.innerHTML);
		  $('#detail_wrap').show();
		  $('#detail_wrap_bt').attr('ondblclick','location.href="/note/detail.do?N_IDX='+idx+'"');
	}
</script>
<!-- js 끝 -->