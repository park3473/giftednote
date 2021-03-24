
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
<div id="new_hd_area" class="hd_area">
    <div id="new_hd_con" class="hd_con">
        <!--상단&중간 메뉴-->
        <div class="hd_size">

            <!--메인 메뉴-->
            <nav class="main_menu">
                <!--PC로고-->
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/index.do">
                        <div class="logo_img"></div>
                    </a>
                </div>
                <!--PC로고 end-->

                <!--메인메뉴-->
                <ul class="nav_main row float-xl-right">
                    <li class="col-sm-auto">
                        <a href="${pageContext.request.contextPath}/user/member/view.do">마이페이지</a>
                        <ul class="sub_main teacher">
                            <li><a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당 신청</a></li>
                        </ul>
                        <!--교사 서브메인 end -->
                    </li>
                </ul>
                <!--메인메뉴end-->
            </nav>
            <!--메인 메뉴 end-->

        </div>
        <!--상단&중간 메뉴 end-->

        <!--메뉴 bg-->
        <div class="menu_bg"></div>
        <div class="m_menu_bg"></div>
        <!--메뉴 bg end-->
    </div>
</div>
