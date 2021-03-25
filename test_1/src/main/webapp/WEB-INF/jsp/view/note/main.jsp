<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->
<!--공통상단-->
<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" type="text/css">

<style>
    a {
        color: #ffffff !important;
        text-decoration: none !important;
    }
    .form_list_ob > .form_list_note > .test_p{
    	display:none;
    }
    #detail_show > .test_p{
    	display:block;
    }
</style>
<section id="new_sc" class="sc_wrap">
        <div class="sc_area">
            <div class="sc_con">
                <div class="sc_size">
					<%@ include file="../include/top.jsp" %>

                    <!-- 본문 내용-->
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>연구노트</li>
                                    <li>메인</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>리스트</h2>
                                    </div>
                                    <!-- 공통타이틀 -->

                                    <!-- 공통서치 -->
                                    <div class="meeting_search">

                                        <div id="meeting_form_btn" class="meeting_add floatR" >
                                            <a onclick="location.href='${pageContext.request.contextPath}/note/insert.do?IDX=${session_idx}'">노트 등록</a>
                                        </div>

                                    </div>
                                    <!-- 공통서치 end-->

                                    <!-- 양식 리스트 -->
                                    <div class="form_list_con">
                                        <ul class="form_list_box">
                                            <c:forEach var="item" items="${model.list}" varStatus="var">
								                <li class="form_list_ob">
								                    <div class="form_list_note form_img" onclick="javascript:detail(${item.N_IDX})" id="${item.N_IDX }_detail">
								                        <img src="${pageContext.request.contextPath}/resources/upload/note_img/${item.IMAGE }.png">
									                    <div id="${item.N_IDX }_idx" class="test_p" dead="${item.DEAD }">
									                        <ul>
									                        	<li><p class="form_list_li">제목</p><p class="form_list_li_p">${item.TITLE }</p></li>
									                        	<li><p class="form_list_li">주제</p><p class="form_list_li_p">${item.TOPIC }</p></li>
									                        	<li><p class="form_list_li">담당 교수</p><p class="form_list_li_p">${item.LEADER }</p></li>
									                        	<li><p class="form_list_li">담당 조교</p><p class="form_list_li_p">${item.ASSI }</p></li>
									                        	<li><p class="form_list_li">연구일지 시작일</p><p class="form_list_li_p">${item.START_TM }</p></li>
									                        	<li><p class="form_list_li">연구일지 마감일</p><p class="form_list_li_p">${item.END_TM }</p></li>
									                        </ul>
													    </div>
												    </div>
								                </li>
											</c:forEach>
                                        </ul>
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

    <!-- 양식 등록 폼-->
    <div id="meeting_form_modal" class="all_modal">
        <div class="all_modal_con">
            <div class="modal_box">

                <div class="modal_title">
                    <!-- 공통타이틀 -->
                    <div class="all_title">
                        <div class="line"><span></span></div>
                        <h2>노트 상세 보기</h2>
                    </div>
                    <!-- 공통타이틀 -->

                    <!-- 닫기 -->
                    <div id="close_btn" class="close_btn">
                        <a href="#">
                            <i class="las la-times"></i>
                        </a>
                    </div>
                </div>

                <div class="join_table">
                    <div class="all_table all_table_2">
                        <div>
							<div id="detail_show">
							<!-- 연구노트 추가될 부분 -->
							</div>
						</div>
                    </div>
                    <div class="join_submit_btn" id="detail_wrap" style="display:none" >
                        <ul class="join_btn">
                        	<li id="detail_student" class="submit_btn">
                        		<button id="detail_wrap_bt">작성</button>
								<button id="detail_exploring">탐구일지</button>
                        	</li>
                        	<li id="detail_mento" class="submit_btn">
								<button id="detail_record">기록일지</button>
								<button id="detail_complete">마감하기</button>
								<button id="detail_srce">학생평가</button>
							</li>
                        </ul>
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
		  $('#meeting_form_modal').show();
		  $('#detail_wrap').show();
		  $('#detail_wrap_bt').attr('onclick','location.href="/note/detail.do?N_IDX='+idx+'"');
		  $('#detail_exploring').attr('onclick','location.href="/exploring/exploring.do?N_IDX='+idx+'&IDX='+${session_idx}+'"')
		  if(${session_level} == '2'){
		  		$('#detail_complete').attr('onclick','javascript:complete('+idx+')');
		  		$('#detail_record').attr('onclick','location.href="/record/list.do?N_IDX='+idx+'"');
		  		$('#detail_srce').attr('onclick','location.href="/srce/srce.do?N_IDX='+idx+'"');
		  }else{
				$('#detail_mento').hide();
		  }
	}
	
	function complete(n_idx){
		if($('#'+n_idx+'_idx').attr('dead') == 'COMPLETE'){
			Swal.fire('이미 마감된 연구노트 입니다.')
		}else{
			Swal.fire({
				  text: "현 연구노트 를 마감하시겠습니까?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '예',
				  cancelButtonText: '아니요',
				}).then((result) => {
				  if (result.isConfirmed) {
					  location.href="/note/complete.do?N_IDX="+n_idx
				  }
				})
		}
	}

    $("#close_btn").click(function() {
        $("#meeting_form_modal").hide();
    });

	
</script>
<!-- js 끝 -->