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

	.excel_form_modal_ul button{
		height : auto;
	}

	input#file-upload-button{
		width:5rem;
		height:1rem;
		background-color:red;
	}
	
	
	#excel_file{
		height: 35px;
	    font-size: 0.75rem;
	    color: #464646;
	    border: 1px solid #dedede;
	    vertical-align: middle;
	    padding-left: 10px;
	    padding-top : 4px;
	}

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
											    <th class="tg-0lax">PREURP - 아이디</th>
											    <th class="tg-0lax">생년월일</th>
											    <th class="tg-0lax">이메일</th>
											  </tr>
											</thead>
											<tbody id="list">
												<c:forEach var="item" items="${model.list }" varStatus="Status">
												<tr class="update_modal">
												    <td class="tg-0lax">${model.itemtotalcount - (Status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
												    <td class="tg-0lax" id="name_${Status.index+1 }" >${item.ur_name }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">${item.ur_userid }</td>
												    <td class="tg-0lax" id="phone_${Status.index+1 }">${item.ur_birthday }</td>
												    <td class="tg-0lax" id="address_${Status.index+1 }">${item.ur_email }</td>
												    <td id="idx_${Status.index+1 }" style="display:none">
												     	${item.ur_id }
												     </td>
												 </tr>
												 </c:forEach>
											</tbody>
										</table>
									</div>
									
									<div style="float:right">
									<!--
										07 - 26 삭제 
										<button type="button" id="chk_delete">선택삭제</button>
										<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/insert.do'">추가</button>
										<button type="button" id="excelUploadModal">엑셀 회원 추가</button>
									 -->
									 <!--
										<button type="button" id="excelDownload">엑셀 다운로드</button>
									-->
									</div>
									
									<!-- 페이징 -->
                                    <div class="paging_con">
                                        <div class="paging_box">
	                                        <c:if test="${model.page > 0 }">
		                                    	<div class="arrows_box arrows_box_lt">
											        <a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});">
											            <i class="las la-angle-left"></i>
											        </a>
											    </div>
	                                    	</c:if>
	                                    	<c:if test="${model.page <= 0}">
	                                    		<div class="arrows_box arrows_box_lt">
											        <a href="#">
											            <i class="las la-angle-left"></i>
											        </a>
											    </div>
	                                    	</c:if>
                                            <ul class="number_box">
                                            	<c:if test="${model.itempageend > 0}">
											    <c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
											    <c:choose>
											    
											    <c:when test="${model.page == i }">
											    <li class="number page_active"><a href="#">${i+1}</a></li>
											    </c:when>
											    
											    <c:otherwise>
											    <li class="number"><a href="javascript:pageChanged(${i}, ${model.itempageend});">${i+1}</a></li>
											    </c:otherwise>
											    
											    </c:choose>
											    </c:forEach>
											    </c:if>
											
											    <c:if test="${model.itempageend == 0}">
											    <li class="number page_active"><a>1</a></li>
											    </c:if>
											    <c:if test="${model.itempageend < 0}">
											    <li class="number page_active"><a>1</a></li>
											    </c:if>
                                            </ul>
                                            <c:if test="${model.itemCount < model.itemtotalcount/(model.page+1)}">
                                            	<div class="arrows_box arrows_box_gt">
	                                                <a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});"><i class="las la-angle-right"></i></a>
	                                            </div>
                                            </c:if>
                                            <c:if test="${model.itemCount >= model.itemtotalcount/(model.page+1)}">
                                            	<div class="arrows_box arrows_box_gt">
	                                                <a href="#"><i class="las la-angle-right"></i></a>
	                                            </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <!-- 페이징 end-->
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
<%-- <div id="meeting_form_modal" class="all_modal">
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
<div id="meeting_form_modal" class="all_modal excel_modal">
	<div class="all_modal_con">
		<div class="modal_box">
			<div class="modal_title">
				<!-- 공통타이틀 -->
				<div class="all_title">
					<div class="line">
						<span></span>
					</div>
					<h2>회원 엑셀 업로드</h2>
				</div>
				<!-- 공통타이틀 -->

				<!-- 닫기 -->
				<div id="excel_btn" class="close_btn">
					<a href="#"> <i class="las la-times"></i>
					</a>
				</div>
			</div>
			<form action="${pageContext.request.contextPath }/admin/member/excelMemberUpload.do" method="POST" id="excel_form_upload" enctype="multipart/form-data">
			<ul class="modal_form member_input excel_form_modal_ul">
				<!--
				엑셀 설명 필요 없을듯
				<li>
					<span class="list_t">설명 다운로드</span>
					<button type="button" id="fileDownBtn1">다운로드</button> 
					<span class="relate_c">엑셀 작성에 대한 설명서 내용입니다.</span>
				</li>
				
				-->
				<li><span class="list_t">양식 다운로드</span>
					<button type="button" id="fileDownBtn2">다운로드</button>
					<span class="relate_c">회원 일괄 등록에 필요한 엑셀 양식입니다.</span>
				</li>
				<li>
					<span class="list_t">엑셀 업로드</span>
					<input type="file" name="file" id="excel_file" accept=".xls">
					<span>양식에 맞는 엑셀을 업로드 해주세요.</span>
				</li>
			</ul>
			</form>
			<div id="excel_form_modal" style="text-align:center">
				<button type="button" onclick="javascript:excel_upload()">업로드</button>
			</div>
		</div>
	</div>
</div> --%>
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
/*	
	//전체 선택 체크 박스
	$(document).on("click", "#chk_calc_all", function(e) {
	    if ($(this).prop('checked')) {
	        $('input[name="chk_calc"]').prop('checked', true);
	    } else {
	        $('input[name="chk_calc"]').prop('checked', false);
	    }
	});
	
	//선택 삭제 버튼 on
	$(document).on("click","#chk_delete",function(e){
		
		if($("input[name='chk_calc']").is(':checked') == true){
			
			
			var check_length = $('input[name=chk_calc]:checked').length;
			//console.log(check_length);
			for(i = 0; i < check_length; i ++){
				var IDX = $('input[name=chk_calc]:checked').eq(i).val();
				console.log(i+'IDX='+IDX);
				$.ajax({
					type : "POST",
	                url : "${pageContext.request.contextPath}/admin/member/delete.do",
	                cache : false,
	                data : ({
	                    IDX : IDX
	                }),
	                dataType : "json",
	                success : function(data,status,xhr){
	                	
	                }
				})
				Swal.fire('선택된 회원들이 퇴출되었습니다.')
			}
		}else{
			Swal.fire('선택된 회원이 없습니다.');
		}
	})
	
	
	//
	$("#excelUploadModal").click(function(){
		$('.excel_modal').show();
	})
	$("#excel_btn").click(function() {
        $(".excel_modal").hide(); 
    });
	
	
	//엑셀 업로드
	function excel_upload(){
		$('#excel_form_upload').submit();
	}
	
	//엑셀 업로드 버튼
	$('#fileDownBtn2').click(function(){
		var url = '/resources/files/note_member.xls'
		location.href = url;
	})
*/	
	//엑셀 다운로드
	$('#excelDownload').click(function(){
		location.href='${pageContext.request.contextPath}/admin/member/excelDown.do';
	})
/*	
	
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