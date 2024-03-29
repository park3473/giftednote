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
                                        <h2>문의 수정</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
									<div>
										<table class="tg" style="width:100%">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0lax">순번</th>
											    <th class="tg-0lax">답변상태</th>
											    <th class="tg-0lax">문의제목</th>
											    <th class="tg-0lax">문의날짜</th>
											    <th class="tg-0lax">수정 및 보기</th>
											  </tr>
											</thead>
											<tbody id="list">
												<c:if test="${model.mylist.size() > 0}">
												<c:forEach var="item" items="${model.mylist }" varStatus="Status">
												<tr class="list_tr">
													<td class="" id="I_IDX_${item.i_IDX }">${Status.index + 1 }</td>
													<td class="" id="STAT_${item.i_IDX }">
														<c:if test="${item.STAT == '답변완료'}">
															<span class="answer-complete">
																답변완료
															</span>
														</c:if>
														<c:if test="${item.STAT == '답변대기'}">
															<span class="answer-waiting">
																답변대기
															</span>
														</c:if>
													</td>
													<td class="" id="TITLE_${item.i_IDX }">${item.TITLE }</td>
													<td class="" id="I_DATE_${item.i_IDX }">${fn:substring(item.CREATE_TM,0,11)}</td>
													<td class="" id="">
														<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/member/inquiry_update.do?IDX=${session_idx }&I_IDX=${item.i_IDX }'">수정</button>
														<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/member/inquiry_view.do?IDX=${session_idx }&I_IDX=${item.i_IDX }'">보기</button>
													</td>
												 </tr>
												 </c:forEach>
												 </c:if>
												 <c:if test="${model.mylist.size() == 0 }">
												 	<tr class="list_tr">
												 		<td colspan="5">등록된 문의가 없습니다.</td>
												 	</tr>
												 </c:if>
											</tbody>
										</table>
									</div>
									
									<div style="float:right">
										<button type="button" onclick="location.href='${pageContext.request.contextPath }/user/member/inquiry_insert.do'">문의하기</button>
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
	
	function pageChanged(page , endpage){
		if (page < 0) {
            page = 0;
        }
        
        if (endpage < 0) {
            endpage = 0;
        }
        
        if (page >= endpage) {
            page = endpage;
        }

        var URL = "list.do?PAGE="+page;
        if('${model.ITEM_COUNT}' == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + '${model.ITEM_COUNT}';
        }
        
        location.href = URL;
	}
	
	
</script>
<!-- js 끝 -->