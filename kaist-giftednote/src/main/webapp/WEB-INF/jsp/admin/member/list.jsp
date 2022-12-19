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

<style>
    a {
        color: #ffffff !important;
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
                                        <h2>회원 리스트</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
									<div>
										<table class="tg" style="width:100%">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0lax">순번</th>
											    <th class="tg-0lax">이름</th>
											    <th class="tg-0lax">이메일</th>
											    <th class="tg-0lax">전화번호</th>
											    <th class="tg-0lax">주소</th>
											    <th class="tg-0lax">직업</th>
											  </tr>
											</thead>
											<tbody id="list">
												<c:forEach var="item" items="${model.list }" varStatus="Status">
												<tr class="update_modal">
												    <td class="tg-0lax">${Status.index+1 }</td>
												    <td class="tg-0lax" id="name_${Status.index+1 }" >${item.NAME }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">${item.EMAIL }</td>
												    <td class="tg-0lax" id="phone_${Status.index+1 }">${item.PHONE }</td>
												    <td class="tg-0lax" id="address_${Status.index+1 }">${item.ADDRESS }</td>
												    <td class="tg-0lax" id="level_${Status.index+1 }" value="${item.LEVEL }">
												    	<c:if test="${item.LEVEL == '2'}">
												    		멘토
												    	</c:if>
												    	<c:if test="${item.LEVEL == '1'}">
												    		학생
												    	</c:if>
												    	<c:if test="${item.LEVEL == '3'}">
												    		관리자
												    	</c:if>
												    </td>
												    <td id="birth_${Status.index+1 }" style="display:none">
												    	${item.BIRTH }
												    </td>
												    <td id="idx_${Status.index+1 }" style="display:none">
												     	${item.IDX }
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
<div id="meeting_form_modal" class="all_modal">
	<div class="all_modal_con">
		<div class="modal_box">

			<div class="modal_title">
				<!-- 공통타이틀 -->
				<div class="all_title">
					<div class="line">
						<span></span>
					</div>
					<h2>개인 정보 수정</h2>
				</div>
				<!-- 공통타이틀 -->

				<!-- 닫기 -->
				<div id="close_btn" class="close_btn">
					<a href="#"> <i class="las la-times"></i>
					</a>
				</div>
			</div>
			<div id="member_update_modal">
				<form id="member_update_form">
				<div>
					<ul>
						<li>
							<p>이름</p>
							<input type="text" id="UPDATE_NAME" name="NAME" value="">
						</li>
						<li>
							<input type="hidden" id="UPDATE_EMAIL" name="EMAIL" value="">
						</li>
						<li>
							<p>번호</p>
							<input type="text" id="UPDATE_PHONE" name="PHONE" value="">
						</li>
						<li>
							<p>주소</p>
							<input type="text" id="UPDATE_ADDRESS" name="ADDRESS" value="" >
						</li>	
						<li>
							<p>권한<span>3 = 관리자 / 2 = 교수 or 조교 / 1 = 학생</span></p>
							<select>
								<option value="1">학생</option>
								<option value="2">조교 or 교수</option>
								<option value="3">관리자</option>
								
							</select>
						</li>
						<li>
							<p>생년월일</p>
							<input type="text" id="UPDATE_BIRTH" name="BIRTH" value="" >
						</li>
						<li>
							<input type="hidden" id="UPDATE_IDX" name="IDX" value="" >
						</li>
						<li>
							<button type="button" onclick="javascript:member_update_set()" id="member_update" >정보 수정</button>
						</li>
					</ul>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>


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
    $("#close_btn").click(function() {
        $("#meeting_form_modal").hide();
    });

	$('.update_modal').click(function(){
		
		let tdv = $(this).find('td').toArray().map(function (td){ return $(td).text().trim();})
		console.log(tdv);
		for(i = 0; i < 8 ;i++ ){
			if(i <4){
				$('#member_update_modal').find('input').eq(i).val(tdv[i+1]);
			}else if(i == 4){
				if(tdv[i+1] == '멘토'){
					tdv[i+1] = '2';
				}else if(tdv[i+1] == '학생'){
					tdv[i+1] = '1';
				}else{
					tdv[i+1] = '3';
				}

				$('#member_update_modal').find('select').val(tdv[i+1]).prop('selected',true);
				$('#member_update_modal').find('input').eq(i).val(tdv[i+2]);
			}else{
				$('#member_update_modal').find('input').eq(i).val(tdv[i+2]);
			}
		}
		$("#meeting_form_modal").show();
	})
	
	function member_update_set(){
		var formData = $('#member_update_form').serialize();
		console.log(formData);
		$.ajax({
			type : "POST",
			url : "/admin/member/update.do",
			cache : false,
			data : formData,
			success : function(result) {
				if(result = true){
					Swal.fire({
						text : "정보가 수정되었습니다.!",
						confirmButtonText: 'Yes!'
					}).then((result) => {
						if(result.isConfirmed) {
							location.href='${pageContext.request.contextPath}/';
						}
					})	
				}
		}
	});
		
	}
	
	$.datetimepicker.setLocale('ko');
	jQuery('#UPDATE_BIRTH').datetimepicker({
		format : 'Y-m-d',
		lang : "ko",
		timepicker : false
	});
	
	
</script>
<!-- js 끝 -->