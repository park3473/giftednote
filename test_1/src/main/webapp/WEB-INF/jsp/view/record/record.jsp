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
        color: #ffffff !important;
        text-decoration: none !important;
    }
    .test_div > .test_p{
    	display:none;
    }
    #detail_show > .test_p{
    	display:block;
    }
	
	.tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
	  overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
</style>
<div>
	<div>
		<table class="tg">
		<thead>
		  <tr>
		    <th class="tg-0pky" rowspan="2">수업일</th>
		    <c:forEach var="teamitem" items="${model.teamlist }" varStatus="status">
				<th class="tg-0pky" colspan="2" id="name_${status.index }" name=${teamitem.NAME } idx="${teamitem.IDX }">${teamitem.NAME}</th>
			</c:forEach>
		    <th class="tg-0pky" rowspan="2">지도 목표 , 내용 및 자체평가 자유기술</th>
		  </tr>
		  <tr>
		  	<c:forEach begin="0" end="${model.teamcount-1 }">
		    	<td class="tg-0pky">참여율</td>
		    	<td class="tg-0pky">기여도</td>
			</c:forEach>
		  </tr>
		</thead>
		<tbody id="set">
			  <tr id="setList">
			    <td class="tg-0pky"><input class="input_size datecalendar" type="text" name="CLASS_TM" id="CLASS_TM"></td>
			    <c:forEach begin="0" end="${model.teamcount-1 }" step="1" varStatus="status">
					<td class="tg-0pky" ><select id="join_${status.index }"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td>
					<td class="tg-0pky"><select id="uptake_${status.index }"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td>
				</c:forEach>
			    <td class="tg-0pky"><textarea type="text" id="RECORD"></textarea></td>
			  </tr>
		</tbody>
		</table>
	</div>
	<div>
		<button onclick="javascript:insert(${model.teamcount})">등록</button>
	</div>
</div>
<div>
	<table class="tg">
	<thead>
	  <tr>
	    <th class="tg-0pky" rowspan="2">순번</th>
	    <th class="tg-0pky" rowspan="2">수업일</th>
	    <th class="tg-0pky" rowspan="2">작성일</th>
	    <c:forEach var="teamitem" items="${model.teamlist }" varStatus="status">
			<th class="tg-0pky" colspan="2">${teamitem.NAME}</th>
		</c:forEach>
	    <th class="tg-0pky" rowspan="2">지도 목표 , 내용 및 자체평가 자유기술</th>
	  </tr>
	  <tr>
	  	<c:forEach begin="0" end="${model.teamcount-1 }">
	    	<td class="tg-0pky">참여율</td>
	    	<td class="tg-0pky">기여도</td>
		</c:forEach>
	  </tr>
	</thead>
	<tbody>
		<c:forEach begin="0" end="${model.daycount-1 }" var="dayitem" items="${model.daylist }" varStatus="status">
		  <tr id="list_${status.index }" onclick="javascript:update(${status.index})">
		    <td class="tg-0pky" id="index_list">${status.index+1 }</td>
		    <td class="tg-0pky" id="class_tm_list">${dayitem.CLASS_TM}</td>
		    <td class="tg-0pky" id="create_tm_list">${dayitem.CREATE_TM }</td>
		    <c:forEach begin="${status.index*4 }" end="${(status.index*model.teamcount)+3 }" step="1" var="item" items="${model.list }">
				<td class="tg-0pky" ID="${status.index*4 }">${item.SCORE_JOIN }</td>
				<td class="tg-0pky" id="${(status.index*4)+3 }">${item.SCORE_UPTAKE }</td>
			</c:forEach>
		    <td class="tg-0pky">${dayitem.RECORD }</td>
		  </tr>
		 </c:forEach>
	</tbody>
	</table>
</div>
<input type="hidden" value="${model.list[0].N_IDX }" id="n_idx">
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
		for(i=0; i < teamcount; i++){
			var CLASS_TM = $('#CLASS_TM').val();
			var SCORE_JOIN = $('#join_'+i).val();
			var SCORE_UPTAKE = $('#uptake_'+i).val();
			var RECORD = $('#RECORD').val();
			var N_IDX = $('#n_idx').val();
			var IDX = $('#name_'+i).attr('idx');
			
			$.ajax({
				type : "POST",
				url : "/user/record_insert.do?",
				cache : false,
				data : ({
					IDX : IDX,
					N_IDX : N_IDX,
					CLASS_TM : CLASS_TM,
					SCORE_JOIN : SCORE_JOIN,
					SCORE_UPTAKE : SCORE_UPTAKE,
					RECORD : RECORD
				}),
				dataType : "json",
				success: function(data , status, xhr){
					console.log(data);
					}
			})
		}
	}
	
	
	function update(index){
		var inner = document.getElementById('list_'+index).innerHTML;
		var list = '<tr id="update_list_0">'+inner+'</tr>';
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