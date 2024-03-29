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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/exploring.css" type="text/css">
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
		width:100%;
	}
	
	.exploring_td_button{
		width: 7rem;
	    height: 100%;
	    border: 1px solid #3364b1;
	    background-color: #3364b1;
	    color: #fff;
	    margin-bottom: 6px;
	
	}
	.tbl_th{
		background-color : #d0dcef;
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
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>노트</li>
                                    <li>탐구일지</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>탐구일지</h2>
                                    </div>

                                    <!-- 양식 리스트 -->
									<div>
										<table class="tg" style="width:100%">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0pky" rowspan="2">순번</th>
											    <th class="tg-0pky" rowspan="2">수업일</th>
											    <th class="tg-0pky" colspan="2">지도자</th>
											    <th class="tg-0lax" colspan="2">교육장소</th>
											    <th class="tg-0lax" colspan="5">교육방법</th>
											    <th class="tg-0lax" rowspan="2">참여도</th>
											    <th class="tg-0lax" rowspan="2">이해도</th>
											    <th class="tg-0lax" rowspan="2">배운점</th>
											    <th class="tg-0lax" rowspan="2">느낀점</th>
											    <th class="tg-0lax" rowspan="2">비고</th>
											  </tr>
											  <tr class="tbl_th">
											    <td class="tg-0pky">교수</td>
											    <td class="tg-0lax">조교</td>
											    <td class="tg-0lax">자택</td>
											    <td class="tg-0lax">고교</td>
											    <td class="tg-0lax">실시간강의</td>
											    <td class="tg-0lax">영상강의</td>
											    <td class="tg-0lax">실험</td>
											    <td class="tg-0lax">세미나(토론)</td>
											    <td class="tg-0lax">기타</td>
											  </tr>
											</thead>
											<tbody>
											<c:if test="${model.list.size() != 0 }">
												<c:forEach items="${model.list }" var="item" varStatus="Status">
											  	<tr onclick="javascript:update(${Status.index})" id="list_${Status.index }">
											  		<td class="tg-0pky" id="index_list">${Status.index+1 }</td>
											  		<td class="tg-0pky" id="class_tm_list">${item.CLASS_TM }</td>
											  		
											  		<c:if test="${fn:contains(item.LEADER_TYPE,'교수') }">
											  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
											  		</c:if>
											  		<c:if test="${!fn:contains(item.LEADER_TYPE,'교수') }">
											  			<td><input type="checkbox" onclick="return false;"></td>
											  		</c:if>
											  		
											  		<c:if test="${fn:contains(item.LEADER_TYPE,'조교') }">
											  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
											  		</c:if>
											  		<c:if test="${!fn:contains(item.LEADER_TYPE,'조교') }">
											  			<td><input type="checkbox" onclick="return false;"></td>
											  		</c:if>
											  		
											  		<c:if test="${fn:contains(item.CLASS_TYPE,'자택') }">
											  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
											  		</c:if>
											  		<c:if test="${!fn:contains(item.CLASS_TYPE,'자택') }">
											  			<td><input type="checkbox" onclick="return false;"></td>
											  		</c:if>
											  		
											  		<c:if test="${fn:contains(item.CLASS_TYPE,'고교') }">
											  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
											  		</c:if>
											  		<c:if test="${!fn:contains(item.CLASS_TYPE,'고교') }">
											  			<td><input type="checkbox" onclick="return false;"></td>
											  		</c:if>
											  		
											  		<c:if test="${fn:contains(item.CLASS_PLACE,'실시간강의') }">
											  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
											  		</c:if>
											  		<c:if test="${!fn:contains(item.CLASS_PLACE,'실시간강의') }">
											  			<td><input type="checkbox" onclick="return false;"></td>
											  		</c:if>
											  		
											  		<c:if test="${fn:contains(item.CLASS_PLACE,'영상강의') }">
											  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
											  		</c:if>
											  		<c:if test="${!fn:contains(item.CLASS_PLACE,'영상강의') }">
											  			<td><input type="checkbox" onclick="return false;"></td>
											  		</c:if>
											  		
											  		<c:if test="${fn:contains(item.CLASS_PLACE,'실험') }">
											  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
											  		</c:if>
											  		<c:if test="${!fn:contains(item.CLASS_PLACE,'실험') }">
											  			<td><input type="checkbox" onclick="return false;"></td>
											  		</c:if>
											  		
											  		<c:if test="${fn:contains(item.CLASS_PLACE,'세미나') }">
											  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
											  		</c:if>
											  		<c:if test="${!fn:contains(item.CLASS_PLACE,'세미나') }">
											  			<td><input type="checkbox" onclick="return false;"></td>
											  		</c:if>
											  		
											  		<c:if test="${item.OTHER == '' }">
											  			<td><input type="checkbox" onclick="return false;"></td>
											  		</c:if>
											  		<c:if test="${item.OTHER != '' }">
											  			<td>${item.OTHER }</td>
											  		</c:if>
											  		<td>${item.SCORE_JOIN }</td>
											  		<td>${item.SCORE_UPTAKE }</td>
											  		<td>${item.LEARN }</td>
											  		<td>${item.FELT }</td>
											  		<td>
											  			<button class="exploring_td_button" onclick="javascript:delete_exploring('${item.CLASS_TM}');">삭제</button>
											  		</td>
											  	</tr>
											  	</c:forEach>
											</c:if>
											<c:if test="${model.list.size() == 0 }">
												<tr>
													<td colspan="16">등록된 탐구일지가 없습니다.</td>
												</tr>
											</c:if>
											</tbody>
										</table>
										
										
										<div class="meeting_search">

	                                        <div id="meeting_form_btn" class="meeting_add floatR" style="margin-left:30px" >
	                                            <a onclick="location.href='${pageContext.request.contextPath}/user/exploringExcelDown.do?lab_id=${model.lab_id}&IDX=${model.IDX}'">엑셀 다운로드</a>
	                                        </div>
	                                        <c:if test="${session_level == '1' }">
	                                        <div id="meeting_form_btn" class="meeting_add floatR" >
	                                            <a onclick="location.href='${pageContext.request.contextPath}/exploring/insert.do?lab_id=${model.lab_id }&user_idx=${model.IDX }'">탐구일지 작성</a>
	                                        </div>
	                                        </c:if>
	
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
<div>
	<input type="hidden" value="${model.IDX }" id="IDX">
	<input type="hidden" value="${model.lab_id }" id="lab_id">
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
	
function delete_exploring(class_tm){
	if (window.confirm("정말 해당 탐구일지를 삭제하시겠습니까?")) {

		var CLASS_TM = class_tm;
		var lab_id = $('#lab_id').val();
		var IDX = $('#IDX').val();
		
		console.log(CLASS_TM);
		$.ajax({
			type : "POST",
			url : "/user/exploring_delete.do",
			cache : false,
			data : ({
				lab_id : lab_id,
				CLASS_TM : CLASS_TM,
				IDX : IDX,
			}),
			dataType : "json",
			success: function(result){
				if(result = true){
					Swal.fire({
						text : "삭제되었습니다.!",
						confirmButtonText: 'Yes!'
					}).then((result) => {
						if(result.isConfirmed) {
							location.href='${pageContext.request.contextPath}/exploring/exploring.do?lab_id='+lab_id+'&user_idx='+IDX+'';
						}
					})
				}
				}
		})
	}
}
	
	/*
	function setexplor(){
		var CLASS_TM = $('#CLASS_TM').val();
		var LEADER_TYPE = "";
		for(i = 0; i < 2 ; i++){
			if($("input[name='MENTO']").eq(i).is(':checked') == true){
				if(LEADER_TYPE == ''){
					LEADER_TYPE = LEADER_TYPE + $("input[name='MENTO']").eq(i).val();
				}else{
					LEADER_TYPE = LEADER_TYPE + ",";
					LEADER_TYPE = LEADER_TYPE + $("input[name='MENTO']").eq(i).val();	
				}
			}
		}
		var CLASS_TYPE = "";
		for(i = 0 ; i < 2 ; i++){
			if($("input[name='PLACE']").eq(i).is(':checked') == true){
				if(CLASS_TYPE == ''){
					CLASS_TYPE = CLASS_TYPE + $("input[name='PLACE']").eq(i).val();
				}else{
					CLASS_TYPE = CLASS_TYPE + ",";
					CLASS_TYPE = CLASS_TYPE + $("input[name='PLACE']").eq(i).val();	
				}
			}
		}
		var CLASS_PLACE = "";
		for(i = 0 ; i < 4 ; i++){
			if($("input[name='CLASS_PLACE']").eq(i).is(':checked') == true){
				if(CLASS_PLACE == ''){
					CLASS_PLACE = CLASS_PLACE + $("input[name='CLASS_PLACE']").eq(i).val();
				}else{
					CLASS_PLACE = CLASS_PLACE + ",";
					CLASS_PLACE = CLASS_PLACE + $("input[name='CLASS_PLACE']").eq(i).val();	
				}
			}
		}
		var OTHER = "";
		if($('#type_what').val() != ''){
			OTHER += $('#type_what').val()
		}
		var SCORE_JOIN = $('#join').val();
		var SCORE_UPTAKE = $('#uptake').val();
		var LEARN = $('#LEARN').val();
		var FELT = $('#FELT').val();
		var IDX = $('#IDX').val();
		var lab_id = $('#lab_id').val();
		$.ajax({
			type : "POST",
			url : "/exploring/setExplor.do?",
			cache : false,
			data : ({
				IDX : IDX,
				lab_id : lab_id,
				LEADER_TYPE : LEADER_TYPE,
				CLASS_TYPE : CLASS_TYPE,
				CLASS_TM : CLASS_TM,
				SCORE_JOIN : SCORE_JOIN,
				SCORE_UPTAKE : SCORE_UPTAKE,
				OTHER : OTHER,
				CLASS_PLACE : CLASS_PLACE,
				LEARN : LEARN,
				FELT : FELT
			}),
			dataType : "json",
			success: function(data , status, xhr){
				console.log(data);
				}
		})
		Swal.fire({
			  text: "탐구일지가 정상적으로 저장되었습니다!!",
			  icon: 'success',
			  showCancelButton: false,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: 'Yes!'
			}).then((result) => {
			  if (result.isConfirmed) {
					location.reload();
			  }
			})
	}
	*/
	/*
	function update(index){
		$('.update_list').remove();
		var inner = document.getElementById('list_'+index).innerHTML;
		var list = '<tr id="update_list_'+index+'" class="update_list">'+inner+'</tr>';
		console.log(list);
		list = list.replace('<td class="tg-0pky" id="index_list">','<td class="tg-0pky" id="index_update">');
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