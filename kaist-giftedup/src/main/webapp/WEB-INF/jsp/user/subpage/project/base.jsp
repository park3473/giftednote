<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE-EmulateIE7" />

    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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

<body id="printme">
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
                        <div class="vision_goal">
                            <div class="vision">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>비전</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">환경에 관계없이 잠재력과 재능이 충분히 발휘될 수 있도록 적극적인 도움이 필요한 영재교육 대상자 선발 및 맞춤형 교육을 지원</p>
                                </div>
                            </div>
                            <div class="goal">
                                <div class="title">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" />
                                    </span>
                                    <p>목표</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">맞춤형 교육지원을 통한 영재교육 대상자의 잠재력 및 재능 계발</p>
                                </div>
                            </div>
                        </div>
                        <div class="list_oper">
                            <div class="oper_01">
                                <div class="title">
                                    <span>1</span>
                                    <p>맞춤형 영재교육 프로그램 운영</p>
                                </div>
                                <ul class="txt nanumbarungothic">
                                    <li>· 찾아가는 영재교육 프로그램 운영</li>
                                    <li>· 창의융합형 캠프</li>
                                    <li>· 체험·진로탐색 프로그램 운영</li>
                                </ul>
                            </div>
                            <div class="oper_02">
                                <div class="title">
                                    <span>2</span>
                                    <p>맞춤형 교육을 위한 멘토링 운영</p>
                                </div>
                                <ul class="txt nanumbarungothic">
                                    <li>· 교사-학생 일대일 멘토링 운영</li>
                                    <li>· 멘토교사 역량 강화</li>
                                    <li>· 중앙멘토링 컨설팅단 운영</li>
                                </ul>
                            </div>
                            <div class="oper_03">
                                <div class="title">
                                    <span>3</span>
                                    <p>교육성과 체계적 관리</p>
                                </div>
                                <ul class="txt nanumbarungothic">
                                    <li>· 개인별 포트폴리오</li>
                                    <li>· 교육 효과성 검증</li>
                                    <li>· 교사 관찰 기록</li>
                                </ul>
                            </div>
                            <div class="oper_04">
                                <div class="title">
                                    <span>4</span>
                                    <p>사업관리 및 성과 공유 체계 구축</p>
                                </div>
                                <ul class="txt nanumbarungothic">
                                    <li>· 사업의 효율적 관리를 위한 사업 관리 위원회 구성·운영</li>
                                    <li>· 사업성과 평가 및 공유·확산</li>
                                    <li>· 긍정적 인식 확산을 위한 홍보 활성화</li>
                                </ul>
                            </div>
                        </div>
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
