<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>학교검색</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table {
	border-collapse: collapse;
}

.table01 {
	border: 1px solid #cdcdcd;
	text-align: center;
	line-height: 20px;
	font-size: 12px;
	width: 90%;
	margin: 10px 5%
}

.table01 thead th {
	height: 35px;
	border-left: 1px solid #f7f7f7;
	background-position: left top;
	background-repeat: repeat-x;
	color: #46688b;
	line-height: 18px;
}

.table01 tbody th {
	padding: 5px;
	border-left: 1px solid #cdcdcd;
	border-right: 1px solid #cdcdcd;
	border-bottom: 1px solid #cdcdcd;
	font-weight: normal;
}

.table01 tbody td {
	padding: 5px;
	border-left: 1px solid #cdcdcd;
	border-right: 1px solid #cdcdcd;
	border-bottom: 1px solid #cdcdcd;
}
</style>
<script type="text/javascript">
<!--
	function selSchool(school_code, school_name) {
		var form1 = opener.document.form1;
		form1.school_code.value = school_code;
		form1.school_name.value = school_name;
		self.close();
	}
//-->
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
</head>
<body leftmargin="0" topmargin="0" style="background-color: #FFF">
	<div style="width: 900px; margin: 30px 20px; overflow: hidden">
		<div style="width: 460px; float: left; margin-bottom: 10px">
			<h2>학교 검색</h2>
		</div>
		<div
			style="width: 810px; float: left; background-color: e2ecef; text-align: center" onkeyup="searchBtnClick1();">
			<form name="search_form" action="/list.do" onsubmit="searchBtnClick(); return false;" method="POST"
				style="margin: 20px 0">
				<!-- 
				<select id="SCHOOL_TYPE" class="school_input_type">
					<option value="0">선택해주세요</option>
					<option value="1">초등학교</option>
					<option value="2">중학교</option>
					<option value="3">고등학교</option>
				</select>
				<select id="SCHOOL_SIDO" class="school_input_sido">
					<option value="0">시/도</option>
					<option value="1">서울</option>
					<option value="2">부산</option>
					<option value="3">인천</option>
					<option value="3">광주</option>
					<option value="3">대전</option>
					<option value="3">울산</option>
					<option value="3">경기도</option>
					<option value="3">강원도</option>
					<option value="3">충청북도</option>
					<option value="3">충청남도</option>
					<option value="3">전라북도</option>
					<option value="3">전라남도</option>
					<option value="3">경상북도</option>
					<option value="3">경상남도</option>
					<option value="3">제주특별자치도</option>
					<option value="3">세종특별자치시</option>
				</select>
				 -->
				<input type="text"  id="SCHOOL_SEARCH_TEXT" name="SCHOOL_SEARCH_TEXT" value="" style="width: 200px; height: 25px; margin-right: 10px; vertical-align: middle; ime-mode: active">
				<button type="button" onclick="searchBtnClick();">검색</button>
			</form>
		</div>
		<div
			style="width: 815px; height: 300px; background-color: #f6f6f6; float: left; margin-top: 10px">
			<div
				style="width: 800px; height: 288px; padding-bottom: 20px; border: 1px solid #dbdbdb; background-color: #fff; box-sizing: border-box; margin: 6px; overflow: auto;">
				<p
					style="text-align: center; font-size: 15px; color: #336699; font-weight: bold; margin: 15px 0; letter-spacing: -1px">검색결과
					중 본인의 학교를 선택해주세요.</p>
				<table cellpadding="0" cellspacing="0" border="0" class="table01">
					<caption style="display: none">학교검색</caption>
					<colgroup>
						<col width="15%">
						<col width="30%">
						<col width="40%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr bgcolor="e7e8e9">
							<th scope="col">학교급</th>
							<th scope="col">학교명</th>
							<th scope="col">학교 주소</th>
							<th scope="col">확인</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${model.list}" varStatus="status">
							<tr>
								<td>${item.SCHOOL_TYPE}</td>
								<td><input type="hidden" id="SCHOOL_NM" value="${item.SCHOOL_NAME}">${item.SCHOOL_NAME}</td>
								<td>${item.SCHOOL_ADDRESS}</td>
								<input type="hidden" id="SCHOOL_LOCATION" name="SCHOOL_LOCATION" value="${item.SCHOOL_LOCATION}">
								<td><button class="school_test" >확인</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
	$('.school_test').click(function(){
		/* 개발 opener = 부모창 */
		var school;
		var location;
		school = ($(this).parent().prev().prev().prev().find('input').val());
		location = ($(this).parent().prev().val());
		//alert(location);
		//alert(school);
		opener.document.getElementById("SCHOOL_NAME").value = school;
		if(opener.document.getElementById("TEACHER_SIDO_NAME") == null){
			opener.document.getElementById("ADDRESS_LOCAL").value = location;
		}
		if(opener.document.getElementById("TEACHER_SIDO_NAME") != null){
			opener.document.getElementById("TEACHER_SIDO_NAME").value = location;
		}
		window.close();
	});
	
	
	function searchBtnClick(){
        URL = './list.do';
        URL = URL + "?PAGE=0";
        
		/*
        URL = URL + "&TYPE="+$('#SCHOOL_TYPE').val();;
        URL = URL + "&SIDO=" + $('#SCHOOL_SIDO').val();
        */
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SCHOOL_SEARCH_TEXT').val());
        
       	console.log(URL);
        
        location.href = URL;
    }
	function searchBtnClick1(){
		if(window.event.keyCode == 13){
			searchBtnClick();
		}
	}
</script>
</html>

