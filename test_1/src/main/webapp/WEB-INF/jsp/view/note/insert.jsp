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
    .img_modal{
    width : 1000px;
    height: 500px;
    }
    .img_modal img{
    	width : 100px;
    	heigth : auto;
    }
	#img_check{
		width:100px;
	}
	#img_modal_open{
		width: 100px;
		border : 1px solid black;
	}
</style>
<div>
	<div>
		<div>
			<form action="${pageContext.request.contextPath}/note/insert.do" id="f_insert_note" method="POST">
				<div>
					
				</div>
				<div>
					<img id="img_check" src="#" alt="ddd">
					<input type="hidden" name="IMAGE" id="IMAGE">
					<p id="img_modal_open" onclick="javascript:img_modal()">표지 선택</p>
				</div>
				<div>
					<span>제목</span><input type="text" name="TITLE">
				</div>
				<div>
					<span>주제</span><input type="text" name="TOPIC">
				</div>
				<div>
					<span>지도자</span><input type="text" name="LEADER" id="leader"><span class="search" cked="mento">검색</span>
				</div>
				<div>
					<span>조교</span><input type="text" name="ASSI" id="assi"><span class="search" cked="mento">검색</span>
				</div>
				<div>
					<span>주제</span><input type="text" name="INTRO">
				</div>
			</form>
				<div>
					<div>
							<label>검색창</label><input type="text"><span class="search" cked="student">검색</span>
					</div>
					<div>
						<p>추가 전 학생</p>
					<ul id="no_check_list_team">
						<c:forEach var="item" items="${model.list}" varStatus="var">
							<li id="check_${item.IDX }" ondblclick="javascript:check_id('${item.IDX}')" value="${item.IDX }" name="${item.NAME }" idx="${item.IDX }" school_name="${item.SCHOOL_NAME }" school_year="${item.SCHOOL_YEAR }"><span>${item.NAME }</span></li>
						</c:forEach>
					</ul>
					</div>
				</div>
				<div id="asd">
					<p>추가된 학생</p>
					<ul id="check_list_team">
						<!-- 추가된 학생 리스트가 들어갈 자리 -->
					</ul>
				</div>
			<div>
				<button onclick="javascript:insert_note()">테스트 입력!</button>
			</div>
		</div>
	</div>
</div>
<!-- img_modal start -->
	<div style="display:none" class="img_modal">
		<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_0505.png" ondblclick="javascript:check_img('1_0505')" >
		<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_1515.png" ondblclick="javascript:check_img('1_1515')">
		<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_3535.png" ondblclick="javascript:check_img('1_3535')">
		<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_4545.png" ondblclick="javascript:check_img('1_4545')">
		<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_5555.png" ondblclick="javascript:check_img('1_5555')">
	</div>
<!-- img_modal end -->
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
	//이미지 모달창 띄우기
	function img_modal(){
		$('.img_modal').show();
	}
	
	//이미지 선택하면 표지 이미지선택되는창
	function check_img(e){ 
		console.log(e);
		$('.img_modal').hide();
		$('#img_check').attr('src','${pageContext.request.contextPath}/resources/upload/note_img/'+e+'.png')
		$('#IMAGE').val(e);
	}
	
	function check_id(e){
		console.log(e);
		var name = $('#check_'+e).attr('name');
		var school_name = $('#check_'+e).attr('school_name');
		var school_year = $('#check_'+e).attr('school_year');
		var idx = $('#check_'+e).val();
		$('#check_'+e).remove();
		$('#check_list_team').append('<li id=checking_'+idx+' name='+name+' school_name='+school_name+' school_year='+school_year+' value='+idx+' ondblclick="javascript:no_check_id('+idx+')">'+name+'</li>');
	}
	
	function no_check_id(e){
		console.log(e);
		var name = $('#checking_'+e).attr('name');
		var school_name = $('#checking_'+e).attr('school_name');
		var school_year = $('#checking_'+e).attr('school_year');
		var idx = $('#checking_'+e).val();
		$('#checking_'+e).remove();
		$('#no_check_list_team').append('<li id=check_'+idx+' name='+name+' school_name='+school_name+' school_year='+school_year+' value='+idx+' ondblclick="javascript:check_id('+idx+')">'+name+'</li>');
	}
	
	$(document).ready(function (){
		$('.search').click(function(){
			var EMAIL = $(this).prev().val();
			var what_id = $(this).prev().attr('id');
			var cked = $(this).attr('cked');
			if(cked == 'mento'){
				$.ajax({
					type : "POST",
					url : "/user/member/search.do?",
					cache : false,
					data : ({
						EMAIL : EMAIL
					}),
					dataType : "json",
					success: function(data , status, xhr){
						console.log(data);
						if(data.length > 0){
							for(i = 0; i<data.length; i++){
								$('#'+what_id).val(data[i].name);
							}
						}
					}
				})
			}else if(cked == 'student'){
				$.ajax({
					type : "POST",
					url : "/user/member/search.do?",
					cache : false,
					data : ({
						EMAIL : EMAIL
					}),
					dataType : "json",
					success: function(data , status, xhr){
						console.log(data);
						if(data.length > 0){
							for(i = 0; i<data.length; i++){
								$('#no_check_list_team').html('');
								$('#no_check_list_team').append('<li id=checking_'+data[i].idx+' name='+data[i].name+' school_name='+data[i].school_name+' school_year='+data[i].school_year+' value='+data[i].idx+' ondblclick="javascript:check_id('+data[i].idx+')">'+data[i].name+'</li>');
							}
						}
					}
				})	
			}
		})
	})
	
	
	function insert_note(){
		$('#f_insert_note').submit();
	}
</script>
<!-- js 끝 -->