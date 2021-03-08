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
    <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1
                            || fn:indexOf(requestURI, '/user/program/102/') > -1}">
                                <h2>창의융합캠프</h2>
                            </c:if>
                        </div>
                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1}">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/camp/index.do">창의융합캠프 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1}">
                                <li><a href="${pageContext.request.contextPath}/user/program/102/list.do">창의융합캠프 신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="program_wrap">
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>개요</p>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>창의융합캠프는 영재키움 프로젝트에 참가하는 학생들이 방학 중 KAIST에 집합하여, 2박 3일간 협동학습을 통해 창의적 문제해결능력을 향상시키는 프로그램</p>
                                    </li>
                                </ul>
                            </div>
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>(일정) 여름방학 중 2박 3일</p>
                                </div>
                                <div class="table_wrap sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">여름방학 중 2박 3일</caption>
                                        <tr>
                                            <th>회차</th>
                                            <th>기간</th>
                                            <th>대상</th>
                                            <th>장소</th>
                                            <th>인원</th>
                                        </tr>
                                        <tr>
                                            <td>1차</td>
                                            <td>여름방학 중 2박 3일</td>
                                            <td>초등학생</td>
                                            <td>KAIST 본원</td>
                                            <td>약 250명</td>
                                        </tr>
                                        <tr>
                                            <td>2차</td>
                                            <td>여름방학 중 2박 3일</td>
                                            <td>중,고등학생</td>
                                            <td>KAIST 본원</td>
                                            <td>약 250명</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>교육내용</p>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>명사 특강, KAIST 대학생과 함께 하는 융합프로젝트 및 진로멘토링, 인문학 특강 등으로 구성</p>
                                        <ul class="intro_sub_txt">
                                            <li><span></span>(명사특강) 전문가에게 듣는 최첨단 과학기술의 세계 및 초청 특강</li>
                                            <li><span></span>(인문학) 전문 강사와 함께 하는 인문학 프로그램 및 토크콘서트</li>
                                            <li><span></span>(진로멘토링) KAIST 대학생 및 전문가와 함께 하는 진로 멘토링</li>
                                            <li><span></span>(융합과학 프로젝트) 담당 멘토 선생님과 함께하는 STEAM 프로젝트 수행 등</li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>운영방법</p>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>학교급별(1차 초등, 2차 중고등)로 구분하여 총 2회 실시, KAIST 대학생을 멘토로 지정 (멘토 1명당 학생 8~10명을 배정)하여 지도 및 운영 지원</p>
                                    </li>
                                </ul>
                            </div>
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>지원사항</p>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>권역별 버스 지원(일부지역 버스 지원 불가)</p>
                                    </li>
                                    <li>
                                        <p>학생만 참가하는 프로그램으로 멘토교사는 학생이 참가할 수 있도록 안내</p>
                                    </li>
                                </ul>
                            </div>
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>캠프 프로그램 예시</p>
                                </div>
                                <div class="table_wrap sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">캠프 프로그램 예시</caption>
                                        <tr>
                                            <th>시간</th>
                                            <th>1일차</th>
                                            <th>2일차</th>
                                            <th>3일차</th>
                                        </tr>
                                        <tr>
                                            <td>07:00 ~ 09:00</td>
                                            <td rowspan="2">대전 KAIST학생이동</td>
                                            <td>기상 및 아침식사</td>
                                            <td>기상 및 아침식사</td>
                                        </tr>
                                        <tr>
                                            <td>09:00 ~ 11:30</td>
                                            <td rowspan="2">인문학과의 만남</td>
                                            <td>도전골든벨</td>
                                        </tr>
                                        <tr>
                                            <td>11:30 ~ 12:30</td>
                                            <td>등록 및 멘토 배정</td>
                                            <td>설문조사 및 폐회</td>
                                        </tr>
                                        <tr>
                                            <td>12:30 ~ 13:30</td>
                                            <td>점심 식사</td>
                                            <td>점심 식사</td>
                                            <td>점심 식사</td>
                                        </tr>
                                        <tr>
                                            <td>13:30 ~ 14:00</td>
                                            <td>개회식 및 안전교육</td>
                                            <td rowspan="2">인문학 토크 콘서트</td>
                                            <td rowspan="8">귀가</td>
                                        </tr>
                                        <tr>
                                            <td>14:00 ~ 15:30</td>
                                            <td>Magic Science 특강</td>
                                        </tr>
                                        <tr>
                                            <td>15:30 ~ 17:00</td>
                                            <td>명사특강</td>
                                            <td rowspan="2">
                                                융합과학프로젝트(초,중등)<br>
                                                자기소개서 작성법(고등)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>17:00 ~ 17:30</td>
                                            <td rowspan="2">캠퍼스 투어</td>
                                        </tr>
                                        <tr>
                                            <td>17:30 ~ 18:00</td>
                                            <td rowspan="2">미식가 프로그램</td>
                                        </tr>
                                        <tr>
                                            <td>18:00 ~ 19:00</td>
                                            <td>저녁식사</td>
                                        </tr>
                                        <tr>
                                            <td>19:00 ~ 21:00</td>
                                            <td>KAIST 대학생 진로멘토링</td>
                                            <td>전문가 진로멘토링</td>
                                        </tr>
                                        <tr>
                                            <td>21:00 ~ 22:00</td>
                                            <td>숙소 이동 및 점호</td>
                                            <td>숙소 이동 및 점호</td>
                                        </tr>
                                    </table>
                                </div>
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