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
    a {
        color: #ffffff;
        text-decoration: none !important;
    }
    
    .note_select {
    	width : 500px;
    }
    
    .note_select > select {
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
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>관리자</li>
                                    <li>팀 리스트</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size" style="height:110vh !important">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap join_table">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>노트 리스트</h2>
                                    </div>
                                    
                                    <!-- 공통타이틀 -->
                                    
                                    <!-- 공통서치 -->
                                    <div class="meeting_search">

                                        <!--검색창-->
                                        <div class="meeting_search_box floatL">
                                            <div class="select_input note_select">
                                                <select name="lab_prog_id" id="lab_prog_id">
                                                    <option value="">기수</option>
                                                    <c:forEach var="i" begin="4" end="9">
                                                    	<option value="${i}" <c:if test="${model.beforeDomain.lab_prog_id == i }">selected</c:if>>${i -2 }기</option>
                                                    </c:forEach>
                                                </select>
                                                <select name="lab_coll_cd" id="lab_coll_cd">
                                                	<option value="">대학코드</option>
                                                	<option value="K" <c:if test="${model.beforeDomain.lab_coll_cd == 'K' }">selected</c:if> >K</option>
                                                	<option value="D" <c:if test="${model.beforeDomain.lab_coll_cd == 'D' }">selected</c:if> >D</option>
                                                	<option value="U" <c:if test="${model.beforeDomain.lab_coll_cd == 'U' }">selected</c:if> >U</option>
                                                	<option value="G" <c:if test="${model.beforeDomain.lab_coll_cd == 'G' }">selected</c:if> >G</option>
                                                </select>
                                                <select name="search_type" id="search_type">
                                                	<option value="ALL" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ALL' }">selected</c:if> >전체</option>
                                                	<option value="lab_study_title" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'lab_study_title' }">selected</c:if> >제목</option>
                                                	<option value="lab_ur_userid" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'lab_ur_userid' }">selected</c:if> >작성자</option>
                                                </select>
                                            </div>
                                            <div class="search_box search_box_3">
                                                <div class="sh_input">
                                                    <input type="text" id="search_text" name="search_text" <c:if test="${model.beforeDomain.SEARCH_TEXT != '' }">value="${model.beforeDomain.SEARCH_TEXT}"</c:if>>
                                                    <button style="margin-left:0 !important" onclick="search_note()"><img src="${pageContext.request.contextPath }/resources/img/search_icon.png" alt="검색"></button>
                                                </div>
                                            </div>
                                            <div class="search_box_4">
                                            	<button type="button" id="re_road_btn" onclick="location.href='${pageContext.request.contextPath}/admin/team/note_list.do?lab_prog_id=9'">새로고침</button>
                                            	<button type="button" id="srce_all" onclick="SrceDownBtn()">학생연구역량평가</button>
                                            	<button type="button" id="srce_all" onclick="ExploringDownBtn()">탐구일지</button>
                                            	<button type="button" id="srce_all" onclick="RecordDownBtn()">지도일지</button>
                                            	<button type="button" id="srce_all" onclick="TotalDownBtn()">전체</button>
                                            	<button type="button" id="re_road_btn" onclick="location.href='${pageContext.request.contextPath}/admin/team/note_list.do?lab_prog_id=9'">새로고침</button>
                                            </div>
                                        </div>
                                        <!--검색창 end-->
                                        
                                        <!--
                                        <div id="meeting_room_btn" class="meeting_add floatR">
                                            <a href="#"></a>
                                        </div>
                                        -->
                                    </div>
                                    <!-- 공통서치 end-->
                                    
									<div class="all_table all_table_3">
										<table class="all_table_box" >
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0lax">순번</th>
											    <th class="tg-0lax">연구 기수</th>
											    <th class="tg-0lax">제목</th>
											    <th class="tg-0lax">소속 대학 코드</th>
											    <th class="tg-0lax">작성자</th>
											    <th class="tg-0lax">지도일지</th>
											    <th class="tg-0lax">학생연구역량평가</th>
											    <th class="tg-0lax">연구 팀원 리스트</th>
											  </tr>
											</thead>
											<tbody id="list">
												<c:forEach var="item" items="${model.list }" varStatus="Status">
												<tr class="note_list">
												    <td class="tg-0lax">${model.itemtotalcount - (Status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
												    <td class="tg-0lax">${item.lab_prog_id - 2 }</td>
												    <td style="display:none" class="tg-0lax" id="lab_name_${Status.index+1 }">${item.lab_id }</td>
												    <td class="tg-0lax" id="lab_study_title_${Status.index+1 }" >${item.lab_study_title }</td>
												    <td class="tg-0lax" id="lab_coll_cd_${Status.index+1 }">${item.lab_coll_cd }</td>
												    <td class="tg-0lax" id="lab_ur_userid_${Status.index+1 }">${item.lab_ur_userid }</td>
												    <td class="tg-0lax" id="exploring_${Status.index+1 }"><button type="button" onclick="location.href='${pageContext.request.contextPath}/record/list.do?lab_id=${item.lab_id }'">지도일지</button></td>
												    <td class="tg-0lax" id="srce_${Status.index+1 }"><button type="button" onclick="location.href='${pageContext.request.contextPath}/srce/srce.do?lab_id=${item.lab_id}'">학생연구역량평가</button></td>
												    <td class="tg-0lax" id="team_${Status.index+1 }"><button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/team/getTeamList.do?lab_id=${item.lab_id }'">팀리스트</button></td>
												 </tr>
												 </c:forEach>
											</tbody>
										</table>
									</div>
									
									<!-- 페이징 -->
									<input type="hidden" value="${model.page}">
									<input type="hidden" value="${model.itempagestart}">
									<input type="hidden" value="${model.itempageend}">
									<input type="hidden" value="${model.itemCount}">
									<input type="hidden" value="${model.itemtotalcount}">
									<input type="hidden" value="${model.itemtotalpage }">
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
<%@ include file="../include/footer.jsp" %>
<!--공통하단 끝-->


<!-- js 시작 -->
<script type="text/javascript">
	
	$.datetimepicker.setLocale('ko');
	jQuery('#UPDATE_BIRTH').datetimepicker({
		format : 'Y-m-d',
		lang : "ko",
		timepicker : false
	});
	
	
	/*
	function team_list(idx){
		
		var N_IDX = idx;
		
		$.ajax({
			type : "POST",
			url : "/admin/team/getTeamList.do",
			cache : false,
			data : ({
				N_IDX : N_IDX
			}),
			dataType : "json",
			success : function(data , status , xhr) {
				console.log(data);
				var html = "";
				for(i = 0; i < data.length; i++){
					html += '<tr onclick='
					html += 'location.href="${pageContext.request.contextPath}/exploring/exploring.do?N_IDX='+data[i].N_IDX+'&IDX='+data[i].IDX+'">'
					html += '<td>'+i+'</td>'
					html += '<td>'+data[i].NAME+'</td>'
					html += '<td>'+data[i].SCHOOL_NAME+'</td>'
					html += '<td>'+data[i].EMAIL+'</td>'
					
					html += '</tr>'
				}
				console.log(html);
				$('#teamList').html(html);
			}
		});
		
	}
	*/
	
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

        var URL = "note_list.do?PAGE="+page;
        if('${model.ITEM_COUNT}' == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + '${model.ITEM_COUNT}';
        }
        if($('#lab_prog_id').val() != ''){
        	URL = URL + "&lab_prog_id=" + $('#lab_prog_id').val();
        }
        if($('#lab_coll_cd').val() != ''){
        	URL = URL + "&lab_coll_cd=" + $('#lab_coll_cd').val();
        }
        if($('#search_text').val() != ''){
        	URL = URL + "&SEARCH_TYPE=" + $('#search_type').val();
        	URL = URL + "&SEARCH_TEXT=" + $('#search_text').val();
        }
        
        
        location.href = URL;
	}
	
	function search_note(){
		URL = "note_list.do?PAGE=0&ITEM_COUNT=10";
		if($('#lab_prog_id').val() != ''){
        	URL = URL + "&lab_prog_id=" + $('#lab_prog_id').val();
        }
		if($('#lab_coll_cd').val() != ''){
        	URL = URL + "&lab_coll_cd=" + $('#lab_coll_cd').val();
        }
		if($('#search_text').val() != ''){
        	URL = URL + "&SEARCH_TYPE=" + $('#search_type').val();
        	URL = URL + "&SEARCH_TEXT=" + $('#search_text').val();
        }
		
		location.href = URL;
	}
	
	
	//학생연구역량평가
	function SrceDownBtn(){
		Swal.fire({
			title : '기수를 입력하여주세요.',
			input : 'number',
			inputAttributes: {
			    autocapitalize: 'off'
			  },
			  inputPlaceholder: '기수 입력.',
			  showCancelButton: true,
			  confirmButtonText: 'Down',
			  cancelButtonText: 'No',
			  showLoaderOnConfirm: true,
			  allowOutsideClick: () => !Swal.isLoading()
			}).then((result) => {
				if(result.isConfirmed){
					result.value = Number(result.value);
					result.value = result.value + 2;
					console.log(result.value);
				  	SrceAllDown(result.value);		
				}
			
			})
	}
	
	//Srce Down
	function SrceAllDown(ProgNum){
		
		setCookie("fileDownload" , "false");
		
		LoadingStart();
		downloadTimer = setInterval(function(){
		
			var token = getCookie("fileDownload");
			if(token == "true"){
				CloseBar();
			}
			
		} , 1000);
		
		location.href='${pageContext.request.contextPath}/admin/team/SrceAllExcelDown.do?ProgNum='+ProgNum+'';
		
		 /* $.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/admin/team/SrceAllExcelDown.do?ProgNum='+ProgNum+'',
			cache : true,
			success : function(status , xhr){
					
				LoadingStop()
				
			}
			
		}) */
		
		
	}
	
	//Record
	function RecordDownBtn(){
		Swal.fire({
			title : '기수를 입력하여주세요.',
			html : 
				'<input id="swal-input1" class="swal2-input">' +
				'<input id="swal-input2" class="swal2-input">' +
				'<input id="swal-input3" class="swal2-input">',
			inputAttributes: {
			    autocapitalize: 'off'
			  },
			  showCancelButton: true,
			  confirmButtonText: 'Down',
			  cancelButtonText: 'No',
			  showLoaderOnConfirm: true,
			  allowOutsideClick: () => !Swal.isLoading()
			}).then((result) => {
				if(result.isConfirmed){
					var ProgId = document.getElementById('swal-input1').value;
					var StratTM = document.getElementById('swal-input2').value;
					var EndTM = document.getElementById('swal-input3').value;
					
					RecordAllDown(ProgId,StratTM, EndTM);	
				}
		
			})
	}
	
	//Record Down
	function RecordAllDown(ProgId , StratTM , EndTM){
		
		setCookie("fileDownload" , "false");
		
		LoadingStart();
		downloadTimer = setInterval(function(){
		
			var token = getCookie("fileDownload");
			if(token == "true"){
				CloseBar();
			}
			
		} , 1000);
		
		
		location.href='${pageContext.request.contextPath}/admin/team/reCordAllExcelDown.do?ProgId='+ProgId+'&StartTM='+StratTM+'&EndTM='+EndTM+'';
		
		 /* $.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/admin/team/reCordAllExcelDown.do?ProgId='+ProgId+'&StartTM='+StratTM+'&EndTM='+EndTM+'',
			cache : true,
			success : function(status , xhr){
					
				
				
				
			}
			
		}) */
		
		
	}
	
	
	
	function ExploringDownBtn(){
		Swal.fire({
			title : '기수를 입력하여주세요.',
			html : 
				'<input id="swal-input1" class="swal2-input">' +
				'<input id="swal-input2" class="swal2-input">' +
				'<input id="swal-input3" class="swal2-input">',
			inputAttributes: {
			    autocapitalize: 'off'
			  },
			  showCancelButton: true,
			  confirmButtonText: 'Down',
			  cancelButtonText: 'No',
			  showLoaderOnConfirm: true,
			  allowOutsideClick: () => !Swal.isLoading()
			}).then((result) => {
				if(result.isConfirmed){
					var ProgId = document.getElementById('swal-input1').value;
					var StratTM = document.getElementById('swal-input2').value;
					var EndTM = document.getElementById('swal-input3').value;
					
					ExploringAllDown(ProgId,StratTM, EndTM);	
				}
		
			})
	}
	
	function ExploringAllDown(ProgId,StratTM, EndTM){
		setCookie("fileDownload" , "false");
		
		LoadingStart();
		downloadTimer = setInterval(function(){
		
			var token = getCookie("fileDownload");
			if(token == "true"){
				CloseBar();
			}
			
		} , 1000);
		
		
		location.href='${pageContext.request.contextPath}/admin/team/exploringAllExcelDown.do?ProgId='+ProgId+'&StartTM='+StratTM+'&EndTM='+EndTM+'';
	}
	
	
	function setCookie(c_name,value){
		var date = new Date(1000);
		document.cookie = encodeURIComponent("fileDownload") + "=deleted; expires=" + new Date( 0 ).toUTCString();
	}
	
	function getCookie(name) {
		  var parts = document.cookie.split(name + "=");
		  if (parts.length == 2) {
			  return parts.pop().split(";").shift();
		  }
		}
		 
	var downloadTimer;
	
	function CloseBar(){
		LoadingStop();
		clearInterval(downloadTimer);
	}
	
	//All Download
	function TotalDownBtn(){
		LoadingStart();
		setTimeout('LoadingStop()' , 3000);
		
	}
	
	
	//로딩 함수
	function LoadingStart(){
		var gif= '/resources/img/Spinner.svg'
		var maskHeight = $(document).height(); 
		var maskWidth  = window.document.body.clientWidth;
		var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
		var ImgBox = "<div id='ImgBox' style='display:grid;place-items:center;min-height:100vh;'></div>"
		var loadingImg = ''; 
		loadingImg += " <img src='"+ gif + "' style='position: absolute; display: block; margin: 0px auto;'/>"; 
		$('body').append(mask)
		$('#mask').append(ImgBox)
		$('#mask').css({            'width' : maskWidth,            'height': maskHeight,            'opacity' : '0.3'    });
		$('#mask').show();
		$('#ImgBox').append(loadingImg);  
		$('#ImgBox').show();
	}
	
	//로딩 멈추기
	function LoadingStop(){
		$('#mask , #ImgBox').hide();
		$('#mask , #ImgBox').remove();
		
		
	}
	
</script>
<!-- js 끝 -->