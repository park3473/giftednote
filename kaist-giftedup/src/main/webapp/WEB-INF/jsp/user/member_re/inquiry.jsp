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
                                    <p>학생 지원서 조회</p>
                                </div>
                                <p>신입생지원 신청을 한 학생만 조회 이용이 가능합니다.</p>

                                <div class="login_form">
                                    <ul class="check_box">
                                        <li class="check_ob">
                                            <input type="radio" id="student_check" name="check_view" checked>
                                            <label for="student_check">학생</label>
                                        </li>
                                        <li class="check_ob">
                                            <input type="radio" name="check_view" id="mentor_check">
                                            <label for="check_view">멘토교사</label>
                                        </li>
                                    </ul>
                                    <form id="student_view" class="view_form" method="post" name="student_view" action="./view.do?">
                                        <div class="form_con login_input_wrap">
                                            <div class="form_size">
                                                <div class="input_ob id_ob">
                                                    <span>학생이름</span>
                                                    <input type="text" id="STUDENT_NAME" class="student_name" name="NAME" placeholder="이름을 입력해주세요.">
                                                    <label class="blind" for="STUDENT_NAME">학생이름</label>
                                                </div>
                                                <div class="input_ob pw_ob">
                                                    <span>비밀번호</span>
                                                    <input type="text" id="STUDENT_PASSWORD" class="student_pass" name="PASSWORD" placeholder="비밀번호 6자리를 입력해주세요.">
                                                    <label class="blind" for="STUDENT_PASSWORD">비밀번호</label>
                                                </div>
                                            </div>
                                            <div class="form_btn login_btn">
                                                <button type="button" onclick="javascript:student()">조회</button>
                                            </div>
                                        </div>

                                        <div class="form_con password_find_wrap">
                                            <div class="form_size" style="width: 100%;">
                                                <p>※ 문자로 받은 비밀번호 6자리를 입력해 조회해주세요.</p>
                                            </div>
                                        </div>
                                    </form>
                                    <form id="mentor_view" class="view_form" method="post" name="mentor_view" action="./view.do?" style="display:none;">
                                        <div class="form_con login_input_wrap">
                                            <div class="form_size">
                                                <div class="input_ob id_ob">
                                                    <span>학생이름</span>
                                                    <input type="text" id="MENTOR_NAME" name="NAME" placeholder="이름을 입력해주세요.">
                                                    <label class="blind" for="MENTOR_NAME">학생이름</label>
                                                </div>
                                                <div class="input_ob pw_ob">
                                                    <span>비밀번호</span>
                                                    <input type="text" id="MENTOR_PASSWORD" name="TEACHER_PASS" placeholder="임시 비밀번호를 입력해주세요.">
                                                    <label class="blind" for="MENTOR_PASSWORD">임시비밀번호</label>
                                                </div>
                                            </div>
                                            <div class="form_btn login_btn">
                                                <button type="button" onclick="javascript:mentor()">조회</button>
                                            </div>
                                        </div>

                                        <div class="form_con password_find_wrap">
                                            <div class="form_size" style="width: 100%;">
                                                <p>※ 문자로 받은 임시비밀번호를 입력해 조회해주세요.</p>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="phone_login_wrap">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>합격자 조회</p>
                                </div>
                                <p>신입생 합격 발표 조회입니다. 아래 이름과 생년월일을 입력해 조회해주세요.</p>

                                <div class="login_form">
                                    <form id="pass_check" class="pass_check" method="post" name="pass_check" action="./pass_check.do?">
                                        <div class="form_con login_input_wrap">
                                            <div class="form_size">
                                                <div class="input_ob phone_ob">
                                                    <span>학생이름</span>
                                                    <input type="text" id="PASS_NAME" name="NAME" placeholder="성명을 입력해주세요.">
                                                    <label class="blind" for="PASS_NAME">학생이름</label>
                                                </div>
                                                <div class="input_ob name_ob">
                                                    <span>비밀번호</span>
                                                    <input type="text" id="PASS_PASSWORD" name="PASSWORD" placeholder="비밀번호 6자리">
                                                    <label class="blind" for="PASS_PASSWORD">비밀번호</label>
                                                </div>
                                            </div>
                                            <div class="form_btn login_btn">
                                                <button type="button" onclick="javascript:passcheck()">조회</button>
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


    <!--합격모달-->
    <div id="PASS_MODAL" class="pass_modal">
        <div class="pass_modal_size">
            <div class="pass_bg">
                <img src="${pageContext.request.contextPath}/resources/img/pass_bg.png" alt="합격자창" />
            </div>
            <div class="pass_close">
                <a href="#">
                    <i class="las la-times"></i>
                </a>
            </div>
            <div class="pass_contents">
                <div class="pass_name">
                    <h2>축하합니다</h2>
                    <!--
                    <h2 id="pass_name_val"></h2>
                    -->
                </div>
                <div class="pass_txt">
                    <p>영재키움 프로젝트 신입생 선발에 합격하셨습니다. <br>향후 일정은 홈페이지 공지사항을 참고해주시기 바랍니다.<br> 감사합니다.</p>
                    <!--
                    <div class="pass_stemp">
                        <img src="${pageContext.request.contextPath}/resources/img/pass_stemp.png" alt="도장" />
                    </div>
                    -->
                </div>
            </div>
        </div>
    </div>
    <!--합격모달 end-->

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <%@ include file="../include/footerJs.jsp" %>

