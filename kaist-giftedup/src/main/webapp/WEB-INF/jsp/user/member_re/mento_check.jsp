<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/terms.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/check_test.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
</head>
    
<style>
    #new_sub_hd .title>p:first-of-type {
        display: none;
    }
</style>
    
<body>

    <header id="new_hd" class="hd_wrap">
        <%@ include file="../include/header.jsp" %>

        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../include/menu_sub.jsp" %>
        </section>
    </header>

    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <h2>선발</h2>
                        </div>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/check.do">신입생지원 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/inquiry.do">지원서/합격자 조회 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->
                    
                    <!--신입생지원-->
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page_con">
                                <div class="sub_page">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>멘토교사지원 이용약관</p>
                                    </div>
                                    
                                    <!--이용약관 내용-->
                                    <div class="terms_wrap">
                                        <div class="terms_area">
                                            <div class="personal_wrap">
                                                <div class="title">
                                                    <h2>개인정보 수집·이용 동의</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공 받는 자</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ KAIST 과학영재교육연구원</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자의 개인정보 이용목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 사업 운영 및 지원</p>
                                                                <p>■ 연수 이수증 발급 및 연수결과 통보</p>
                                                                <p>■ 사업 운영 및 결과보고서 작성 사업관리</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 제공되는 개인정보의 항목</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ [필수항목] : 멘토교사명, 성별, 생년월일, 연락처, 학교 명, 이메일, 전공, 학생으로 추천하는 이유,  지원자 성장가능성 및 우수성</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는자의 개인정보 보유 및 이용기간</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 이용은 수집일로부터 사업 종료시 까지</p>
                                                                <p>■ 보유는 사업 종료 시부터 3년</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 수집 및 이용 거부에 따른 불이익 또는 제한사항</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재키움 프로젝트 참여 제한 및 연수 이수증 발급 불가</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join1" name="join1" onclick="javascript:all_check()">
                                                    </div>
                                                    <label for="join1">확인 및 동의합니다.</label>
                                                </div>
                                            </div>
                                            <div class="personal_wrap">
                                                <div class="title">
                                                    <h2>개인정보 제 3자 제공 동의</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공 받는 자(3자)</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 교육부, 시·도교육청</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공 받는 자(3자)의 개인정보 이용목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재키움 프로젝트 사업 관리 및 이수증 발급</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자(3자)에게 제공되는 개인정보의 항목</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ [필수항목] : 멘토교사명, 성별, 생년월일, 연락처, 학교 명, 이메일, 전공, 학생으로 추천하는 이유,  지원자 성장가능성 및 우수성</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는자(3자)의 개인정보 보유 및 이용기간</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 이용은 수집일로부터 사업 종료시 까지</p>
                                                                <p>■ 보유는 사업 종료 시부터 3년</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 3자 제공 동의 거부시 불이익 또는 제한사항</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재키움 프로젝트 참여 제한 및 연수 이수증 발급 불가</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join2" name="join2" onclick="javascript:all_check()">
                                                    </div>
                                                    <label for="join2">확인 및 동의합니다.</label>
                                                </div>
                                            </div>
                                            
                                            <div class="personal_wrap personal_wrap_auto">
                                                <ul class="personal_list">
                                                    <li>
                                                        <p>개인정보 제공자가 동의한 내용 외의 다른 목적으로 개인정보를 이용하지 않으며, 정보주체는 개인정보처리자(KAIST 과학영재교육연구원)에게 본인의 개인정보에 대한 열람, 정정, 삭제를 요구할 수 있습니다.</p>
                                                    </li>
                                                    <li>
                                                        <p>『개인정보 보호법 제15조(개인정보의 수집․이용), 제17조(개인정보의 제공), 제18조(개인정보의 이용․제공 제한), 제22조(동의를 받는 방법), 영재교육진흥법 제12조의3(교원의 교육 및 연수)』에 의거 개인정보 처리에 관하여 고지를 받았으며, 본인은 위와 같이 개인정보 수집 및 이용․제공에 동의합니다.</p>
                                                    </li>
                                                </ul>
                                            </div>
                                            
                                            <div class="all_check_box">
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join_all" onclick="checkAll(); " name="join_all">
                                                    </div>
                                                    <label for="join_all">모두 동의합니다.</label>
                                                </div>
                                            </div>
                                            
                                            <!--보드 검색_버튼-->
                                            <div class="board_btn_wrap">
                                                <div class="board_btn">
                                                    <a class="delete" href="#" onclick="goNext()">다음</a>
                                                </div>
                                            </div>
                                            <!--보드 검색_버튼 end-->
                                            
                                        </div>
                                    </div>
                                    <!--이용약관 내용 end-->
                                    
                                </div>
                            </div>
                        </div>
                    </nav>
                    <!--신입생지원 end-->
                    
                </div>
            </div>
        </div>
    </section>
    
    <!--주의 모달-->
    <div class="danger_modal_area">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>본 사이트는 <span>Chrome, Safari, Firefox 및 IE11</span> 이상의<br> 최신 브라우저에 최적화 되어있습니다.</h2>
                <p>HTML5, CSS3 기반으로 제작되어 IE9 버전 이하에서는 일부 기능이 정상적으로 작동하지 않을수 있습니다.</p>
                <p>최신 브라우저를 사용하지 않는 경우에 오류가 발생할 수 있으며, 오류 발생 시 서비스 지원할 수 없다는 점 양해 부탁드립니다.</p>
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <a onclick="$('.danger_modal_area').css('display','none'); $('.danger_bg').hide();">아니오</a>
                </li>
                <li class="danger_btn_02">
                    <a onclick="javascript:mento_all()">다음으로</a>
                </li>
            </ul>
        </div>
    </div>

	<form id="hidden_mentor" action="./mento_all.do?" method="post" name="hidden_mentor" >
     	<input type="hidden" name="NAME" id="NAME" value="${model.userMemberReVo.NAME}" >
     	<input type="hidden" name="TEACHER_PASS" id="TEACHER_PASS" value="${model.userMemberReVo.TEACHER_PASS }">
    </form>

    <div class="danger_bg"></div>
    <!--주의 모달 end-->
     
     
            
    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
        
    <%@ include file="../include/footerJs.jsp" %>
        
