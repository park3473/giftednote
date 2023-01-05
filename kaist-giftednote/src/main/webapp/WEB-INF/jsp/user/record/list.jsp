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
<!--공통상단 끝-->

<style>
    a {
        color: #ffffff;
        text-decoration: none !important;
    }
    .test_div > .test_p{
    	display:none;
    }
    #detail_show > .test_p{
    	display:block;
    }
	
	.tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-0pky{border-color:#3364b1;}
	table{
	text-align : center;
	width:100%;
	}
	
	.tbl_th{
		background-color : #d0dcef;
	}
	
	.record_td_button{
		width: 7rem;
	    height: 100%;
	    border: 1px solid #3364b1;
	    background-color: #3364b1;
	    color: #fff;
	    margin-bottom: 6px;
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
                                    <li>지도일지</li>
                                </ul>
                            </div>
                            
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">
									
                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>지도일지</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
									
									<div>
										<table class="tg" style="width:100%">
										<thead>
										  <tr class="tbl_th">
										    <th class="tg-0pky" rowspan="2">순번</th>
										    <th class="tg-0pky" rowspan="2">수업일</th>
										    <th class="tg-0pky" rowspan="2">작성일</th>
										    <c:forEach var="teamitem" items="${model.teamlist }" varStatus="status">
												<th class="tg-0pky" colspan="2">${teamitem.std_name}</th>
											</c:forEach>
										    <th class="tg-0pky" rowspan="2">지도 목표 , 내용 및 자체평가 자유기술</th>
										    <th class="tg-0pky" rowspan="2">비고</th>
										  </tr>
										  <tr class="tbl_th">
										  <c:if test="${model.teamcount > 0 }">
										  	<c:forEach begin="0" end="${model.teamcount-1 }">
										    	<td class="tg-0pky">참여율</td>
										    	<td class="tg-0pky">이해도</td>
											</c:forEach>
											</c:if>
										  </tr>
										</thead>
										<tbody>
											<c:if test="${model.daycount != 0 }">
											<c:forEach begin="0" end="${model.daycount-1 }" var="dayitem" items="${model.daylist }" varStatus="status">
											  <tr id="list_${status.index }" >
											    <td class="tg-0pky" id="index_list">${status.index+1 }</td>
											    <td class="tg-0pky" id="class_tm_list">${dayitem.CLASS_TM}</td>
											    <td class="tg-0pky" id="create_tm_list">${dayitem.CREATE_TM }</td>
											    <c:forEach begin="${status.index*model.teamcount }" end="${(status.index*model.teamcount)+(model.teamcount-1) }" step="1" var="item" items="${model.list }">
													<td class="tg-0pky" ID="${status.index*model.teamcount }">${item.SCORE_JOIN }</td>
													<td class="tg-0pky" id="${(status.index*model.teamcount)+(model.teamcount-1) }">${item.SCORE_UPTAKE }</td>
												</c:forEach>
											    <td class="tg-0pky">${dayitem.RECORD }</td>
											    <td class="tg-0pky">
											    	<!-- <button class="record_td_button" onclick="location.href='${pageContext.request.contextPath}/record/update.do?lab_id=${model.lab_id}'">수정</button> -->
											    	<button class="record_td_button" onclick="javascript:delete_record('${dayitem.CLASS_TM}');">삭제</button>
											    </td>
											  </tr>
											 </c:forEach>
											 </c:if>
											 <c:if test="${model.daycount == 0 }">
											 	<tr>
											 		<td colspan="${model.teamcount*2+5 }">등록된 지도일지가 없습니다.</td>
											 	</tr>
											 </c:if>
										</tbody>
										</table>
										
											<div class="meeting_search">
	
		                                        <div id="meeting_form_btn" class="meeting_add floatR" >
		                                            <a onclick="location.href='${pageContext.request.contextPath}/user/recordExcelDown.do?lab_id=${model.lab_id }'">엑셀 파일 다운로드</a>
		                                        </div>
		                                        <div id="meeting_form_btn" class="meeting_add floatR" style="margin-right:30px;">
		                                            <a onclick="location.href='${pageContext.request.contextPath}/record/insert.do?lab_id=${model.lab_id }'">지도일지 등록</a>
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
<input type="hidden" value="${model.lab_id }" id="lab_id">
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
	
	
	function delete_record(class_tm){
		if (window.confirm("정말 해당 지도일지를 삭제하시겠습니까?")) {

			var CLASS_TM = class_tm;
			var lab_id = $('#lab_id').val();
			
			console.log(CLASS_TM);
			$.ajax({
				type : "POST",
				url : "/user/record_delete.do",
				cache : false,
				data : ({
					lab_id : lab_id,
					CLASS_TM : CLASS_TM,
				}),
				dataType : "json",
				success: function(result){
					if(result = true){
						Swal.fire({
							text : "삭제되었습니다.!",
							confirmButtonText: 'Yes!'
						}).then((result) => {
							if(result.isConfirmed) {
								location.href='${pageContext.request.contextPath}/record/list.do?lab_id='+lab_id+'';
							}
						})
					}
					}
			})
		}
	}
	
	/*
	function update(index){
		$('.update_list').remove();
		var inner = document.getElementById('list_'+index).innerHTML;
		var list = '<tr id="update_list_'+index+'" class="update_list">'+inner+'</tr>';
		list = list.replace('<td class="tg-0pky" id="index_list">','<td class="tg-0pky" id="index_update">');
		list = list.replace('<td class="tg-0pky" id="create_tm_list">','<td class="tg-0pky" id="create_tm_update">');
		list = list.replace('<td class="tg-0pky" id="class_tm_list">','<td class="tg-0pky" id="class_tm_update">');
		$('#setList').remove();
		$('#set').append(list);
		$('#index_update').remove();
		$('#create_tm_update').remove();
		var date = $('#class_tm_update').text();
		$('#class_tm_update').text('');
		$('#class_tm_update').append('<input type="text" id="CLASS_TM" class="datecalendar" value="'+date+'">');
		dateload();
	}
	*/

$.datetimepicker.setLocale('ko');
jQuery('.datecalendar').datetimepicker({
	format : 'Y-m-d',
	lang : "ko",
	timepicker : false
});

function dateload(){
	$.datetimepicker.setLocale('ko');
	jQuery('.datecalendar').datetimepicker({
		format : 'Y-m-d',
		lang : "ko",
		timepicker : false
	});
}
</script>
<!-- js 끝 -->