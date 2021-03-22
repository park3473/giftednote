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
	<table class="tg">
		<thead>
		  <tr>
		    <th class="tg-0pky" rowspan="2">수업일</th>
		    <th class="tg-0pky" colspan="2">지도자</th>
		    <th class="tg-0lax" colspan="2">교육장소</th>
		    <th class="tg-0lax" colspan="5">교육방법</th>
		    <th class="tg-0lax" rowspan="2">참여도</th>
		    <th class="tg-0lax" rowspan="2">이해도</th>
		    <th class="tg-0lax" rowspan="2">배운점</th>
		    <th class="tg-0lax" rowspan="2">느낀점</th>
		  </tr>
		  <tr>
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
			<tr>
			    <td class="tg-0pky"><input class="input_size datecalendar" type="text" name="CLASS_TM" id="CLASS_TM"></td>
			    <td class="tg-0lax"><input type="checkbox" name="MENTO" value="교수"></td>
			    <td class="tg-0lax"><input type="checkbox" name="MENTO" value="조교"></td>
			    <td class="tg-0lax"><input type="checkbox" name="PLACE" value="자택"></td>
			    <td class="tg-0lax"><input type="checkbox" name="PLACE" value="고교"></td>
			    <td class="tg-0lax"><input type="checkbox" name="TYPE" value="실시간강의"></td>
			    <td class="tg-0lax"><input type="checkbox" name="TYPE" value="영상강의"></td>
			    <td class="tg-0lax"><input type="checkbox" name="TYPE" value="실험"></td>
			    <td class="tg-0lax"><input type="checkbox" name="TYPE" value="세미나"></td>
			    <td class="tg-0lax"><input type="text" name="TYPE" id="type_what"></td>
			    <td class="tg-0lax"><select id="join"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td>
			    <td class="tg-0lax"><select id="uptake"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td>
			    <td class="tg-0lax"><input type="text" name="LEADER"></td>
			    <td class="tg-0lax"><input type="text" name="LEADER"></td>
			</tr>
		</tbody>
	</table>
</div>
<div>
	<table class="tg">
		<thead>
		  <tr>
		    <th class="tg-0pky" rowspan="2">순번</th>
		    <th class="tg-0pky" rowspan="2">수업일</th>
		    <th class="tg-0pky" colspan="2">지도자</th>
		    <th class="tg-0lax" colspan="2">교육장소</th>
		    <th class="tg-0lax" colspan="5">교육방법</th>
		    <th class="tg-0lax" rowspan="2">참여도</th>
		    <th class="tg-0lax" rowspan="2">이해도</th>
		    <th class="tg-0lax" rowspan="2">배운점</th>
		    <th class="tg-0lax" rowspan="2">느낀점</th>
		  </tr>
		  <tr>
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
		<c:forEach items="${model.list }" var="item" varStatus="Status">
		  	<tr>
		  		<td>${Status.index+1 }</td>
		  		<td>${item.CLASS_TM }</td>
		  		<c:if test="${fn:contains(item.LEADER_TYPE,'LEADER') }">
		  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
		  		</c:if>
		  		<c:if test="${!fn:contains(item.LEADER_TYPE,'LEADER') }">
		  			<td></td>
		  		</c:if>
		  		
		  		<c:if test="${fn:contains(item.LEADER_TYPE,'ASSI') }">
		  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
		  		</c:if>
		  		<c:if test="${!fn:contains(item.LEADER_TYPE,'ASSI') }">
		  			<td></td>
		  		</c:if>
		  		
		  		<c:if test="${fn:contains(item.CLASS_TYPE,'자택') }">
		  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
		  		</c:if>
		  		<c:if test="${!fn:contains(item.CLASS_TYPE,'자택') }">
		  			<td></td>
		  		</c:if>
		  		
		  		<c:if test="${fn:contains(item.CLASS_TYPE,'고교') }">
		  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
		  		</c:if>
		  		<c:if test="${!fn:contains(item.CLASS_TYPE,'고교') }">
		  			<td></td>
		  		</c:if>
		  		
		  		<c:if test="${fn:contains(item.CLASS_PLACE,'실시간강의') }">
		  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
		  		</c:if>
		  		<c:if test="${!fn:contains(item.CLASS_PLACE,'실시간강의') }">
		  			<td></td>
		  		</c:if>
		  		
		  		<c:if test="${fn:contains(item.CLASS_PLACE,'영상강의') }">
		  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
		  		</c:if>
		  		<c:if test="${!fn:contains(item.CLASS_PLACE,'영상강의') }">
		  			<td></td>
		  		</c:if>
		  		
		  		<c:if test="${fn:contains(item.CLASS_PLACE,'실험') }">
		  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
		  		</c:if>
		  		<c:if test="${!fn:contains(item.CLASS_PLACE,'실험') }">
		  			<td></td>
		  		</c:if>
		  		
		  		<c:if test="${fn:contains(item.CLASS_PLACE,'세미나') }">
		  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
		  		</c:if>
		  		<c:if test="${!fn:contains(item.CLASS_PLACE,'세미나') }">
		  			<td></td>
		  		</c:if>
		  		
		  		<c:if test="${fn:contains(item.CLASS_PLACE,'기타') }">
		  			<td><input type="checkbox" checked="true" onclick="return false;"></td>
		  		</c:if>
		  		<c:if test="${!fn:contains(item.CLASS_PLACE,'기타') }">
		  			<td></td>
		  		</c:if>
		  		
		  		<td>${item.SCORE_JOIN }</td>
		  		<td>${item.SCORE_UPTAKE }</td>
		  		<td>${item.LEARN }</td>
		  		<td>${item.FELT }</td>
		  	</tr>
		  </c:forEach>
		</tbody>
	</table>
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