</body>
        
</html>
            
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
            
<script type="text/javascript">

    function goNext(){
        var form = document.memberForm;
        if($("input[name='join1']:checked").val() == "on" && $("input[name='join2']:checked").val() == "on"){
        	$('.danger_modal_area').css('display','block');
            $(".danger_bg").show();
        } else{
            alert("약관에 동의를 하셔야 합니다.");
            return false;
        }
    }

    function checkAll(){
        if($("input[name='join_all']").is(':checked') == true){
        	var check = $("input[name='join_all']").is(":checked");
            $("input[name='join1']").prop("checked", true);
            $("input[name='join2']").prop("checked", true);
//            $("input[name='join3']").attr("checked", check);
            $("input[name='join4']").prop("checked", true);
        }else{
        	var check = $("input[name='join_all']").is(":checked");
            $("input[name='join1']").prop("checked", false);
            $("input[name='join2']").prop("checked", false);
//            $("input[name='join3']").attr("checked", check);
            $("input[name='join4']").prop("checked", false);
        }
        
    }

    function all_check(){
        var check1 = $("input[name='join1']").is(":checked");
        var check2 = $("input[name='join2']").is(":checked");
//        var check3 = $("input[name='join3']").is(":checked");
        var check4 = $("input[name='join4']").is(":checked");

        if(check1 && check2 && check4){
            $("input[name='join_all']").attr("checked", true);
        }else{
            $("input[name='join_all']").attr("checked", false);
        }

    }
    
    
    function mento_all(){
		$('#hidden_mentor').submit();
	}

</script>