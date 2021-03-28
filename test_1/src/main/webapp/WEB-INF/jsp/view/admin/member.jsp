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
    $("#close_btn").click(function() {
        $("#meeting_form_modal").hide();
    });

	
</script>
<!-- js 끝 -->