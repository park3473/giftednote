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
                            fn:indexOf(requestURI, '/subpage/program/study/') > -1
                            || fn:indexOf(requestURI, '/notices_data/6/') > -1
                            || fn:indexOf(requestURI, '/program/104/') > -1
                            || fn:indexOf(requestURI, '/program/101/') > -1
                            || fn:indexOf(requestURI, '/notices_data/7/') > -1
                            || fn:indexOf(requestURI, '/notices_data/8/') > -1
                            || fn:indexOf(requestURI, '/notices_data/9/') > -1
                            || fn:indexOf(requestURI, '/notices_data/10/') > -1
                            || fn:indexOf(requestURI, 'user/mentoring/') > -1}">
                            <h2>찾아가는 영재교육 프로그램</h2>
                            </c:if>
                        </div>
                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/6/list.do">진로상담 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/program/101/list.do">융합과학 프로젝트 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}"><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">온라인학습멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}">
                                        <li><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">학습도전</a></li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}">
                                        <li><a href="${pageContext.request.contextPath}/user/notices_data/8/list.do">학습질문</a></li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}">
                                        <li><a href="${pageContext.request.contextPath}/user/notices_data/9/list.do">학습작품</a></li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}">
                                        <li><a href="${pageContext.request.contextPath}/user/notices_data/10/list.do">학습상담</a></li>
                                    </c:if>
                                </ul>
                            </li>
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/mentoring/list.do">전문가 멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->



                    <nav class="sub_min_size">
                        <div class="program_wrap">
                            <div class="program" style="width:100%;">
                                <div class="title">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" />
                                    </span>
                                    <p>프로그램별 주요 운영 방안</p>
                                </div>
                                <ul class="txt nanumbarungothic">
                                    <li class="pro_list">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>찾아가는 영재교육 프로그램</p>
                                        <span>멘토교사가 연간 교육계획서 작성(지도 및 멘토링)하고, KAIST 과학영재교육연구원에서 운영 지원. 고등학생의 경우는 코칭 프로그램과 팀 프로젝트로 운영</span>
                                    </li>
                                    <li class="pro_list">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>창의융합캠프</p>
                                        <span>2박 3일간 KAIST 집합 캠프, 1차는 초등대상, 2차는 중․고등학생 대상으로 운영. 고등학생의 경우 R&E 집중연구 예정</span>
                                    </li>
                                    <li class="pro_list">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>체험․진로탐색 프로그램</p>
                                        <span>멘토교사가 학생의 진로 적성을 파악하여 맞춤형 진로체험 및 문화체험 프로그램을 자율적으로 참여</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="program_wrap mr-t-50">
                            <div class="program">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>멘토교사와 학생이 함께하는 자기 설계 영재교육 프로그램</p>
                                </div>
                                <ul class="txt nanumbarungothic">
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>목적</p>
                                        <span>학생의 관심 분야 및 수준 등을 고려하여 멘토교사가 학생과 함께 자기설계 영재교육 프로그램 설계 및 운영</span>
                                    </li>
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>운영</p>
                                        <span>멘토교사 개별 운영 또는 영재교사연구회를 통해 공동 운영 가능</span>
                                    </li>
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>교육일정</p>
                                        <span>교육 일정(날짜와 시간 및 장소)은 학생과 멘토교사 자유롭게 정하여 교육에 참여함</span>
                                    </li>
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>교육내용</p>
                                        <span>학생-멘토교사 자기 설계 프로그램 운영, 학생의 특성, 흥미, 적성 등을 멘토교사가 파악한 후, 학생에게 맞춤형으로 영재교육 운영</span>
                                    </li>
                                    <div class="txt_ex">
                                        <p>※예시</p>
                                        <span>진로 및 학업 성향 검사 결과 상담(진로성향검사, 학업성향검사 등), 학습 멘토링(수학, 과학 심화 학습),정서 멘토링 융합과학 프로젝트 등(KAIST에서 프로그램 제공 가능)</span>
                                    </div>
                                </ul>
                                <!-- 
                                <ul class="others">
                                    <li>
                                        <span></span>
                                        <p>영재교사연구회를 중심으로 공동 운영 가능</p>
                                    </li>
                                    <li>
                                        <span></span>
                                        <p>지역별로 학교급에 따라 공동으로 운영 가능</p>
                                    </li>
                                    <li>
                                        <span></span>
                                        <p>(KAIST 지원 사항) KAIST에서 교육 프로그램 제공 가능, 희망시 융합과학 프로젝트 교재와 재료 지원 예정</p>
                                    </li>
                                    <li>
                                        <span></span>
                                        <p>지원사항: 융합과학 프로젝트 학년별 3개 프로젝트 지원 예정(KAIST 대학생 조교 파견 지원)</p>
                                    </li>
                                    <li>
                                        <span></span>
                                        <p>2학기부터 지원 가능(8월 교사 연수시 융합과학 프로젝트 상세 안내 예정)</p>
                                    </li>
                                </ul>
                                -->
                            </div>
                            <div class="program">
                                <div class="title">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" />
                                    </span>
                                    <p>전문가가 찾아가는 영재교육 프로그램</p>
                                </div>
                                <ul class="txt nanumbarungothic">
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>목적</p>
                                        <span>학생의 진로와 적성을 고려하여, 영재교육기관, 출연(연), 대학, 의료계, 법조계 등의 전문가와 함께 하는 영재교육 프로그램 제공</span>
                                    </li>
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>교육일정</p>
                                        <span>교육 일정(날짜와 시간 및 장소)은 멘토교사와 전문가가 정한 날짜에 참여</span>
                                    </li>
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>운영방법</p>
                                        <span>학생의 진로와 적성을 고려한 전문가와 함께 1:1 또는 지역별로 학교급에 따라 공동으로 멘토링 실시</span>
                                        <!-- 
                                        <ul class="sub_txt">
                                            <li><span></span>KAIST 에서 학생-전문가 매칭</li>
                                            <li><span></span>멘토교사가 전문가에게 연락하여 시간, 장소, 방법 논의 후 결정</li>
                                            <li><span></span>전문가와 함께하는 멘토링 운영(총 4시간)</li>
                                        </ul>
                                        -->
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
                                    <p>영재키움 프로젝트 연간 교육 과정</p>
                                </div>
                                <div class="sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">영재키움 프로젝트 연간 교육 과정</caption>
                                        <tr>
                                            <th colspan="2" style="width:20%;">항목</th>
                                            <th style="width:50%;">내용</th>
                                            <th style="width:15%;">시간</th>
                                            <th style="width:15%;">비고</th>
                                        </tr>
                                        <tr>
                                            <td colspan="2">영재키움 프로젝트<br>오리엔테이션</td>
                                            <td class="align_lt">
                                                <p>- 대상: 학생, 멘토교사 신규 참여자</p>
                                                <p>- 일정: 20.5월 예정</p>
                                                <p>- 내용: 영재키움 프로젝트안내, 멘토링 활동 안내 등</p>
                                                <p>- 장소: 대전 KAIST</p>
                                            </td>
                                            <td>-</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="4" style="width:10%">역량기반<br>영재교육<br>프로그램</td>
                                            <td rowspan="2" style="width:10%; background-color: #f7f7f7;">찾아가는<br>영재교육</td>
                                            <td class="align_lt" style="background-color: #f7f7f7;">
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 학생-멘토 자기설계 영재교육 프로그램</p>
                                                <p>- 대상: 학생, 멘토교사</p>
                                                <p>- 내용: 학생-멘토교사 자기설계 영재교육</p>
                                                <p class="orange_c">- 예시 : 진로적성 검사, 상담, 학습지도, 자율연구, 융합과학프로젝트, 학습멘토링 등</p>
                                            </td>
                                            <td rowspan="3" style="background-color: #f7f7f7;">24</td>
                                            <td rowspan="3" style="background-color: #f7f7f7;">멘토교사-학생<br>1:1 자율운영</td>
                                        </tr>
                                        <tr>
                                            <td class="align_lt" style="background-color: #f7f7f7;">
                                                <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 전문가와 함께하는 영재교육 프로그램</p>
                                                <p>- 대상: 학생, 멘토교사, 전문가</p>
                                                <p>- 내용: 관련 분야 전문가와 멘토교사가 함께 학생 맞춤형 멘토링 지원</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%; background-color: #f7f7f7;">체험·진로<br>탐색 프로그램</td>
                                            <td class="align_lt" style="background-color: #f7f7f7;">
                                                <p>- 대상: 학생, 멘토교사</p>
                                                <p>- 진로탐색, 현장체험 학습, 문화체험, 온라인학습멘토링 등</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:10%">창의융합<br>캠프</td>
                                            <td class="align_lt">
                                                <p>- 대상: 학생</p>
                                                <p>- 일정: 2020년 여름방학 중 2박 3일</p>
                                                <p>- 내용: 특강 및 다양한 프로그램</p>
                                                <p>- 장소: 대전 KAIST 본원</p>
                                            </td>
                                            <td>24</td>
                                            <td>KAIST에서 실시</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"></td>
                                            <td>총 시간</td>
                                            <td>48</td>
                                            <td></td>
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
