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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <title>영재키움프로젝트</title>
</head>

<style>
    #new_sub_hd .title>p:first-of-type {
        display: none;
    }
</style>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../../include/header.jsp" %>
        <!-- 중단메뉴시작 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../../include/menu_sub.jsp" %>
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
                            <c:if test="${
                            fn:indexOf(requestURI, '/user/subpage/program/find/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/mentoring/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/4/') > -1
                            || fn:indexOf(requestURI, '/user/program/110/') > -1
                            || fn:indexOf(requestURI, '/user/program/111/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/patent/') > -1
                            || fn:indexOf(requestURI, '/user/program/105/') > -1}">
                            <h2>체험 진로탐색 프로그램</h2>
                            </c:if>
                        </div>
                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/find/') > -1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>

                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/find/') > -1}"><a href="${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do">또래 멘토링 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></c:if>
                                <!--
                                <ul>
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/find/') > -1}">
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/4/list.do">· 또래 멘토링</a></li>
                                </c:if>
                                </ul>
                                -->
                            </li>

                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/find/') > -1}">
                                <li>
                                    <a href="#" onclick="alert('페이지 준비중입니다.');return false;">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                            <!--<c:if test="${fn:indexOf(requestURI, '/subpage/program/find/') > -1}"><li><a href="${pageContext.request.contextPath}/user/program/110/list.do">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>-->
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/find/') > -1}">
                                <li>
                                    <a href="#" onclick="alert('페이지 준비중입니다.');return false;">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                            <!--<c:if test="${fn:indexOf(requestURI, '/subpage/program/find/') > -1}"><li><a href="${pageContext.request.contextPath}/user/program/111/list.do">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>-->
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/find/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/patent/index.do">발명 및 특허교육<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/subpage/program/find/') > -1}">
                                        <li><a href="${pageContext.request.contextPath}/user/program/105/list.do">· 발명 및 특허 교육 신청</a></li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="program_wrap">
                            <div class="program">
                                <div class="program_con">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>개요</p>
                                    </div>
                                    <ul class="txt career_txt nanumbarungothic">
                                        <li>
                                            <span class="span_wd" style="padding:0;">학생의 진로와 적성을 고려하여, 멘토교사와 학생이 함께 다양한 진로탐색 및 멘토링, 현장체험 학습 및 문화체험 등을 통해 자신의 진로 설계 및 탐색 기회 제공.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="program">
                                <div class="title">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" />
                                    </span>
                                    <p>진로탐색 체험 프로그램 주요 내용</p>
                                </div>
                                <ul class="txt career_txt nanumbarungothic ">
                                    <li class="pro_list_02">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>진로탐색 및 멘토링</p>
                                        <span>정부출연구소 견학, 대학생 멘토링 및 또래 멘토링으로 학생들의 맞춤형 진로탐색 및 멘토링 제공</span>
                                    </li>
                                    <li class="pro_list_02">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>현장체험학습</p>
                                        <span>미래 직업탐색 및 지역특화 산업현장 체험으로 학생들이 미래 직업을 실제로 체험할 수 있도록 기업체 방문과 산업현장 방문으로 운영</span>
                                    </li>
                                    <li class="pro_list_02">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>문화체험</p>
                                        <span>공연, 뮤지컬 관람이나 발명 및 특허교육과 같은 다양한 문화행사와 공개 교육을 학생과 멘토교사가 자율적으로 참여할 수 있는 기회 제공<br>
                                            <span class="orange_c">※ 중요! 2회 중 1회는 반드시 진로탐색 및 멘토링과 현장체험학습 프로그램 중에서 실시</span>
                                        </span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="program_wrap mr-t-50">
                            <div class="sub_page">
                                <div class="title">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" />
                                    </span>
                                    <p>체험 진로탐색 프로그램 예시</p>
                                </div>
                                <div class="sub_page">
                                    <table class="txt select_table select_tree">
                                        <caption class="blind">체험 진로탐색 프로그램 예시</caption>
                                        <tr>
                                            <th style="width:15%;">구분</th>
                                            <th style="width:30%;">프로그램</th>
                                            <th style="width:30%;">내용</th>
                                            <th style="width:15%;">장소</th>
                                        </tr>
                                        <tr>
                                            <td rowspan="3">진로탐색 및 멘토링</td>
                                            <td class="align_lt">1.정부출연 연구소 견학</td>
                                            <td class="align_lt">
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 정출연 견학</p>
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 최신 연구 동향 파악</p>
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 전문가와 진로멘토링</p>
                                            </td>
                                            <td>대덕특구 연구단지</td>
                                        </tr>
                                        <tr>
                                            <td class="align_lt">2.대학생 멘토링</td>
                                            <td class="align_lt">
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 대학 홍보 도우미와 함께 캠퍼스 투어</p>
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 대학 생활에 대한 안내 및 진로 멘토링</p>
                                            </td>
                                            <td>방문대학</td>
                                        </tr>
                                        <tr>
                                            <td class="align_lt">3.또래 멘토링</td>
                                            <td class="align_lt">
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 과학고/영재고/국제고/외고 학생들과의 멘토링</p>
                                            </td>
                                            <td>각학교</td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">현장체험학슴</td>
                                            <td class="align_lt">4.미래직업 체험</td>
                                            <td class="align_lt">
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 기업 탐방(LG, 한화, 구글, SK, 넷마블, MS 등)</p>
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 미래 직업 체험</p>
                                            </td>
                                            <td>방문기업</td>
                                        </tr>
                                        <tr>
                                            <td class="align_lt">5.지역특화 산업현장 체험</td>
                                            <td class="align_lt">
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 지역 특화 산업현장 체험</p>
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 미래 직업 체험</p>
                                            </td>
                                            <td>해당지역</td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">문화체험</td>
                                            <td class="align_lt">6.문화체험</td>
                                            <td class="align_lt">
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 뮤지컬, 영화관람, 스포츠 경기 관람 등</p>
                                            </td>
                                            <td>해당지역</td>
                                        </tr>
                                        <tr>
                                            <td class="align_lt">7.발명 및 특허교육</td>
                                            <td class="align_lt">
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> KAIST IP영재기업인 오픈 강좌 참여</p>
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 자율적 참여, 멘토교사 지도</p>
                                            </td>
                                            <td>IP영재기업인 홈페이지</td>
                                        </tr>
                                    </table>
                                </div>
                                <p class="blue_c">체험 진로탐색은 지역별 학교급에 따라 공동 운영 가능</p>
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