<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/detail.css" type="text/css">
<!--삭제금지-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/config.js"></script>
<script type="text/javascript">
    // ckeditor setting
    var ckeditor_config = {
        allowedContent : true,
        resize_enabled : false, // 에디터 크기를 조절하지 않음
        enterMode : CKEDITOR.ENTER_BR, // 엔터키를 <br> 로 적용함.
        shiftEnterMode : CKEDITOR.ENTER_P, // 쉬프트 +  엔터를 <p> 로 적용함.
        toolbarCanCollapse : true,
        //removePlugins : "elementspath", // DOM 출력하지 않음                        
        filebrowserUploadUrl : '${pageContext.request.contextPath}/ckeditor/file_upload.do', // 파일 업로드를 처리 할 경로 설정.
        height : '500px',
        startupFocus : false,
        // 에디터에 사용할 기능들 정의
        toolbar : [
            [  'Source','Youtube', 'Preview' ],
            [ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
            [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript' ],
            ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
            [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ], '/',
            ['Image','Link','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
            ['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Maximize', 'ShowBlocks','-'],
            [ 'About'  ] ]
    };

    var editor = null;

    jQuery(function() {
        // ckeditor 적용
        editor = CKEDITOR.replace("ckeditor", ckeditor_config);
    });

    //CKEDITOR.config.resize_maxHeight=500;
    CKEDITOR.config.extraPlugins='youtube';
    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;

        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
    
    //CKEDITOR.replace('editor',{
    	//contentsCss: '${pageContext.request.contextPath}/ckeditor/test.css'
    //});
    //CKEDITOR.config.contentsCss = '${pageContext.request.contextPath}/resources/css/startupTemplate.css';
</script>
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
    .ck-editor_editable{
    	max-height:400px !important; 
    }

</style>
<section id="new_sc" class="sc_wrap">
        <div class="sc_area">
            <div class="sc_con">
                <div class="sc_size">

                    <!-- 공통 탑 -->
                    <%@ include file="../include/top.jsp" %>
                    <!-- 공통 탑 end-->

                    <!-- 본문 내용-->
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>노트</li>
                                    <li>연구노트</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>연구노트</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
                                    <!-- 양식 리스트 -->
                                    <div id="detail_modal">
                                    	<ul id="detail_modal_ul">
                                    		<li class="detail_modal_li">
												<ul>
												<c:forEach var="i" begin="1" end="${model.Pagecount}" varStatus="count">
											    	<li id="deatil_page_list" onclick="javascript:content(${count.index})" class="page${count.index} allpage <c:if test="${count.index == '1' }">PageActive</c:if>">${count.index}<span>Page</span></li>
												</c:forEach>
													<li class="detail_page_up" ><button onclick="javascript:PageUp()">페이지 추가</button></li>
													<li class="detail_page_up"><button id="insert_bt" onclick="javascript:content_insert()" P_IDX="1">페이지 저장</button></li>
												</ul>
												<ul style="display:none">
													<li>${model.list[0].P_IDX }</li>
													<li id="lab_id" value="${model.lab_id}">${model.lab_id }</li>
													<li id="CONTENT" content="${model.list[0].CONTENT }">${model.list[0].CONTENT }</li>
												</ul>
                                    		</li>
                                    		<li class="detail_modal_li">
                                    			<div>
													<div id="cke">
														<textarea name="CONTENT" id="ckeditor">
															${model.list[0].CONTENT }
														</textarea>
													</div>
												</div>
                                    		</li>
                                    		<!-- 
                                    		07 - 26 댓글 기능 삭제
                                    		<li class="detail_modal_li" style="margin-left:2rem">
                                    			<div>
                                    				<p>댓글</p>
                                    			</div>
                                    			<div>
													<c:forEach var="colist" items="${model.colist}" varStatus="var">
													<div class="colist_view">
														<p style="display:none" id="${colist.C_IDX }_conid">${colist.N_IDX }</p>
														<p style="display:none" id="${colist.C_IDX }_coid">${colist.IDX }</p>
														<p id="${colist.C_IDX }_cona">${colist.NAME }</p>
														<p id="${colist.C_IDX }_cocom" >${colist.CONTENT }</p>
														<ul class="colist_ul">
															<li id="colist_co_up" class="colist_bt"><p onclick="javascript:comment_up(${colist.C_IDX})">수정 버튼</p></li>
															<li id="colist_co_de" class="colist_bt"><p onclick="javascript:comment_delete(${colist.C_IDX})">삭제 버튼</p></li>
														</ul>
													</div>
													</c:forEach>
												</div>
												<div id="comment">
													<ul>
														<li><input type="text" name="comment_set" id="comment_set"></li>
														<li><button onclick="javascript:comment_set()">댓글 전송</button></li>
													</ul>
												</div>
                                    		</li>
                                    		-->
                                    	</ul>
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

	

	$(document).ready(function(){
		var ss = $('.ck-editor_editable').offsetHeight;
		
		console.log(ss);
		
		
		if($('.ck-editor_editable').offsetHeight > 740){
			alert('더이상 작성할수 없습니다.');
			return false;
		}
	})
	
	
	function content(P_IDX){
		var lab_id = $('#lab_id').val();
		$.ajax({
			type : "POST",
			url : "/user/note/detail.do?",
			cache : false,
			data : ({
				P_IDX : P_IDX,
				lab_id : lab_id,
			}),
			dataType : "json",
			success: function(data , status, xhr){
				console.log(data);
				var view = data[0].CONTENT;
				//alert(view);
				var editor = CKEDITOR.instances.ckeditor;
				editor.setData(view);
				$('#insert_bt').attr('P_IDX',P_IDX);
				$('.allpage').removeClass('PageActive')
				$('.page'+P_IDX+'').addClass('PageActive');
				}
		})
	};
	
	function content_insert(){
		var editor = CKEDITOR.instances.ckeditor;
		var CONTENT = editor.getData();
		var P_IDX = $('#insert_bt').attr('P_IDX');
		var lab_id = $('#lab_id').val();
		$.ajax({
			type : "POST",
			url : "/user/note/detail_update.do?",
			cache : false,
			data : ({
				CONTENT : CONTENT,
				lab_id : lab_id,
				P_IDX : P_IDX,
			}),
			dataType : "json",
			success: function(data , status, xhr){
				console.log(status);
				console.log(data);
			}
		})
		Swal.fire({
			  text: ""+P_IDX+"페이지가 저장되었습니다!!",
			  icon: 'success',
			  showCancelButton: false,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: 'Yes!'
			}).then(function(result) {
			  if (result.isConfirmed) {
					location.reload();
			  }
			})
		//alert('수정 완료!');
	}
	
	function PageUp(){
		var P_IDX = ${model.Pagecount + 1};
		var lab_id = $('#lab_id').val();
		var CONTENT = '';
		$.ajax({
			type : "POST",
			url : "/user/note/detail_insert.do?",
			cache : false,
			data : ({
				CONTENT : CONTENT,
				lab_id : lab_id,
				P_IDX : P_IDX,
			}),
			dataType : "json",
			success: function(data , status, xhr){
			}
		})
		Swal.fire({
			  text: "페이지가 추가되었습니다!",
			  icon: 'success',
			  showCancelButton: false,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: 'Yes!'
			}).then(function(result) {
			  if (result.isConfirmed) {
					location.reload();
			  }
			})
	}
	
	
	// 07 - 26 코멘트 기능 삭제
	/*
	function comment_set(){
		var N_IDX = $('#N_IDX').val();
		var IDX = ${session_idx};
		var NAME = '${session_name}';
		var CONTENT = $('#comment_set').val();
		$.ajax({
			type : "POST",
			url : "/user/note/comment_set.do?",
			cache : false,
			data : ({
				CONTENT : CONTENT ,
				N_IDX : N_IDX,
				IDX : IDX,
				NAME : NAME
			}),
			dataType: "json",
			success : function(data,status,xhr){
				
			}
		})
		Swal.fire({
			  text: "댓글을 등록하였습니다.",
			  icon: 'success',
			  showCancelButton: false,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: 'Yes!'
			}).then(function(result) {
			  if (result.isConfirmed) {
					location.reload();
			  }
			})
	}
	
	function comment_up(c_idx){
		var comment = document.getElementById(c_idx+'_cocom').innerText;
		var c_idx = c_idx;
		var html = '';
		html += '<input type="text" name="comment_update" id="comment_update" value="'+comment+'">';
		html += '<button onclick="javascript:comment_update('+c_idx+')">댓글 수정</button>';
		//console.log(html);
		$('#comment').html(html);
	}
	
	function comment_update(c_idx){
		var C_IDX = c_idx;
		var CONTENT = $('#comment_update').val();
		$.ajax({
			type : "POST",
			url : "/user/note/comment_update.do?",
			cache : false,
			data : ({
				CONTENT : CONTENT ,
				C_IDX : C_IDX,
			}),
			dataType: "json",
			success : function(data,status,xhr){
				
			}
		})
		history.go(0);
	}
	
	function comment_delete(c_idx){
		Swal.fire({
			  text: "댓글을 삭제하시겠습니까?",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제!',
			  cancelButtonText: '아니요',
			}).then(function(result) {
			  if (result.isConfirmed) {
				  var C_IDX = c_idx;
				  $.ajax({
						type : "POST",
						url : "/user/note/comment_delete.do?",
						cache : false,
						data : ({
							C_IDX : C_IDX,
						}),
						dataType: "json",
						success : function(data,status,xhr){
								
						}
					})
				  history.go(0);
			  }
			})
	}
*/
</script>
<!-- js 끝 -->