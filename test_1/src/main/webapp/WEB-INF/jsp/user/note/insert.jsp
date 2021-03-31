<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->
<!--공통상단-->
<%@ include file="../../include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/register.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/insert.css" type="text/css">
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
    .img_modal img{
    	width : 100px;
    	heigth : auto;
    }
	#img_check{
		width:100px;
	}
</style>
<section id="new_sc" class="sc_wrap">
        <div class="sc_area">
            <div class="sc_con">
                <div class="sc_size">

                    <!-- 공통 탑 -->
                    <%@ include file="../../include/top.jsp" %>
                    <!-- 공통 탑 end-->

                    <!-- 본문 내용-->
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources/img/home_icon.png"></span>노트</li>
                                    <li>노트 등록</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>노트 등록</h2>
                                    </div>
                                    <!-- 공통타이틀 -->

                                    <!-- 양식 리스트 -->
                                    <div class="form_list_con">
                                        <!--메인버튼 끝-->
                                        <div>
                                        	<img src="${pageContext.request.contextPath }/resources/img/logo.png">
                                        </div>
										<div>
										<div>
											<div>
												<form action="#" id="f_insert_note" method="POST">
													<div>
														<input type="hidden" name="IDX" value="${session_idx}">
													</div>
													<div id="img_select_modal">
														<img id="img_check" src="${pageContext.request.contextPath}/resources/upload/note_img/1_0505.png" alt="">
														<input type="hidden" name="IMAGE" id="IMAGE">
														<p id="img_modal_open" onclick="javascript:img_modal()">표지 선택</p>
													</div>
													<div>
														<div>
															<input type="text" name="TITLE" placeholder="제목" >
														</div>
														<div>
															<input type="text" name="TOPIC" id="TOPIC" placeholder="주제" >
														</div>
														<div class="search">
													      <input type="text" class="searchTerm" name="LEADER" id="leader" placeholder="교수(이메일로 검색하여주세요!)" >
													      <button type="button" class="searchButton i_search" cked="mento">
													        <i class="las la-search" cked="mento"></i>
													     </button>
													   </div>
													   <div class="search">
													      <input type="text" class="searchTerm" name="ASSI" id="assi" placeholder="조교(이메일로 검색하여주세요!)" >
													      <button type="button" class="searchButton i_search" cked="mento">
													        <i class="las la-search" cked="mento"></i>
													     </button>
													   </div>
														<div>
															<input type="text" name="INTRO"  id="INTRO" placeholder="소개">
														</div>
													</div>
												</form>
													<div>
														<div class="search">
													      <input type="text" class="searchTerm" placeholder="학생검색(이메일로 검색하여주세요!)">
													      <button type="button" class="searchButton i_search" cked="student">
													        <i class="las la-search" cked="student"></i>
													     </button>
													   </div>
														<div id="no_check_team_ul">
															<p>추가 전 학생</p>
															<ul id="no_check_list_team">
																<c:forEach var="item" items="${model.list}" varStatus="var">
																	<li id="check_${item.IDX }" ondblclick="javascript:check_id('${item.IDX}')" value="${item.IDX }" name="${item.NAME }" idx="${item.IDX }" school_name="${item.SCHOOL_NAME }" email="${item.EMAIL }"school_year="${item.SCHOOL_YEAR }"><span>${item.NAME }</span></li>
																</c:forEach>
															</ul>
														</div>
														<div id="check_team_ul">
															<p>추가된 학생</p>
															<ul id="check_list_team">
																<!-- 추가된 학생 리스트가 들어갈 자리 -->
															</ul>
														</div>
													</div>
												<div id="note_insert_bt">
													<button onclick="javascript:insert_note()">노트 등록!</button>
												</div>
											</div>
										</div>
									</div>
                                    </div>
                                    <!-- 양식 리스트 end-->

                                </div>
                                <!-- 진행중인 회의 end -->
                            </div>

                        </div>
                    </div>
                    <!-- 본문 내용 end-->

                </div>
            </div>
        </div>
    </section>
