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
        color: #ffffff;
        text-decoration: none !important;
    }
    .form_list_ob > .form_list_note > .test_p{
    	display:none;
    }
    #detail_show > .test_p{
    	display:block;
    }
    #main_btn{
    	margin:0;
    	width: auto;
    	display: table;
    }
    #main_btn li{
    margin-right:50px;
    }
    
    #main_btn li button{
    
    	width: 7rem;
	    height: 100%;
	    border: 1px solid #3364b1;
	    background-color: #3364b1;
	    color: #fff;
    	margin-bottom:6px;
    }
    
    #detail_student{
   	float: left;
    margin-right: 10px;
    
    height: 30px;
    
    }
    
    #detail_mento{
   	float: left;
    margin-right: 10px;
    /* width: 0px; */
    height: 30px;
    
    }
    
    
    #detail_mento button{
    	margin-left: 10px;
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
                                        <h2>참여 연구 리스트</h2>
                                    </div>
                                    <!-- 공통타이틀 -->

                                    <!-- 공통서치 -->
                                    <!-- 07 - 26 삭제
                                    <div class="meeting_search">

                                        <div id="meeting_form_btn" class="meeting_add floatR" >
                                            <a onclick="javascript:note_insert_check()">노트 등록</a>
                                        </div>

                                    </div>
                                    -->
                                    <!-- 공통서치 end-->

                                    <!-- 양식 리스트 -->
                                    <div class="form_list_con">
                                        <ul class="form_list_box">
                                            <c:forEach var="item" items="${model.list}" varStatus="var">
								                <li class="form_list_ob">
								                    <div class="form_list_note form_img" onclick="javascript:detail(${item.lab_id})" id="${item.lab_id }_detail">
								                        <img src="${pageContext.request.contextPath}/resources/img/note_img/${item.lab_coll_cd }.png">
								                        
									                    <div id="${item.N_IDX }_idx" class="test_p">
									                        <ul>
									                        	<li><p class="form_list_li">연구 주제</p><p class="form_list_li_p">${item.lab_study_title }</p></li>
									                        	<li><p class="form_list_li">연구실 명</p><p class="form_list_li_p">${item.lab_name }</p></li>
									                        	<li><p class="form_list_li">실험실 명칭</p><p class="form_list_li_p">${item.lab_room_name }</p></li>
									                        	<li><p class="form_list_li">실험실 위치</p><p class="form_list_li_p">${item.lab_room_position }</p></li>
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
        <div class="all_modal_con meeting_form_moal_div">
            <div class="modal_box">

                <div class="modal_title">
                    <!-- 공통타이틀 -->
                    <div class="all_title">
                        <div class="line"><span></span></div>
                        <h2>연구실 상세 보기</h2>
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
                        <ul class="join_btn" id="main_btn">
                        	<li id="detail_student" class="submit_btn">
                        		<button id="detail_wrap_bt">연구 노트 작성</button>
                        		<button id="view_wrap_bt">연구 노트 보기</button>
								<button id="detail_exploring">탐구일지 보기</button>
                        	</li>
                        	<li id="detail_mento" class="submit_btn">
                        		<button id="detail_record">지도일지 작성</button>
								<button id="detail_srce">학생 평가 작성</button>
								<button id="detail_team">연구 학생 확인</button>
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
/*
	function note_insert_check(){
	if(${session_level} == '2' ){
		location.href='${pageContext.request.contextPath}/note/insert.do?IDX=${session_idx}'
	}else{
		Swal.fire('노트 등록은 조교 혹은 교수님만 가능합니다.')
	}	
	
	}
*/	
	function detail(idx){
		const element = document.getElementById(idx+'_detail');
		  //alert(element.innerHTML);
		  $('#detail_show').html(element.innerHTML);
		  $('#meeting_form_modal').show();
		  $('#detail_wrap').show();
		  $('#detail_wrap_bt').attr('onclick','location.href="/note/detail.do?lab_id='+idx+'"');
		  $('#view_wrap_bt').attr('onclick','location.href="/user/note/view.do?lab_id='+idx+'"');
		  $('#detail_exploring').attr('onclick','location.href="/exploring/exploring.do?lab_id='+idx+'&user_idx='+${session_idx}+'"')
		  // view 로 변경 - $('#detail_pdf_view').attr('onclick','location.href="/user/note/pdf_view.do?lab_id='+idx+'"')
		  if(${session_level} == '2'){
		  		$('#detail_record').attr('onclick','location.href="/record/list.do?lab_id='+idx+'"');
		  		$('#detail_srce').attr('onclick','location.href="/srce/srce.do?lab_id='+idx+'"');
		  		$('#detail_team').attr('onclick','location.href="/user/note/teamlist.do?lab_id='+idx+'"');
		  		$('#detail_student').hide();
		  }else{
				$('#detail_mento').hide();
		  }
	}
	
	/*
	
	 07 - 26 // 마감 기능 삭제
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
				}).then(function(result) {
				  if (result.isConfirmed) {
					  location.href="/note/complete.do?N_IDX="+n_idx
				  }
				})
		}
	}
	*/
    $("#close_btn").click(function() {
        $("#meeting_form_modal").hide();
    });
	
</script>
<!-- js 끝 -->