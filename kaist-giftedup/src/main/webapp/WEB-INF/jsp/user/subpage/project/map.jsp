<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
    <section id="new_sub" class="sub_wrap">
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
                        <div class="map">
                            <iframe title="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3211.707609094278!2d127.39651041566114!3d36.39207169826564!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356549e5fde31e29%3A0x65bf2de7ed4fe983!2z64yA7KCE6rSR7Jet7IucIOycoOyEseq1rCDsoITrr7zrj5kg66y47KeA66GcIDE5Mw!5e0!3m2!1sko!2skr!4v1572999660173!5m2!1sko!2skr" width="100%" height="500" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                        </div>
                        <ul class="map_txt">
                            <li class="title">
                                <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                <p>주소 및 연락처</p>
                            </li>
                            <li class="txt">
                                <p>
                                    주소 : (34051) 대전광역시 유성구 문지로 193번지 (문지동 103-6) KAIST 문지캠퍼스 학부동 F618호
                                </p>
                                <p>
                                    전화번호 : 042-350-6227
                                </p>
                                <p>
                                    팩스번호 : 042-350-6224
                                </p>
                                <p>
                                    전자우편 : giftedup@kaist.ac.kr
                                </p>
                            </li>
                        </ul>
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