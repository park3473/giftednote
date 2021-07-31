<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
</head>

<style>
    #new_sub_hd .title>p:first-of-type {
        display: none;
    }
    
    .view_modal_tb{
    	border-collapse:collapse;border-spacing:0;text-align:left;
    }
    .view_modal_tb td{
    	border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px; overflow:hidden;padding:10px 5px;word-break:normal;
	 }
	.view_modal_tb th{
		border-color:black;border-style:solid;border-width:1px; font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;
	}
	#new_sub_con .login_wrap .login_form{
		margin-left:400px;
	}
	#new_sub_con .login_form .form_size .input_ob > span{
	width: 76px;
	padding-right:0px;
	}
	
	#new_sub_con .login_form .form_size .input_ob > input{
		width: calc(100% - 76px);
		padding-left : 10px;
	
	}

</style>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../include/header.jsp" %>

        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../include/menu_sub.jsp" %>
        </section>
    </header>

    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <nav class="sub_min_size" style="width: 100%;">
                        <div class="sub_page_wrap">
                            <div class="login_wrap">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>지원서 조회</p>
                                </div>
                                <p>신입생 지원후 24시간 이후에 조회가 정상적으로 가능합니다.</p>

                                <div class="login_form">
                                    <ul class="check_box">
                                        <li class="check_ob">
                                            <input type="radio" id="view_type_check_1" name="check_view" checked>
                                            <label for="student_check">유형1</label>
                                        </li>
                                        <li class="check_ob">
                                            <input type="radio" name="check_view" id="view_type_check_2">
                                            <label for="check_view">유형2</label>
                                        </li>
                                        <li class="check_ob">
                                            <input type="radio" name="check_view" id="view_type_check_3">
                                            <label for="check_view">유형3</label>
                                        </li>
                                    </ul>
                                    <form id="view_type_1" class="view_form" method="post" name="student_view" action="./view.do?">
                                        <div class="form_con login_input_wrap">
                                            <div class="form_size">
                                                <div class="input_ob id_ob">
                                                    <span>멘토교사명</span>
                                                    <input type="text" id="MENTO_NAME" class="student_name" name="TEACHER_NAME" placeholder="멘토교사명을 입력해주세요.">
                                                    <label class="blind" for="MENTO_NAME">멘토이름</label>
                                                </div>
                                                <div class="input_ob pw_ob">
                                                    <span>비밀번호</span>
                                                    <input type="text" id="PASSWORD" class="student_pass" name="TEACHER_PHONE" placeholder="010을 제외한 멘토의 핸드폰번호 입력해주세요.">
                                                    <label class="blind" for="PASSWORD">비밀번호</label>
                                                </div>
                                            </div>
                                            <div class="form_btn login_btn">
                                                <button type="button" onclick="javascript:view(1)">조회</button>
                                            </div>
                                        </div>
                                    </form>
                                    <form id="view_type_2" class="view_form" method="post" name="mentor_view" action="./view.do?" style="display:none;">
                                        <div class="form_con login_input_wrap">
                                            <div class="form_size">
                                                <div class="input_ob id_ob">
                                                    <span>학생이름</span>
                                                    <input type="text" id="STUDENT_NAME" name="STUDENT_NAME" placeholder="이름을 입력해주세요.">
                                                    <label class="blind" for="STUDENT_NAME">학생이름</label>
                                                </div>
                                                <div class="input_ob pw_ob">
                                                    <span>비밀번호</span>
                                                    <input type="text" id="PASSWORD" name="STUDENT_PHONE" placeholder="010을 제외한 학생의 핸드폰번호 입력해주세요.">
                                                    <label class="blind" for="PASSWORD">임시비밀번호</label>
                                                </div>
                                            </div>
                                            <div class="form_btn login_btn">
                                                <button type="button" onclick="javascript:view(2)">조회</button>
                                            </div>
                                        </div>
                                    </form>
                                    <form id="view_type_3" class="view_form" method="post" name="mentor_view" action="./view.do?" style="display:none;">
                                        <div class="form_con login_input_wrap">
                                            <div class="form_size">
                                                <div class="input_ob id_ob">
                                                    <span>멘토교사명</span>
                                                    <input type="text" id="TEACHER_NAME" name="TEACHER_NAME" placeholder="멘토교사명을 입력하여주세요.">
                                                    <label class="blind" for="MENTO_NAME">멘토이름</label>
                                                </div>
                                                <div class="input_ob pw_ob">
                                                    <span>비밀번호</span>
                                                    <input type="text" id="TEACHER_PHONE" name="TEACHER_PHONE" placeholder="010을 제외한 멘토의 핸드폰번호 입력해주세요.">
                                                    <label class="blind" for="MENTOR_PASSWORD">비밀번호</label>
                                                </div>
                                            </div>
                                            <div class="form_btn login_btn">
                                                <button type="button" onclick="javascript:view(3)">조회</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <!-- 합격자 조회 -->

                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <%@ include file="../include/footerJs.jsp" %>
	
	<!--주의 모달-->
    <div class="view_modal_area">
        <div class="view_modal_con">
            <div class="view_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="view_txt">
                <h2><span id="view_modal_span"></span>의 신입생 지원 정보</h2>
                <table class="view_modal_tb">
					<thead>
					  <tr>
					    <th>이름</th>
					    <th id="view_modal_tb_name"></th>
					  </tr>
					</thead>
					<tbody id="view_modal_tb_tb">
					  <tr>
					    <td>연락처</td>
					    <td  id="view_modal_tb_phone"></td>
					  </tr>
					  <tr>
					    <td>지원 자격</td>
					    <td  id="view_modal_tb_type"></td>
					  </tr>
					</tbody>
				</table>
            </div>
            <ul class="view_btn_box">
                <li class="view_btn_01">
                    <a onclick="javascript:view_modal_close();">OK!</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="view_bg"></div>
    <!--주의 모달 end-->