</body>

</html>

<script type="text/javascript">
	//학생 조회
	$('#STUDENT_PASSWORD').keydown(function() {
    	if (event.keyCode === 13) {
        	student();
        	event.preventDefault();
    	};
	});
	//멘토 조회
	$('#MENTOR_PASSWORD').keydown(function() {
    	if (event.keyCode === 13) {
        	mentor();
        	event.preventDefault();
    	};
	});
	//합격자 조회
	$('#PASS_PASSWORD').keydown(function(){
		if(event.keyCode === 13){
			passcheck();
			event.preventDefault();
		};
	})
	

	$("#PASS_MODAL").hide();
    $(".pass_close").click(function(){
        $("#PASS_MODAL").hide();
    });
    
    if ('${view_check}' == '조회실패') {
        alert("이름과 생년월일을 다시 확인하여 주세요.");
    }


    $("#student_check").click(function() {
        $('#student_view').show();
        $('#mentor_view').hide();
    });

    $("#mentor_check").click(function() {
        $('#mentor_view').show();
        $('#student_view').hide();
    });

    if ('${model.rtn.RESULT}' == 'wating') {
        alert("아직 합격 여부 대기중입니다.");
    } else if ('${model.rtn.RESULT}' == 'pass') {
        alert("축하합니다! 합격하셨습니다.");
    } else if ('${model.rtn.RESULT}' == 'fail') {
        alert("아쉽지만 탈락하셨습니다.");
    } else if ('${model.rtn.RESULT}' == 'nomento') {
        alert("아직 멘토 지원서가 등록되지 않았습니다.");
    }


    function student() {
        if ($('#STUDENT_NAME').val() == '') {
            alert("이름을 입력해주세요.");
            return;
        } else if ($('#STUDENT_PASSWORD').val() == '') {
            alert("생년월일을 입력해주세요.");
            return;
        }
        $('#student_view').submit();
    }

    function mentor() {
        if ($('#MENTOR_NAME').val() == '') {
            alert("학생이름을 입력해주세요.");
            return;
        } else if ($('#MENTOR_PASSWORD').val() == '') {
            alert("비밀번호를 입력해주세요.");
            return;
        }
        $('#mentor_view').submit();
    }

    /*
    function passcheck(){
    if($('#PASS_NAME').val() == ''){
    alert("이름을 입력해주세요.");
    return
    }else if($('#PASS_PASSWORD').val() == ''){
    alert("생년월일을 입력해주세요.");
    return
    }
    $('#pass_check').submit();
    }
    */

    function passcheck() {
        if ($('#PASS_NAME').val() == '') {
            alert("이름을 입력해주세요.");
            return;
        } else if ($('#PASS_PASSWORD').val() == '') {
            alert("생년월일을 입력해주세요.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "./pass_check.do?",
            cache: false,
            data: ({
                NAME: $('#PASS_NAME').val(),
                PASSWORD: $('#PASS_PASSWORD').val()
            }),
            dataType: "text",
            success: function(data, status, xhr) {
                console.log(data);
                var data_list = data.split(",");
                if (data_list[0] == 'wating') {
                    alert("아직 합격 여부 대기중입니다.");
                } else if (data_list[0] == 'pass') {
                	$("#PASS_MODAL").show();
                	document.getElementById('pass_name_val').innerText = data_list[1] + '학생';
                } else if (data_list[0] == 'fail') {
                	alert('불합격하였습니다.\n영재키움 프로젝트 신입생 선발에 지원해주셔서 감사하며,\n합격 소식을 전해주지 못한 점 양해부탁드립니다.감사합니다.')
                } else if (data_list[0] == 'no_mento') {
                    alert("아직 멘토 지원서가 등록되지 않았습니다.")
                }else{
                	alert('이름과 생년월일을 다시한번 확인하여 주세요.')
                }
            },
            error: function(xhr, status, error) {
                if (xhr.status == 404) {
                    alert("오류!!");
                }
            }
        });
    }

</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
