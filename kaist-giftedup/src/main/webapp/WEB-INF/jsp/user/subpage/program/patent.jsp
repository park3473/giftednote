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
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/patent/') > -1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>

                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/patent/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do">또래 멘토링 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <!--
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/subpage/program/patent/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/4/list.do">· 또래 멘토링</a>
                                    </li>
                                    </c:if>
                                </ul>
                                -->
                            </li>

                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/patent/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/110/list.do">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/patent/') > -1}">
                                <li>
                                    <a href="#" onclick="alert('페이지 준비중입니다.');return false;">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/patent/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/111/list.do">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/patent/') > -1}">
                                <li>
                                    <a href="#" onclick="alert('페이지 준비중입니다.');return false;">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/patent/') > -1}"><a href="${pageContext.request.contextPath}/user/subpage/program/patent/index.do">발명 및 특허교육<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/subpage/program/patent/') > -1}">
                                        <li><a href="${pageContext.request.contextPath}/user/program/105/list.do">· 발명 및 특허 교육 신청</a></li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="program_wrap">
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>명칭</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>개요</p>
                                        <span>
                                            KAIST 과학영재교육연구원에서는 특허청과 발명진흥회의 지원으로 KAIST IP영재기업인교육원을 운영하고 있습니다. 청소년 기업가정신 교육 확산과 창의적 아이디어로 미래의 고부가가치를 창출할 수 있는 우수인재양성을 위하여 KAIST IP-CEO e-ship 교육을 운영하고 있습니다.
                                        </span>
                                    </li>
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>IP-CEO</p>
                                        <span>
                                            남들과 다르게 생각하며 도전을 통해 혁신을 이루고 가치를 창출하는 사람. 사전적 의미로는 IP는 ‘지식재산(Intellectual Property)’을 의미하고 CEO는 ‘최고경영자’를 의미하나, 조금 더 광의의 개념으로 IP는 지식재산을 포괄하는 ‘창의적 역량’을 의미하며 나아가 ‘남들과 다르게 생각할 줄 아는 사람(creator)’을 뜻함. CEO는 단순 최고경영자의 의미 뿐 아니라, ‘기업가정신으로 끊임없이 도전을 통하여 혁신을 이루고 가치를 창출하는 혁신자(innovator)’의 개념을 포함하고 있습니다.
                                        </span>
                                    </li>
                                    <li>
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>e-ship</p>
                                        <span>
                                            ‘기업가정신(Entrepreneurship)’의 줄임말로, 온라인교육과정을 뜻하기도 합니다.
                                        </span>
                                    </li>
                                </ul>
                            </div>
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>KAIST IP-CEO e-ship 과정</p>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>1. 운영 개요</p>
                                        <span>
                                            미래영재기업인으로 성장하기 위하여 과제를 해결하면서 전문 조교의 평가와 피드백 제공, 이수증 발급 등의 혜택이 주어지는 온라인교육과정을 다음과 같이 운영합니다.
                                        </span>
                                    </li>
                                </ul>
                                <div class="table_wrap sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">운영개요</caption>
                                        <thead>
                                            <tr>
                                                <th style="width: 20%;">구분</th>
                                                <th>내용</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>교육대상</td>
                                                <td class="align_lt">- 전국 중·고등학생(영재키움 프로젝트 참가학생 포함)</td>
                                            </tr>
                                            <tr>
                                                <td>신청인원</td>
                                                <td class="align_lt">- 00명 내외</td>
                                            </tr>
                                            <tr>
                                                <td>교육기간</td>
                                                <td class="align_lt">- 추후 안내될 예정입니다.</td>
                                            </tr>
                                            <tr>
                                                <td>개설강좌 및 교육과목</td>
                                                <td class="align_lt">- 2과목: 기업가정신, 미래사회</td>
                                            </tr>
                                            <tr>
                                                <td>교육이수</td>
                                                <td class="align_lt">
                                                    - 온라인 이수기준에 부합되는 학생에 한하여 온라인 교육<br>
                                                    - 이수증 발급
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>교육혜택</td>
                                                <td class="align_lt">
                                                    - 제출 과제에 대한 전문조교의 평가 및 피드백<br>
                                                    - 이수 기준 충족 시 이수증 발급
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>2. 개설 강좌</p>
                                    </li>
                                </ul>
                                <div class="table_wrap sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">개설강좌</caption>
                                        <thead>
                                            <tr>
                                                <th>일정</th>
                                                <th>과목명</th>
                                                <th>강좌수</th>
                                                <th>개 요</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td rowspan="2">
                                                    하반기<br>
                                                    (9월 ~ 12월)
                                                </td>
                                                <td>기업가정신</td>
                                                <td>10차시</td>
                                                <td class="align_lt">- 기업가 정신과 창업, 기회의 포착과 검증, 비즈니스 모델링, 플랫폼 비즈니스 등</td>
                                            </tr>
                                            <tr>
                                                <td>미래사회</td>
                                                <td>10차시</td>
                                                <td class="align_lt">- 미래 예측, 분석방법, 미래 경제사회, 미래 일자리 등</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>3. 수강 절차</p>
                                    </li>
                                </ul>
                                <div class="table_wrap sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">수강절차</caption>
                                        <tr>
                                            <th style="width: 45%;">교육 시스템 가입</th>
                                            <td rowspan="2">→</td>
                                            <th style="width: 45%;">온라인 강의 수강 및 과제 제출</th>
                                        </tr>
                                        <tr>
                                            <td class="align_lt">
                                                <p><span><i class="fas fa-check"></i></span> 사업 담당자가 명단을 취함하여 교육 대상자에게 통보</p>
                                                <p>■ 수업 홈페이지 주소 안내</p>
                                                <p>■ 부여받은 아이디 및 비밀번호 안내(아이디 및 비번은 일괄 생성 후 개별 안내)</p>
                                            </td>
                                            <td class="align_lt">
                                                <p><span><i class="fas fa-check"></i></span> 안내받은 홈페이지 접속 정보를 이용하여 강좌 수강</p>
                                                <p>■ 홈페이지에 접속하여 수강/과제물 제출</p>
                                                <p>■ 강좌수강 완료후 이수증 발급(교육과정에서 요구하는 교육수준을 충족한 자에 한함)</p>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>4. KAIST IP-CEO e-ship과정 참여 혜택</p>
                                        <ul class="intro_sub_txt">
                                            <li><span></span>제출과제에 대한 조교의 1:1 평가와 피드백 제공</li>
                                            <li><span></span>이수기준 충족 시, 이수증 발급</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p>5. 평가방침</p>
                                        <ul class="intro_sub_txt">
                                            <li><span></span>학습자의 온라인 과제 제출 내용에 대한 담당 조교의 평가결과 종합</li>
                                            <li><span></span>평가기준 : 제출과제의 구성, 논리 적합성, 근거 명확성, 독창성/ 창의성 등</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p>5. 신청</p>
                                        <ul class="intro_sub_txt">
                                            <li><span></span>신청 방법: 이메일 신청(giftedup@kaist.ac.kr), 학생 성명 및 멘토교사 성명 기입후 이메일 제출, 별도 서식 없음</li>
                                            <li><span></span>신청 기간: 추후 안내</li>
                                            <li><span></span>신청 관련 문의: 042-350-6223 / 6227</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p>5. 프로그램 관련문의</p>
                                        <ul class="intro_sub_txt">
                                            <li><span></span>이메일: cce@kaist.ac.kr, 메일 제목을 ‘공개과정 문의’로 통일 부탁드립니다.</li>
                                            <li><span></span>연락처: 042-350-6213/ 6216</li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="program intro_con">
                                <div class="title">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" />
                                    </span>
                                    <p>KAIST IP-CEO e-ship 교육 내용</p>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>1. 기업가 정신</p>
                                    </li>
                                </ul>
                                <div class="table_wrap sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">기업가 정신</caption>
                                        <tr>
                                            <th style="width: 15%;">과정</th>
                                            <th style="width: 15%;">구분</th>
                                            <th style="width: 10%;">차시</th>
                                            <th>수업명</th>
                                        </tr>
                                        <tr>
                                            <td rowspan="10" class="align_cen">기본과정</td>
                                            <td rowspan="10" class="align_cen">온라인학습</td>
                                            <td class="align_cen">1</td>
                                            <td>왜 기업가정신인가?</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">2</td>
                                            <td>왜 창업인가?</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">3</td>
                                            <td>창업방정식 1. 기회의 포착</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">4</td>
                                            <td>창업방정식 2. 기회의 검증</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">5</td>
                                            <td>창업방정식 3. 마케팅</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">6</td>
                                            <td>창업방정식 4. 사업계획</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">7</td>
                                            <td>창업방정식 5. 비즈니스모델링</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">8</td>
                                            <td>기술트랜드: 플랫폼 비즈니스</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">9</td>
                                            <td>핀테크 플랫폼비즈니스 1: - 대출과 송금 비즈니스 현황</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">10</td>
                                            <td>핀테크 플랫폼 비즈니스#2 - 결제와 펀딩 비즈니스 현황</td>
                                        </tr>
                                    </table>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>1. 미래사회</p>
                                    </li>
                                </ul>
                                <div class="table_wrap sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">미래사회</caption>
                                        <tr>
                                            <th style="width: 15%;">과정</th>
                                            <th style="width: 15%;">구분</th>
                                            <th style="width: 10%;">차시</th>
                                            <th>수업명</th>
                                        </tr>
                                        <tr>
                                            <td rowspan="10" class="align_cen">기본과정</td>
                                            <td rowspan="10" class="align_cen">온라인학습</td>
                                            <td class="align_cen">1</td>
                                            <td>미래 예측</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">2</td>
                                            <td>분석 방법</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">3</td>
                                            <td>미래 예측(2)</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">4</td>
                                            <td>미래 경제사회</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">5</td>
                                            <td>호모 모빌리언스</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">6</td>
                                            <td>미래 일자리 진화</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">7</td>
                                            <td>미래 인재상과 교육</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">8</td>
                                            <td>미래 에너지와 환경</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">9</td>
                                            <td>공유경제와 플랫폼의 이해</td>
                                        </tr>
                                        <tr>
                                            <td class="align_cen">10</td>
                                            <td>미래사회 정리</td>
                                        </tr>
                                    </table>
                                </div>
                                <ul class="intro_txt">
                                    <li>
                                        <p>※ 교육 내용은 여건에 따라 일부 변동될 수 있습니다.</p>
                                    </li>
                                    <li>
                                        <p>※ 이 프로그램은 중학생이상 수강하는 것을 권장합니다.</p>
                                    </li>
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
