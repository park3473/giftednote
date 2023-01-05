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
									<div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>지도일지 작성법</h2>
                                    </div>
                                    <div>
                                    	<p>참여도 : 참여도는 각 학생에 대하여 (5: 매우 적극 참여, 4: 적극 참여, 3: 보통 참여, 2: 비적극적 참여 1: 매우 비적극적 참여) 의 점수를 매깁니다.</p>
                                    	<p>이해도 : 이해도 또한 각 학생에 대하여 (5: 매우 이해함 4: 이해함, 3:보통함, 2: 이해하지 못함 1: 매우 이해하지 못함) 의 점수를 매깁니다.</p>
                                    </div>
									
									
                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>지도일지</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
									
                                    <!-- 양식 리스트 -->
                                    <div>
										<div>
											<table class="tg" style="width:100%">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0pky" rowspan="2">수업일</th>
											    <c:forEach var="teamitem" items="${model.teamlist }" varStatus="status">
													<th class="tg-0pky" colspan="2" id="name_${status.index }" name=${teamitem.std_name } idx="${teamitem.ur_id }">${teamitem.std_name}</th>
												</c:forEach>
											    <th class="tg-0pky" rowspan="2">지도 목표 , 내용 및 자체평가 자유기술</th>
											  </tr>
											  <tr class="tbl_th">
											  	<c:forEach begin="0" end="${model.teamcount-1 }">
											    	<td class="tg-0pky">참여율</td>
											    	<td class="tg-0pky">이해도</td>
												</c:forEach>
											  </tr>
											</thead>
											<tbody id="set">
												  <tr id="setList">
												    <td class="tg-0pky"><input class="input_size datecalendar" type="text" name="CLASS_TM" id="CLASS_TM"></td>
												    <c:forEach begin="0" end="${model.teamcount-1 }" step="1" varStatus="status">
														<td class="tg-0pky" ><select id="join_${status.index }"><option>--</option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td>
														<td class="tg-0pky"><select id="uptake_${status.index }"><option>--</option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td>
													</c:forEach>
												    <td class="tg-0pky"><textarea type="text" id="RECORD" style="width:100%"></textarea></td>
												  </tr>
											</tbody>
											</table>
											
											<div class="meeting_search">
	
		                                        <div id="meeting_form_btn" class="meeting_add floatR" >
		                                            <a onclick="javascript:insert(${model.teamcount})">등록</a>
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
	function insert(teamcount){
	var CLASS_TM = $('#CLASS_TM').val();
	var lab_id = $('#lab_id').val();
	$.ajax({
		type : "POST",
		url : "/user/record_class_check.do?",
		cache : false,
		data : ({
			lab_id : lab_id,
			CLASS_TM : CLASS_TM
		}),
		dataType : "text",
		success: function(result){
			if(result == "true"){
				for(i=0; i < teamcount; i++){
					var CLASS_TM = $('#CLASS_TM').val();
					var SCORE_JOIN = $('#join_'+i).val();
					var SCORE_UPTAKE = $('#uptake_'+i).val();
					if(SCORE_JOIN == null || SCORE_UPTAKE == null){
						alert('점수를 선택하여주세요.')	
					}
					var RECORD = $('#RECORD').val();
					var lab_id = $('#lab_id').val();
					var IDX = $('#name_'+i).attr('idx');
					var NAME = $('#name_'+i).attr('name');
					$.ajax({
						type : "POST",
						url : "/user/record_insert.do?",
						cache : false,
						data : ({
							IDX : IDX,
							lab_id : lab_id,
							NAME : NAME,
							CLASS_TM : CLASS_TM,
							SCORE_JOIN : SCORE_JOIN,
							SCORE_UPTAKE : SCORE_UPTAKE,
							RECORD : RECORD
						}),
						dataType : "json",
						success: function(result){
							if(result = true){
								Swal.fire({
									text : "지도일지가 등록 되었습니다.!",
									confirmButtonText: 'Yes!'
								}).then((result) => {
									if(result.isConfirmed) {
										location.href='${pageContext.request.contextPath}/';
									}
								})
							}
							}
					})
				}
			}else if(result == "false"){
				alert('이미 등록된 수업일 입니다.');
			}
		}
	})
	
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