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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/member_view.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.css" type="text/css">

<style>
    
    .tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-0pky{border-color:#3364b1;}
</style>
<section id="new_sc" class="sc_wrap">
        <div class="sc_area">
            <div class="sc_con">
                <div class="sc_size">
					<%@ include file="../../include/top.jsp" %>

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
                                        <h2>학생 리스트</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
									<div>
										<table class="tg" style="width:100%">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0lax">이름</th>
											    <th class="tg-0lax">이메일</th>
											    <th class="tg-0lax">전화번호</th>
											    <th class="tg-0lax">이수증번호</th>
											    <th class="tg-0lax">탐구일지</th>
											  </tr>
											</thead>
											<tbody id="list">
												<c:forEach var="item" items="${model.studentlist }" varStatus="Status">
												<tr class="update_modal">
												    <td class="tg-0lax" id="name_${Status.index+1 }" >${item.std_name }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">${item.std_email }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">${item.std_hp }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">${item.std_certificate_num }</td>
												    <td id="idx_${Status.index+1 }" style="display:none">
												     	${item.ur_id }
												     </td>
												     <td class="tg-0lax" id="record_${Status.index+1 }"><button type="button" onclick="location.href='${pageContext.request.contextPath}/exploring/exploring.do?N_IDX=${item.std_selected_lab_id }&IDX=${item.ur_id }'">탐구일지</button></td>
												 </tr>
												 </c:forEach>
											</tbody>
										</table>
									</div>
									
									<!-- 공통타이틀 -->
                                    <div class="all_title ">
                                        <div class="line"><span></span></div>
                                        <h2>지도자 리스트</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
									<div>
										<table class="tg" style="width:100%">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0lax">이름</th>
											    <th class="tg-0lax">직위</th>
											    <th class="tg-0lax">이메일</th>
											    <th class="tg-0lax">전화번호</th>
											    <th class="tg-0lax">학교 (학과)</th>
											  </tr>
											</thead>
											<tbody id="list">
												<c:forEach var="item" items="${model.leaderlist }" varStatus="Status">
												<tr class="update_modal">
												    <td class="tg-0lax" id="name_${Status.index+1 }" >${item.urlab_name }</td>
												    <td class="tg-0lax" id="name_${Status.index+1 }" >${item.urlab_position }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">${item.urlab_email }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">${item.urlab_tel }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">
												    <c:if test="${item.urlab_coll_cd == 'K'}">
												    	KAIST -
												    </c:if>
												    <c:if test="${item.urlab_coll_cd == 'U'}">
												    	UNIST - 
												    </c:if>
												    <c:if test="${item.urlab_coll_cd == 'D'}">
												    	DGIST - 
												    </c:if>
												    <c:if test="${item.urlab_coll_cd == 'G'}">
												    	GIST - 
												    </c:if>
												    (${item.urlab_department})
												    </td>
												    <td id="idx_${Status.index+1 }" style="display:none">
												     	${item.ur_id }
												     </td>
												 </tr>
												 </c:forEach>
											</tbody>
										</table>
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
	
	$.datetimepicker.setLocale('ko');
	jQuery('#UPDATE_BIRTH').datetimepicker({
		format : 'Y-m-d',
		lang : "ko",
		timepicker : false
	});
	
	$(document).on("click", "#chk_calc_all", function(e) {
        if ($(this).prop('checked')) {
            $('input[name="chk_calc"]').prop('checked', true);
        } else {
            $('input[name="chk_calc"]').prop('checked', false);
        }
    });
	
	
</script>
<!-- js 끝 -->