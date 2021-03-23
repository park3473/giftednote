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
	div{
		border : 1px solid gray;
	}
</style>
<div>
	<div>
		<div>
			<div>
				<div>
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li onclick="location.href='${pageContext.request.contextPath}/note/insert.do?IDX=${session_idx}'">추가</li>
					</ul>
				</div>
			
				<c:forEach var="item" items="${model.list}" varStatus="var">
				<div style="width:300px;" onclick="javascript:detail(${item.N_IDX})" id="${item.N_IDX }_detail" class="test_div">
						<img style="width:300px;"src="${pageContext.request.contextPath}/resources/upload/note_img/${item.IMAGE }.png">
						<div id="${item.N_IDX }_idx" class="test_p" dead="${item.DEAD }">
							<p>${item.TITLE }</p>
							<p>${item.TOPIC }</p>
							<p>${item.LEADER }</p>
							<p>${item.ASSI }</p>
							<p>${item.INTRO }</p>
							<p>${item.START_TM }</p>
							<p>${item.END_TM }</p>
						</div>
				</div>
				</c:forEach>
				<div>
					<div id="detail_show">
					
					</div>
					<div id="detail_wrap" style="display:none">
						<div id="detail_student">
							<p id="detail_wrap_bt">작성하러가기</p>
							<p id="detail_exploring">탐구일지</p>
						</div>
						<!-- 교수 , 조교 부분 -->
						<div id="detail_mento">
							<p id="detail_record">기록일지</p>
							<p id="detail_complete">마감하기</p>
							<p id="detail_srce">학생연구역량평가</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	function detail(idx){
		const element = document.getElementById(idx+'_detail');
		  //alert(element.innerHTML);
		  $('#detail_show').html(element.innerHTML);
		  $('#detail_wrap').show();
		  $('#detail_wrap_bt').attr('onclick','location.href="/note/detail.do?N_IDX='+idx+'"');
		  $('#detail_exploring').attr('onclick','location.href="/exploring/exploring.do?N_IDX='+idx+'&IDX='+${session_idx}+'"')
		  if(${session_level} == '2'){
		  		$('#detail_complete').attr('onclick','javascript:complete('+idx+')');
		  		$('#detail_record').attr('onclick','location.href="/record/list.do?N_IDX='+idx+'"');
		  		$('#detail_srce').attr('onclick','location.href="/srce/srce.do?N_IDX='+idx+'"');
		  }else{
				$('#detail_mento').hide();
		  }
	}
	
	function complete(n_idx){
		if($('#'+idx+'_idx').attr('dead') == 'COMPLETE'){
			Swal.fire('이미 마감된 연구노트 입니다.')
		}else{
			Swal.fire({
				  text: "현 연구노트 를 마감하시겠습니까?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '예',
				  cancelButtonText: '아니요',
				}).then((result) => {
				  if (result.isConfirmed) {
					  location.href="/note/complete.do?N_IDX="+n_idx
				  }
				})
		}
	}
	
</script>
<!-- js 끝 -->