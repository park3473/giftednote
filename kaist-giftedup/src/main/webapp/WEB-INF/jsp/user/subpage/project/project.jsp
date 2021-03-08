<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE-EmulateIE7" />

    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!--부트스트랩 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" type="text/css">

    <!--JQuery-UI-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick-theme.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_01.css">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <title>영재키움프로젝트</title>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../../include/header.jsp" %>
        <!-- 중단메뉴시작 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="./menu_sub.jsp" %>
        </section>
        <!-- 중단메뉴종료 -->
    </header>


    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <h2>영재키움 프로젝트</h2>
                        </div>
                        <ul class="right_nav_area">
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/base/index.do">프로젝트 기본방향 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/program/index.do">주요 프로그램 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/project/index.do">사업추친 체계 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                            <!--<li><a href="${pageContext.request.contextPath}/user/subpage/project/faq/index.do">FAQ <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>-->
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/map/index.do">오시는길 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="group_01">
                            <div class="group_img">
                                <img src="${pageContext.request.contextPath}/resources/img/sub/group_01.png" alt="체계도">
                            </div>
                        </div>
                        <!-- 
                        <div class="group_02">
                            <div class="group_img">
                                <img src="${pageContext.request.contextPath}/resources/img/sub/group_02.png" alt="조직도">
                            </div>
                        </div>
                        -->
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../../include/footer.jsp" %>
    </footer>
    <%@ include file="../../include/footerJs.jsp" %>

</body>

</html>