<!-- img_modal start -->
	<div id="meeting_form_modal" class="all_modal img_modal">
        <div class="all_modal_con">
            <div class="modal_box">

                <div class="modal_title">
                    <!-- 공통타이틀 -->
                    <div class="all_title">
                        <div class="line"><span></span></div>
                        <h2>표지 이미지 선택</h2>
                    </div>
                    <!-- 공통타이틀 -->

                    <!-- 닫기 -->
                    <div id="close_btn" class="close_btn">
                        <a href="#">
                            <i class="las la-times"></i>
                        </a>
                    </div>
                </div>
				<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_0505.png" onclick="javascript:check_img('1_0505')" >
				<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_1515.png" onclick="javascript:check_img('1_1515')">
				<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_3535.png" onclick="javascript:check_img('1_3535')">
				<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_4545.png" onclick="javascript:check_img('1_4545')">
				<img src="${pageContext.request.contextPath}/resources/upload/note_img/1_5555.png" onclick="javascript:check_img('1_5555')">
            </div>
        </div>
    </div>
<!-- img_modal end -->
<!-- 교수 , 조교 추가 modal start-->
<div>
	<input type="hidden" id="team_leader" name="" school_name="" school_year="" email="" idx="" >
	<input type="hidden" id="team_assi" name="" school_name="" school_year="" email="" idx="" >
