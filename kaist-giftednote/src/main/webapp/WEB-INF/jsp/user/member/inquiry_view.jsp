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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/member_view.css" type="text/css">

<style>
    a {
        color: #ffffff;
        text-decoration: none !important;
    }
    
    .tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-0pky{border-color:#3364b1;}
	
	.answer-complete{
		background: #009ca5;
	    color: #fff;
	    padding: 2px 4px;
	    border-radius: 2px;
	    font-size: 12px;
    }
    
    .answer-waiting{
    	background: #807d77;
	    color: #fff;
	    padding: 2px 4px;
	    border-radius: 2px;
	    font-size: 12px;
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
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>관리자</li>
                                    <li>회원 관리</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>내 문의 리스트</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
									<div class="all_modal_con">
							            <div class="modal_box">
							
							                <div class="join_table">
							                    <div class="all_table all_table_2">
							                        <table class="all_table_box">
							                        	<input type="hidden" id="I_IDX" value="${model.view.i_IDX }">
							                            <tbody>
							                                <tr>
							                                    <th>제목</th>
							                                    <td colspan="3">
							                                        <div class="input_size input_size_full" style="text-align:left">
							                                            ${model.view.TITLE }
							                                        </div>
							                                    </td>
							                                </tr>
							                                <tr>
							                                    <th>설명</th>
							                                    <td colspan="3">
							                                        <div class="sort_select">
							                                            <div class="sort_textarea" style="text-align:left">
							                                                ${model.view.CONTENT }
							                                            </div>
							                                        </div>
							                                    </td>
							                                </tr>
							                                <c:if test="${model.view.ANSWER != ''}">
							                                <tr>
							                                    <th>답변</th>
							                                    <td colspan="3">
							                                        <div class="sort_select">
							                                            <div class="sort_textarea" style="text-align:left">
							                                               ${model.view.ANSWER }
							                                            </div>
							                                        </div>
							                                    </td>
							                                </tr>
							                                </c:if>
							                            </tbody>
							                        </table>
							                    </div>
							                </div>
							            </div>
							        </div>
									
									
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

	
	$.datetimepicker.setLocale('ko');
	jQuery('#UPDATE_BIRTH').datetimepicker({
		format : 'Y-m-d',
		lang : "ko",
		timepicker : false
	});
	
	
</script>
<!-- js 끝 -->