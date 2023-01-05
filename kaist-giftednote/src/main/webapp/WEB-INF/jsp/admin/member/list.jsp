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
    
    


	.member_select {
    	width : 500px;
    }
    
    .member_select > select {
    	width : 150px;
    }
    
    .search_box_4{
    	float:left;
    }
    .search_box_4 #re_road_btn{
    	height : 2.2rem;
    }



</style>
<section id="new_sc" class="sc_wrap">
        <div class="sc_area">
            <div class="sc_con">
                <div class="sc_size">
					<%@ include file="../include/top.jsp" %>

                    <!-- 본문 내용-->
                    <!-- 학생리스트 -->
                    <c:if test="${model.beforeDomain.ur_level == '2' }">
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>관리자</li>
                                    <li>학생 관리</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size" style="height : 110vh !important">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>학생 리스트</h2>
                                    </div>
                                    
                                    <div class="meeting_search">

                                        <!--검색창-->
                                        <div class="meeting_search_box floatL">
                                            <div class="select_input member_select">
                                                <select name="std_prog_id" id="std_prog_id">
                                                    <option value="">기수</option>
                                                    <c:forEach var="i" begin="4" end="11">
                                                    	<option value="${i}" <c:if test="${model.beforeDomain.std_prog_id == i }">selected</c:if>>${i -2 }기</option>
                                                    </c:forEach>
                                                </select>
                                                <select name="search_type" id="std_search_type">
                                                	<option value="ALL" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ALL' }">selected</c:if> >전체</option>
                                                	<option value="ur_name" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ur_name' }">selected</c:if> >이름</option>
                                                	<option value="ur_email" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ur_email' }">selected</c:if> >이메일</option>
                                                </select>
                                            </div>
                                            <div class="search_box search_box_3">
                                                <div class="sh_input">
                                                    <input type="text" id="std_search_text" name="search_text" <c:if test="${model.beforeDomain.SEARCH_TEXT != '' }">value="${model.beforeDomain.SEARCH_TEXT }"</c:if> >
                                                    <button style="margin-left:0 !important" onclick="search_member(2)"><img src="${pageContext.request.contextPath }/resources/img/search_icon.png" alt="검색"></button>
                                                </div>
                                            </div>
                                            <div class="search_box_4">
                                            	<button type="button" id="re_road_btn" onclick="location.href='${pageContext.request.contextPath}/admin/member/list.do?ur_level=2'">새로고침</button>
                                            </div>
                                        </div>
                                        <!--검색창 end-->
                                    </div>
                                    <!-- 공통타이틀 -->
									<div class="all_table all_table_3">
										<table class="all_table_box" style="width:100%">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0lax">순번</th>
											    <th class="tg-0lax">이름</th>
											    <th class="tg-0lax">기수</th>
											    <th class="tg-0lax">생년월일</th>
											    <th class="tg-0lax">이메일</th>
											    <th class="tg-0lax">연구 노트</th>
											    <th class="tg-0lax">탐구 일지</th>
											  </tr>
											</thead>
											<tbody id="list">
												<c:forEach var="item" items="${model.list }" varStatus="Status">
												<tr class="update_modal">
												    <td class="tg-0lax">${model.itemtotalcount - (Status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
												    <td class="tg-0lax" id="name_${Status.index+1 }" >${item.ur_name }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">${item.std_prog_id - 2  }</td>
												    <td class="tg-0lax" id="phone_${Status.index+1 }">${item.ur_birthday }</td>
												    <td class="tg-0lax" id="address_${Status.index+1 }">${item.ur_email }</td>
												    <td id="idx_${Status.index+1 }">
												     	<button type="button" id="StudentNoteCheck" class="StudentNoteCheck" onclick="StudentNoteCheck(${item.std_selected_lab_id})">연구 노트</button>
												     </td>
												     <td id="idx_${Status.index+1 }">
												     	<button type="button"  id="StudentExploringCheck" class="StudentExploringCheck" onclick="StudentExploringCheck(${item.std_selected_lab_id} , ${item.ur_id })">탐구 일지</button>
												     </td>
												 </tr>
												 </c:forEach>
											</tbody>
										</table>
									</div>
									<!--
									<div style="float:right>
										07 - 26 삭제 
										<button type="button" id="chk_delete">선택삭제</button>
										<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/insert.do'">추가</button>
										<button type="button" id="excelUploadModal">엑셀 회원 추가</button>
										<button type="button" id="excelDownload">엑셀 다운로드</button>
									</div>
									-->
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
                    </c:if>
                    <!-- 학생리스트 -->
                    <!-- 지도자리스트 -->
                    <c:if test="${model.beforeDomain.ur_level == '3' }">
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>관리자</li>
                                    <li>지도자 관리</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size" style="height : 110vh !important">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>지도자 리스트</h2>
                                    </div>
                                    
                                    <div class="meeting_search">
                                        <!--검색창-->
                                        <div class="meeting_search_box floatL">
                                            <div class="select_input member_select">
                                                <select name="urlab_lab_prog_id" id="urlab_lab_prog_id">
                                                    <option value="">기수</option>
                                                    <c:forEach var="i" begin="4" end="11">
                                                    	<option value="${i}" <c:if test="${model.beforeDomain.urlab_lab_prog_id == i }">selected</c:if>>${i -2 }기</option>
                                                    </c:forEach>
                                                </select>
                                                <select name="ur_coll_cd" id="ur_coll_cd">
                                                	<option value="">대학코드</option>
                                                	<option value="K" <c:if test="${model.beforeDomain.ur_coll_cd == 'K' }">selected</c:if> >K</option>
                                                	<option value="D" <c:if test="${model.beforeDomain.ur_coll_cd == 'D' }">selected</c:if> >D</option>
                                                	<option value="U" <c:if test="${model.beforeDomain.ur_coll_cd == 'U' }">selected</c:if> >U</option>
                                                	<option value="G" <c:if test="${model.beforeDomain.ur_coll_cd == 'G' }">selected</c:if> >G</option>
                                                </select>
                                                <select name="search_type" id="leader_search_type">
                                                	<option value="ALL" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ALL' }">selected</c:if> >전체</option>
                                                	<option value="ur_name" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ur_name' }">selected</c:if> >이름</option>
                                                	<option value="ur_email" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ur_email' }">selected</c:if> >이메일</option>
                                                </select>
                                            </div>
                                            <div class="search_box search_box_3">
                                                <div class="sh_input">
                                                    <input type="text" id="leader_search_text" name="search_text" <c:if test="${model.beforeDomain.SEARCH_TEXT != '' }">value="${model.beforeDomain.SEARCH_TEXT }"</c:if> >
                                                    <button style="margin-left:0 !important" onclick="search_member(3)"><img src="${pageContext.request.contextPath }/resources/img/search_icon.png" alt="검색"></button>
                                                </div>
                                            </div>
                                            <div class="search_box_4">
                                            	<button type="button" id="re_road_btn" onclick="location.href='${pageContext.request.contextPath}/admin/member/list.do?ur_level=3'">새로고침</button>
                                            </div>
                                        </div>
                                        <!--검색창 end-->
                                    </div>
                                    
                                    <!-- 공통타이틀 -->
									<div class="all_table all_table_3">
										<table class="all_table_box" style="width:100%">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0lax">순번</th>
											    <th class="tg-0lax">기수</th>
											    <th class="tg-0lax">이름</th>
											    <th class="tg-0lax">PREURP - 아이디</th>
											    <th class="tg-0lax">소속대학</th>
											    <th class="tg-0lax">생년월일</th>
											    <th class="tg-0lax">이메일</th>
											  	<th class="tg-0lax">연구노트</th>
											  	<th class="tg-0lax">지도일지</th>
											  	<th class="tg-0lax">학생연구역량평가</th>
											  </tr>
											</thead>
											<tbody id="list">
												<c:forEach var="item" items="${model.list }" varStatus="Status">
												<tr class="update_modal">
												    <td class="tg-0lax">${model.itemtotalcount - (Status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
												    <td class="tg-0lax" id="name_${Status.index+1 }" >${item.urlab_lab_prog_id - 2 }</td>
												    <td class="tg-0lax" id="name_${Status.index+1 }" >${item.ur_name }</td>
												    <td class="tg-0lax" id="name_${Status.index+1 }" >${item.ur_userid }</td>
												    <td class="tg-0lax" id="email_${Status.index+1 }">${item.urlab_coll_cd }</td>
												    <td class="tg-0lax" id="phone_${Status.index+1 }">${item.ur_birthday }</td>
												    <td class="tg-0lax" id="address_${Status.index+1 }">${item.ur_email }</td>
												 	<td id="idx_${Status.index+1 }">
												    	<button type="button" id="LeaderNoteCheck" class="LeaderNoteCheck" onclick="LeaderNoteCheck(${item.urlab_lab_id})">연구 노트</button>
													</td>
													<td id="idx_${Status.index+1 }">
													   	<button type="button"  id="LeaderRecordCheck" class="LeaderRecordCheck" onclick="LeaderRecordCheck(${item.urlab_lab_id})">기록 일지</button>
													</td>
													<td id="idx_${Status.index+1 }">
													   	<button type="button"  id="LeaderSrceCheck" class="LeaderSrceCheck" onclick="LeaderSrceCheck(${item.urlab_lab_id})">학생 평가</button>
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
                    </c:if>
                    <!-- 지도자리스트 -->
                    <!-- 본문 내용 end-->

                </div>
            </div>
        </div>
    </section>
<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
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
        
        var URL = "list.do?ur_level="+${model.beforeDomain.ur_level}+"&PAGE="+page;
        if('${model.ITEM_COUNT}' == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + '${model.ITEM_COUNT}';
        }
        if($('#std_prog_id').val() != ''){
        	URL = URL + "&std_prog_id=" + $('#std_prog_id').val();
        }
        if($('#std_search_text').val() != '' && $('#std_search_text').val() != null){
        	URL = URL + "&SEARCH_TYPE=" + $('#std_search_type').val();
        	
        	URL = URL + "&SEARCH_TEXT=" + $('#std_search_text').val(); 
        }
        if($('#leader_search_text').val() != '' && $('#leader_search_text').val() != null){
        	URL = URL + "&SEARCH_TYPE=" + $('#leader_search_type').val();
        	
        	URL = URL + "&SEARCH_TEXT=" + $('#leader_search_text').val(); 
        }
        location.href = URL;
	}
	
	
	function search_member(Level){
		
		if(Level == '2'){
			
			var URL = "list.do?ur_level=2&PAGE=0";
			URL = URL + "&ITEM_COUNT=" + '10';
	        if($('#std_prog_id').val() != ''){
	        	URL = URL + "&std_prog_id=" + $('#std_prog_id').val();
	        }
	        if($('#std_search_text').val() != ''){
	        	URL = URL + "&SEARCH_TYPE=" + $('#std_search_type').val();
	        	
	        	URL = URL + "&SEARCH_TEXT=" + $('#std_search_text').val(); 
	        }
	        location.href = URL;
	        
		}else if(Level == '3'){
			
			var URL = "list.do?ur_level=3&PAGE=0";
			URL = URL + "&ITEM_COUNT=" + '10';
	        if($('#urlab_lab_prog_id').val() != ''){
	        	URL = URL + "&urlab_lab_prog_id=" + $('#urlab_lab_prog_id').val();
	        }
	        if($('#ur_coll_cd').val() != ''){
	        	URL = URL + "&ur_coll_cd=" + $('#ur_coll_cd').val();
	        }
	        if($('#leader_search_text').val() != ''){
	        	URL = URL + "&SEARCH_TYPE=" + $('#leader_search_type').val();
	        	
	        	URL = URL + "&SEARCH_TEXT=" + $('#leader_search_text').val(); 
	        }
	        location.href = URL;
	        
		}
		
	}
	
	
	$('input[name="search_text"]').keydown(function(){
		console.log(event.keyCode);
		if(event.keyCode === 13){
			search_member(${model.beforeDomain.ur_level})
				
		}
		
	})
	
	
	function LeaderNoteCheck(lab_id){
		location.href="${pageContext.request.contextPath}/user/note/view.do?lab_id="+lab_id+"";
	}
	
	function LeaderRecordCheck(lab_id){
		location.href="${pageContext.request.contextPath}/record/list.do?lab_id="+lab_id+"";
	}
	function LeaderSrceCheck(lab_id){
		location.href="${pageContext.request.contextPath}/srce/srce.do?lab_id="+lab_id+"";
	}
	
	function StudentNoteCheck(lab_id){
		location.href="${pageContext.request.contextPath}/user/note/view.do?lab_id="+lab_id+"";
	}
	function StudentExploringCheck(lab_id , user_idx){
		location.href="${pageContext.request.contextPath}/exploring/exploring.do?lab_id="+lab_id+"&user_idx="+user_idx+"";
	}
	
</script>
<!-- js 끝 -->