</body>

</html>

<script type="text/javascript">


    $("#view_type_check_1").click(function() {
    	$('#view_type_2').hide();
    	$('#view_type_3').hide();
        $('#view_type_1').show();
    });

	$("#view_type_check_2").click(function() {
    	$('#view_type_1').hide();
    	$('#view_type_3').hide();
        $('#view_type_2').show();
    });

	$("#view_type_check_3").click(function() {
    	$('#view_type_1').hide();
    	$('#view_type_2').hide();
        $('#view_type_3').show();
    });


    function view(e){
    	var return_val;
    	switch (e){
    	case 1 : 
    		if($("#view_type_"+e+" input[name=TEACHER_NAME]").val() == '' || $("#view_type_"+e+" input[name=TEACHER_PHONE]").val() == ''){
    			alert('이름과 비밀번호를 작성하여주세요.');
    			return_val = 1;
    		}
    		break;
    	case 2 :
    		if($("#view_type_"+e+" input[name=STUDENT_NAME]").val() == '' || $("#view_type_"+e+" input[name=STUDENT_PHONE]").val() == ''){
    			alert('이름과 비밀번호를 작성하여주세요.');
    			return_val = 1;
    		}
    		break;
    	case 3 :
    		if($("#view_type_"+e+" input[name=TEACHER_NAME]").val() == '' || $("#view_type_"+e+" input[name=TEACHER_PHONE]").val() == ''){
    			alert('이름과 비밀번호를 작성하여주세요.');
    			return_val =1;
    		}
    		break;
    	}
    	if(return_val == 1){
    		return;
    	}
    	var formData = $("#view_type_"+e).serialize();
    	formData = formData + "&VIEW_TYPE=" + e
    	console.log(formData);
    	 $.ajax({
             type: "POST",
             url: "./new_inquiry.do?",
             cache: false,
             data: formData,
             dataType: "json",
             success: function(data, status, xhr) {
            	 console.log(data.length)
            	 if(data.length > 0){
            		 if(e == '1'){
                    	 $('#view_modal_span').text(data[0].teacher_NAME+"멘토");
                    	 $('#view_modal_tb_name').html(data[0].teacher_NAME);
                    	 $('#view_modal_tb_phone').html(data[0].teacher_PHONE);
                    	 $('#view_modal_tb_type').html(data[0].type);
                    	 $('#view_modal_tb_tb').append('<tr class="tb_close"><td>담당 학생</td><td id="view_modal_tb_student_name">'+data[0].student_NAME+'</td></tr>');
                    	 $('#view_modal_tb_tb').append('<tr class="tb_close"><td>담당 학생 번호</td><td id="view_modal_tb_student_phone">'+data[0].student_PHONE+'</td></tr>')
                	 }else if(e == '2'){
                    	 $('#view_modal_span').text(data[0].student_NAME+"학생");
                    	 $('#view_modal_tb_name').html(data[0].student_NAME);
                    	 $('#view_modal_tb_phone').html(data[0].student_PHONE);
                    	 $('#view_modal_tb_type').html(data[0].type);
                	 }else if(e == '3'){
                		 $('#view_modal_span').text(data[0].teacher_NAME+"멘토");
                    	 $('#view_modal_tb_name').html(data[0].teacher_NAME);
                    	 $('#view_modal_tb_phone').html(data[0].teacher_PHONE);
                    	 $('#view_modal_tb_type').html(data[0].type);
                	 }
                	 $('.view_modal_area').show();
                	 $('.view_bg').show();
            	 }else{
            		 alert('이름과 비밀번호를 다시 확인하여 주세요.');
            	 }
             },
             error: function(xhr, status, error) {
                 if (xhr.status == 404) {
                     alert("이름과 비밀번호를 확인하여 주세요!!");
                 }
             }
         });
    	
    }
    
    function view_modal_close(){
    	$('.view_modal_area').css('display','none');
    	$('.view_bg').hide();
    	$('.tb_close').remove();
    }

</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
