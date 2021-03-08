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
                                        <p>신입생지원 이용약관</p>
                                    </div>
                                    
                                    <!--이용약관 내용-->
                                    <div class="terms_wrap">
                                        <div class="terms_area">
                                            <div class="personal_wrap">
                                                <div class="title">
                                                    <h2>개인정보 수집·활용 동의 및 필수항목의 고지</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보의 수집·이용 목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재키움 프로젝트에서 이용자관리와 콘텐츠 서비스의 제공을 위해 아래와 같은 개인정보를 필수항목으로 수집하고 있습니다.</p>
                                                                <p>■ 아래 입력한 개인정보는 문의하신 사항에 답변하기 위한 용도로 수집·이용됩니다.</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 수집하는 개인정보의 항목</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ [필수항목] : 이름, 등</p>
                                                                <p>■ [선택항목] : 이메일 등</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 보유 및 이용기간 : 3년 또는 게시글 작성자가 삭제 시 까지</p>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 동의를 거부할 권리가 있다는 사실 및 동의 거부에 따른 불이익의 내용</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 선택항목은 필수 입력항목이 아니며 수집에 동의하지 않으면 글쓰기를 할 수 없습니다.</p>
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
                                                    <h2>학생 서약서</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보의 수집·이용 목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재키움 프로젝트에서 이용자관리와 콘텐츠 서비스의 제공을 위해 아래와 같은 개인정보를 필수항목으로 수집하고 있습니다.</p>
                                                                <p>■ 아래 입력한 개인정보는 문의하신 사항에 답변하기 위한 용도로 수집·이용됩니다.</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 수집하는 개인정보의 항목</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ [필수항목] : 이름, 등</p>
                                                                <p>■ [선택항목] : 이메일 등</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 보유 및 이용기간 : 3년 또는 게시글 작성자가 삭제 시 까지</p>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 동의를 거부할 권리가 있다는 사실 및 동의 거부에 따른 불이익의 내용</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 선택항목은 필수 입력항목이 아니며 수집에 동의하지 않으면 글쓰기를 할 수 없습니다.</p>
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
                                            <div class="personal_wrap">
                                                <div class="title">
                                                    <h2>학부모 서약서</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보의 수집·이용 목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재키움 프로젝트에서 이용자관리와 콘텐츠 서비스의 제공을 위해 아래와 같은 개인정보를 필수항목으로 수집하고 있습니다.</p>
                                                                <p>■ 아래 입력한 개인정보는 문의하신 사항에 답변하기 위한 용도로 수집·이용됩니다.</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 수집하는 개인정보의 항목</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ [필수항목] : 이름, 등</p>
                                                                <p>■ [선택항목] : 이메일 등</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 보유 및 이용기간 : 3년 또는 게시글 작성자가 삭제 시 까지</p>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 동의를 거부할 권리가 있다는 사실 및 동의 거부에 따른 불이익의 내용</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 선택항목은 필수 입력항목이 아니며 수집에 동의하지 않으면 글쓰기를 할 수 없습니다.</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join3" name="join3" onclick="javascript:all_check()">
                                                    </div>
                                                    <label for="join3">확인 및 동의합니다.</label>
                                                </div>
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
                    <a href="./insert.do">다음으로</a>
                </li>
            </ul>
        </div>
    </div>

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
        if($("input[name='join1']:checked").val() == "on" && $("input[name='join2']:checked").val() == "on" && $("input[name='join3']:checked").val() == "on"){
        	$('.danger_modal_area').css('display','block');
            $(".danger_bg").show();
        } else{
            alert("약관에 동의를 하셔야 합니다.");
            return false;
        }
    }

    function checkAll(){

        var check = $("input[name='join_all']").is(":checked");
        $("input[name='join1']").attr("checked", check);
        $("input[name='join2']").attr("checked", check);
        $("input[name='join3']").attr("checked", check);
        $("input[name='join4']").attr("checked", check);
    }

    function all_check(){
        var check1 = $("input[name='join1']").is(":checked");
        var check2 = $("input[name='join2']").is(":checked");
        var check3 = $("input[name='join3']").is(":checked");
        var check4 = $("input[name='join4']").is(":checked");

        if(check1 && check2 && check3 && check4){
            $("input[name='join_all']").attr("checked", true);
        }else{
            $("input[name='join_all']").attr("checked", false);
        }

    }

</script>