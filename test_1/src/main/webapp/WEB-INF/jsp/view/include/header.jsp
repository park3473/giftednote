
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title><spring:message code="header.TITLE"/></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta property="og:image" content="${pageContext.request.contextPath}/resources/img/kakao_bg.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.full.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!--CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tail.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
<!-- fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- fontawasome/lineawasome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawasome/all.css">
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<!--공통상단 끝-->


<style type="text/css">
	.material-icons{
			display:block;
			position:fixed;
			top:95%;
			left:50%;
			z-index:9999;
		}
</style>
</head>
<body>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script src="${pageContext.request.contextPath}/resources/js/gtag.js"></script>
<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-163568943-1"></script> -->
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-163568943-1');
</script>
<script>

</script>
<!-- 내정보 -->
<div style="display:none">
	<c:if test="${session_login == 'ok'}">
		<div>
			<p>${session_email}</p>
			<p>${session_idx }</p>
			<p>${session_name }</p>
			<p>${session_level }</p>
		</div>
		<div>
			<button onclick="location.href='/user/member/logout.do'">로그아웃</button>
		</div>
	</c:if>
	<!-- 내정보 -->
	<div>
		<button onclick="javascript:history.back()">뒤로가기</button>
		<button onclick="location.href='/'">홈</button>
	</div>
	<div>
		<div>
			<ul>
				<li>톱니</li>
				<li>노트</li>
				<li>사람</li>
				<li></li>
			</ul>
		</div>
	</div>
</div>
<header id="new_hd" class="hd_wrap">
        <div class="hd_area">
            <div class="hd_con">
                <div class="hd_size">
                    <div class="menu_bar">
                        <ul class="main_menu">
                            <li class="main_menu_ob main_menu_ob_01 menu_active">
                                <a href="#"></a>
                                <div class="sub_menu_con">
                                    <div class="sub_menu_title">
                                        <h2>회의관리</h2>
                                    </div>
                                    <ul class="sub_menu_box">
                                        <li class="sub_menu_ob">
                                            <a onclick="alert('아직 경로 설정 미지정')">진행중인 노트</a>
                                        </li>
                                        <li class="sub_menu_ob">
                                            <a onclick="alert('아직 경로 설정 미지정')">마감된 노트</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="main_menu_ob main_menu_ob_02">
                                <a onclick="alert('아직 경로 설정 미지정')"></a>
                                <div class="sub_menu_con">
                                    <div class="sub_menu_title">
                                        <h2>회원관리</h2>
                                    </div>
                                    <ul class="sub_menu_box">
                                        <li class="sub_menu_ob">
                                            <a onclick="alert('아직 경로 설정 미지정')">회원정보</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="menu_cont">
                        <div class="menu_cont_box">
                            <div class="logo_box">
                                <a href="${pageContext.request.contextPath}/"></a>
                                <p>카이스트 <span>연구노트</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <script type="text/javascript">
    $(function () {
	    $('a[href="#"]').click(function (e) {
	        e.preventDefault();
	    });

	    function menu() {
	        $(".main_menu_ob_01").find(".sub_menu_con").show();

	        $(".main_menu_ob").click(function () {
	            $(".sub_menu_con").hide();
	            $(".main_menu_ob").removeClass("menu_active");
	            $(this).find(".sub_menu_con").show();
	            $(this).addClass("menu_active");
	        });
	    }
	    menu();

	    // 과제선택
	    $(".subject_list > li > a").click(function () {
	        $(this).toggleClass("select_active");
	    });
	    // 과제선택 end
	});
    </script>
