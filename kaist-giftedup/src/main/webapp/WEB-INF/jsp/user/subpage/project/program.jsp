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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
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
                        <div class="vision_goal">
                            <div class="vision">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>영재키움 프로젝트</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">잠재력과 재능이 충분히 발휘될 수 있도록, 보다 적극적인 도움이 필요한 영재교육 대상자를 선발하여 맞춤형 교육을 지원하는 영재키움 프로젝트 사업입니다.</p>
                                </div>
                            </div>
                            <div class="goal">
                                <div class="title">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" />
                                    </span>
                                    <p>맞춤형 교육지원</p>
                                </div>
                                <div class="txt nanumbarungothic">
                                    <p>
                                        <span>(1:1 교사 멘토링)</span><br>
                                        학생의 특성을 고려하여 집중적으로 지원이 필요한 부분을 교사와 함께 고민하고 해결 할 수 있도록 지원합니다.
                                    </p>

                                    <p>
                                        <span>(맞춤형 교육 프로그램)</span><br>
                                        역량 중심의 영재 교육프로그램을 멘토교사와 KAIST가 함께 운영합니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="program_table sub_page">
                            <div class="program_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
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
                                    <p style="color: #5c5c5c;">※ 찾아가는 영재교육 및 체험・진로탐색 프로그램은 24시간 내에서 학생과 멘토교사가 자유롭게 수행(단, 한 프로그램에 집중되지 않도록 주의)</p>
                                </div>
                            </div>
                        </div>
                        <div class="student_teacher">
                            <div class="part_student">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>영재키움 참가학생은</p>
                                </div>
                                <div class="txt nanumbarungothic">
                                    <p>아래 조건을 충족하는 학생 지원 자격을 통해 추천합니다.</p>
                                    <ul>
                                        <li>① 교육급여 수급자</li>
                                        <li>② 도서·벽지에 거주하는자</li>
                                        <li>③ 특수교육 대상자</li>
                                        <li>④ 행정구역상 읍·면 지역에 거주하는 자 등</li>
                                        <li>⑤ 그 밖에 사회·경제적 이유로 교육기회의 격차가 발생하였다고 인정되는자</li>
                                    </ul>
                                    <p>※ 1차년도는 초등학교 4학년에서 고등학교 1학년 선발, 최소 3년간 프로그램 지원예정('18년 고1학년 →' 20년 고3학년까지 확대)</p>
                                    <p>※ 선발분야는 수학, 과학, 정보, 발명, 인문사회(예술, 체육 제외)</p>
                                </div>
                            </div>
                            <div class="mentor_teacher">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>영재키움 멘토교사는</p>
                                </div>
                                <div class="txt nanumbarungothic">
                                    <p>참가학생과 적극적으로 소통하여 지원할 의지가 있는 교사를 추천합니다.</p>
                                    <ul>
                                        <p>멘토교사의 역할</p>
                                        <li>① 영재키움 참가 학생을 위한 영재교육 프로그램 운영 및 참여</li>
                                        <li>② 영재키움 참가 학생의 학습, 진로, 정서 발달을 위한 상담 실시</li>
                                        <li>③ 영재키움 참가 학생의 멘토링 활동 사항 관리</li>
                                    </ul>
                                    <!--
                                    <p>※ 학생과 함께 지원을 받아, 학생이 대상자로 선발시 멘토 교사로 활동하게 되고 소정의 멘토수 당(연간 50만원) 지급예정</p>
                                    -->
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
