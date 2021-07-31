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
        color: #ffffff;
        text-decoration: none !important;
    }
    
    .tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-0pky{border-color:#3364b1;}
	
	.answer-complete{
		background: #009ca5;
	    color: #fff;
	    padding: 2px 4px;
	    border-radius: 2px;
	    font-size: 12px;
    }
    
    .answer-waiting{
    	background: #807d77;
	    color: #fff;
	    padding: 2px 4px;
	    border-radius: 2px;
	    font-size: 12px;
    }
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
                                        <h2>문의 작성</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
							        <div class="all_modal_con">
							            <div class="modal_box">
							
							                <div class="join_table">
							                    <div class="all_table all_table_2">
							                        <table class="all_table_box">
							                            <tbody>
							                                <tr>
							                                    <th>제목</th>
							                                    <td colspan="3">
							                                        <div class="input_size input_size_full">
							                                            <input type="text" id="TITLE" name="TITLE">
							                                        </div>
							                                    </td>
							                                </tr>
							                                <tr>
							                                    <th>설명</th>
							                                    <td colspan="3">
							                                        <div class="sort_select">
							                                            <div class="sort_textarea">
							                                                <textarea id="content"></textarea>
							                                            </div>
							                                        </div>
							                                    </td>
							                                </tr>
							                            </tbody>
							                        </table>
							                    </div>
							                    <div class="join_submit_btn">
							                        <ul class="join_btn">
							                            <li class="submit_btn">
							                                <button>저장</button>
							                            </li>
							                            <li class="cancel_btn">
							                                <button>취소</button>
							                            </li>
							                        </ul>
							                    </div>
							                </div>
							            </div>
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
	$('.cancel_btn').click(function(){
		history.go(-1);
	})
	
	
	$('.submit_btn').click(function(){
		var IDX = "${session_idx}";
		var CONTENT = $('#content').val()
		var TITLE = $('#TITLE').val();
		var NAME = "${session_name}";
		
		if(TITLE == ''){
			alert('제목을 입력하여주세요');
			$('#TITLE').focus();
			return;
		}else if(CONTENT == ''){
			alert('문의 내용을 작성하여주세요');
			$('#content').focus();
			return;
		}
		
		console.log(IDX);
		console.log(CONTENT);
		console.log(TITLE);
		$.ajax({
			type : "POST",
			url : "/user/member/inquiry_insert.do",
			cache : false,
			data : ({
                IDX : IDX,
                TITLE : TITLE,
                NAME : NAME,
                CONTENT : CONTENT,
			}),
			success : function(result) {
				location.href='${pageContext.request.contextPath}/user/member/inquiry.do?IDX=${session_idx}'
			}
		});
	})
	
	$.datetimepicker.setLocale('ko');
	jQuery('#UPDATE_BIRTH').datetimepicker({
		format : 'Y-m-d',
		lang : "ko",
		timepicker : false
	});

	
</script>
<!-- js 끝 -->