</div>
<!-- 교수 , 조교 추가 modal end -->
<!--공통하단-->
<%@ include file="../../include/footer.jsp" %>
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
		//console.log(e);
		var name = $('#check_'+e).attr('name');
		var school_name = $('#check_'+e).attr('school_name');
		var school_year = $('#check_'+e).attr('school_year');
		var email = $('#check_'+e).attr('email');
		var idx = $('#check_'+e).val();
		$('#check_'+e).remove();
		$('#check_list_team').append('<li id=checking_'+idx+' name='+name+' school_name='+school_name+' school_year='+school_year+' email='+email+' value='+idx+' ondblclick="javascript:no_check_id('+idx+')">'+name+'</li>');
	}
	
	function no_check_id(e){
		//console.log(e);
		var name = $('#checking_'+e).attr('name');
		var school_name = $('#checking_'+e).attr('school_name');
		var school_year = $('#checking_'+e).attr('school_year');
		var email = $('#checking_'+e).attr('email');
		var idx = $('#checking_'+e).val();
		$('#checking_'+e).remove();
		$('#no_check_list_team').append('<li id=check_'+idx+' name='+name+' school_name='+school_name+' school_year='+school_year+' email='+email+' value='+idx+' ondblclick="javascript:check_id('+idx+')">'+name+'</li>');
	}
	
	function checking_id(e){
		var name = $('#checking_'+e).attr('name');
		var school_name = $('#checking_'+e).attr('school_name');
		var school_year = $('#checking_'+e).attr('school_year');
		var email = $('#checking_'+e).attr('email');
		var idx = $('#check_'+e).val();
		$('#checking_'+e).remove();
		$('#check_list_team').append('<li id=checking_'+idx+' name='+name+' school_name='+school_name+' school_year='+school_year+' email='+email+' value='+idx+' ondblclick="javascript:no_check_id('+idx+')">'+name+'</li>');
	}
	$(document).ready(function (){
		$('.i_search').click(function(){
			var EMAIL = $(this).prev().val();
			var what_id = $(this).prev().attr('id');
			var cked = $(this).attr('cked');
			if(cked == 'mento'){
				var LEVEL = '2';
				$.ajax({
					type : "POST",
					url : "/user/member/search.do?",
					cache : false,
					data : ({
						EMAIL : EMAIL,
						LEVEL : LEVEL
					}),
					dataType : "json",
					success: function(data , status, xhr){
						console.log(data);
						if(data.length > 0){
							for(i = 0; i<data.length; i++){
								$('#'+what_id).val(data[i].name);
								if(what_id == 'leader'){
									$('#team_leader').attr('name',data[i].name);
									$('#team_leader').attr('school_year',data[i].school_YEAR);
									$('#team_leader').attr('school_name',data[i].school_NAME);
									$('#team_leader').attr('email',data[i].email);
									$('#team_leader').attr('idx',data[i].idx);
								}else if(what_id == 'assi'){
									$('#team_assi').attr('name',data[i].name);
									$('#team_assi').attr('school_year',data[i].school_YEAR);
									$('#team_assi').attr('school_name',data[i].school_NAME);
									$('#team_assi').attr('email',data[i].email);
									$('#team_assi').attr('idx',data[i].idx);
								}
							}
						}else{
							Swal.fire('이메일을 확인하여 주세요')
						}
					}
				})
			}else if(cked == 'student'){
				var LEVEL = '1';
				$.ajax({
					type : "POST",
					url : "/user/member/search.do?",
					cache : false,
					data : ({
						EMAIL : EMAIL,
						LEVEL : LEVEL
					}),
					dataType : "json",
					success: function(data , status, xhr){
						console.log(data);
						if(data.length > 0){
							for(i = 0; i<data.length; i++){
								$('#no_check_list_team').html('');
								$('#no_check_list_team').append('<li id=checking_'+data[i].idx+' name='+data[i].name+' school_name='+data[i].school_name+' school_year='+data[i].school_year+' email='+data[i].email+' value='+data[i].idx+' ondblclick="javascript:checking_id('+data[i].idx+')">'+data[i].name+'</li>');
							}
						}else{
							Swal.fire('이메일을 확인하여 주세요')
						}
					}
				})	
			}
		})
	})
	
	
	function insert_note(){
		//note 내용 보내기
		if($('#IMAGE').val() == ''){
			Swal.fire('표지 이미지를 선택하여주세요.');
			return;
		}
		if($('#TOPIC').val() == ''){
			Swal.fire('제목을 작성하여주세요.');
			return;
		}
		if($('#TITLE').val() == ''){
			Swal.fire('주제를 작성하여주세요.');
			return;
		}
		if($('#leader').val() == '' || $('#assi').val() == ''){
			Swal.fire('교수 or 조교 분을 선택하여주세요.');
			return;
		}
		if($('#INTRO').val() == ''){
			Swal.fire('소개를 작성하여주세요.');
			return;
		}
		
		var formData = $('#f_insert_note').serialize();
		console.log(formData);
		$.ajax({
			type : "POST",
			url : "/note/insert.do?",
			cache : false,
			data : formData,
			dataType : "json",
			success : function(data,status,xhr){
				//console.log(data);
				//학생 team 보내기
				$('#check_list_team').children();
				console.log($('#check_list_team').children().length);
				var list_size = $('#check_list_team').children().length;
				var last_n_idx = data;
				//alert(last_n_idx);
				for(i = 0; i<list_size; i++){
					var team = $('#check_list_team').children().eq(i);
					console.log(team.attr('name'));
					$.ajax({
						type : "POST",
						url : "/user/note/team_insert.do?",
						cache : false,
						data : ({
							EMAIL : team.attr('email'),
							NAME : team.attr('name'),
							IDX : team.val(),
							SCHOOL_YEAR : team.attr('school_year'),
							SCHOOL_NAME : team.attr('school_name'),
							LEVEL : '1',
							N_IDX : last_n_idx
						}),
						dataType : "json",
						success: function(data , status, xhr){
							//console.log(data);
							}
						})
					}
					//leader team 보내기
					var leader = $('#team_leader')
					$.ajax({
						type : "POST",
						url : "/user/note/team_insert.do?",
						cache : false,
						data : ({
							EMAIL : leader.attr('email'),
							NAME : leader.attr('name'),
							IDX : leader.attr('idx'),
							SCHOOL_YEAR : leader.attr('school_year'),
							SCHOOL_NAME : leader.attr('school_name'),
							LEVEL : '2',
							N_IDX : last_n_idx
						}),
						dataType : "json",
						success: function(data , status, xhr){
							//console.log(data);
							}
					})
					//assi team 보내기
					var assi = $('#team_assi')
					$.ajax({
						type : "POST",
						url : "/user/note/team_insert.do?",
						cache : false,
						data : ({
							EMAIL : assi.attr('email'),
							NAME : assi.attr('name'),
							IDX : assi.attr('idx'),
							SCHOOL_YEAR : assi.attr('school_year'),
							SCHOOL_NAME : assi.attr('school_name'),
							LEVEL : '2',
							N_IDX : last_n_idx
						}),
						dataType : "json",
						success: function(data , status, xhr){
							//console.log(data);
							}
					})
					wrap_list();
			},
			error : function(xhr,status,error){
				if(xhr.status == 404){
					Swal.fire('오류!...')
				}
			}
		})
	}
	
	function wrap_list(){
		Swal.fire('연구일지가 추가되었습니다!');
		location.href = '${pageContext.request.contextPath}/note/list.do?EMAIL=${session_email}';
	}
</script>
<!-- js 끝 -->