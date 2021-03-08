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
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>

                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1}"><a href="${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do">또래 멘토링 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></c:if>
                                <!--
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/4/list.do">· 또래 멘토링</a>
                                    </li>
                                    </c:if>
                                </ul>
                                -->
                            </li>


                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/110/list.do">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1}">
                                <li>
                                    <a href="#" onclick="alert('페이지 준비중입니다.');return false;">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/program/111/list.do">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                            -->
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1}">
                                <li>
                                    <a href="#" onclick="alert('페이지 준비중입니다.');return false;">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/patent/index.do">발명 및 특허교육<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1}">
                                        <li><a href="${pageContext.request.contextPath}/user/program/105/list.do">· 발명 및 특허 교육 신청</a></li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->


                    <nav class="sub_min_size">
                        <div class="program_wrap">
                            <!-- 
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>사업개요</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>사업명</p>
                                        <span>영재키움 프로젝트</span>
                                    </li>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>사업추진배경</p>
                                        <ul class="intro_sub_txt">
                                            <li><span></span>사회·경제적 여건과 관계없이 잠재력과 재능이 충분히 발휘될 수 있도록, 실질적인 영재교육의 기회를 보장할 필요</li>
                                            <li><span></span>다양성과 차이를 긍정적 기제로 활용하여 창의적 문제해결 능력을 갖춘 인재로 성장할 수 있도록, 지속적인 맞춤형 교육 지원 필요</li>
                                        </ul>
                                    </li>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>사업기간</p>
                                        <span>2019년 3월 ~ 2020년 2월</span>
                                    </li>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>주최·주관</p>
                                        <span>교육부, KAIST 과학영재교육연구원</span>
                                    </li>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>사업 참여자</p>
                                        <span>총 459팀(교사1인과 학생1인 매칭)</span>
                                        <ul class="intro_sub_txt">
                                            <li><span></span>학생 : 전국 시도교육청에서 선발된 초등학교 4학년부터 고등학교 2학년 학생(영재교육 대상자 중 사회통합대상자 학생)</li>
                                            <li><span></span>멘토교사 : 전국 시·도교육청에서 선발된 교사</li>
                                        </ul>
                                    </li>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>시·도교육청별 학생 선발 현황 -</p>
                                        <span>2019. 6. 14. 기준</span>
                                    </li>
                                </ul>
                                <div class="table_wrap sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">사업개요</caption>
                                        <tr>
                                            <th>연변</th>
                                            <th>지역</th>
                                            <th>초등학생</th>
                                            <th>중학생</th>
                                            <th>고등학생</th>
                                            <th>합계</th>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>강원</td>
                                            <td>10</td>
                                            <td>3</td>
                                            <td>2</td>
                                            <td>15</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>경기</td>
                                            <td>67</td>
                                            <td>28</td>
                                            <td>11</td>
                                            <td>106</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>경남</td>
                                            <td>15</td>
                                            <td>10</td>
                                            <td>9</td>
                                            <td>34</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>경북</td>
                                            <td>13</td>
                                            <td>10</td>
                                            <td>2</td>
                                            <td>25</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>광주</td>
                                            <td>5</td>
                                            <td>2</td>
                                            <td>1</td>
                                            <td>8</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td>대구</td>
                                            <td>8</td>
                                            <td>6</td>
                                            <td>4</td>
                                            <td>18</td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>대전</td>
                                            <td>8</td>
                                            <td>9</td>
                                            <td>4</td>
                                            <td>21</td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td>부산</td>
                                            <td>19</td>
                                            <td>9</td>
                                            <td>6</td>
                                            <td>6</td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td>서울</td>
                                            <td>42</td>
                                            <td>20</td>
                                            <td>10</td>
                                            <td>72</td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td>세종</td>
                                            <td>4</td>
                                            <td>2</td>
                                            <td>0</td>
                                            <td>6</td>
                                        </tr>
                                        <tr>
                                            <td>11</td>
                                            <td>울산</td>
                                            <td>3</td>
                                            <td>4</td>
                                            <td>0</td>
                                            <td>7</td>
                                        </tr>
                                        <tr>
                                            <td>12</td>
                                            <td>인천</td>
                                            <td>9</td>
                                            <td>21</td>
                                            <td>5</td>
                                            <td>35</td>
                                        </tr>
                                        <tr>
                                            <td>13</td>
                                            <td>전남</td>
                                            <td>17</td>
                                            <td>6</td>
                                            <td>0</td>
                                            <td>23</td>
                                        </tr>
                                        <tr>
                                            <td>14</td>
                                            <td>전북</td>
                                            <td>15</td>
                                            <td>7</td>
                                            <td>0</td>
                                            <td>22</td>
                                        </tr>
                                        <tr>
                                            <td>15</td>
                                            <td>제주</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td>0</td>
                                            <td>4</td>
                                        </tr>
                                        <tr>
                                            <td>16</td>
                                            <td>충남</td>
                                            <td>4</td>
                                            <td>2</td>
                                            <td>5</td>
                                            <td>11</td>
                                        </tr>
                                        <tr>
                                            <td>17</td>
                                            <td>충북</td>
                                            <td>13</td>
                                            <td>5</td>
                                            <td>0</td>
                                            <td>18</td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">합계</th>
                                            <th>254</th>
                                            <th>146</th>
                                            <th>59</th>
                                            <th>459</th>
                                        </tr>
                                    </table>
                                </div>
                                <ul class="txt career_txt">
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>요청사항</p>
                                        <span>영재키움 프로젝트 사업의 일환인 과학고 및 영재학교 또래 멘토링 프로그램 운영을 위한 해당교의 학생 멘토링 및 견학 운영</span>
                                    </li>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>관련문의</p>
                                        <span>KAIST 과학영재교육연구원 김희목 연구원(042-350-6227, giftedup@kaist.ac.kr)</span>
                                    </li>
                                </ul>
                            </div>
                            -->
                            
                            <div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>과학고 및 영재학교 또래멘토링</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                    <div class="title">
                                        <span><i class="fas fa-check-square"></i></span>
                                        <p>개 요</p>
                                    </div>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>프로그램명</p>
                                        <span>과학고 및 영재학교 또래 멘토링</span>
                                    </li>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>프로그램 운영 목적</p>
                                        <span>“영재키움 프로젝트”의 참여학생이 이공계 영재교육의 산실인 과학고 및 영재학교를 방문하여 해당교의 재학생과의 멘토링을 함으로써 진로를 탐색하고 학업에 대한 동기부여를 목적으로 함.</span>
                                    </li>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>학교방문기간</p>
                                        <span>추후 안내 예정</span>
                                    </li>
                                    <li class="pro_list_03">
                                        <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span>방문 규모 및 일정</p>
                                        <span>학교의 여건에 따라 방문 팀의 수와 일정 결정</span>
                                    </li>
                                </ul>
                                <ul class="intro_txt">
                                    <div class="title">
                                        <span><i class="fas fa-check-square"></i></span>
                                        <p>운영 방법 및 절차</p>
                                    </div>
                                    <li>
                                        <p>1) 세부 운영 절차</p>
                                    </li>
                                </ul>
                                <div class="table_wrap sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">세부 운영 절차</caption>
                                        <tr>
                                            <th rowspan="2" style="width:5%;">구분</th>
                                            <th colspan="2">영재키움프로젝트 참가 팀</th>
                                            <th colspan="2">과학고/영재고</th>
                                            <th rowspan="2" style="width:20%;">KAIST 과학영재 교육연구원</th>
                                        </tr>
                                        <tr>
                                            <th style="width:20%;">참여학생</th>
                                            <th style="width:20%;">멘토교사</th>
                                            <th style="width:20%;">담당교사</th>
                                            <th style="width:20%;">멘토학생</th>
                                        </tr>
                                        <tr>
                                            <td>신청</td>
                                            <td class="align_lt">멘토교사에게 희망학교 멘토링 요청</td>
                                            <td class="align_lt">과학고/영재학교 담당교사에게 최소 1개월 전에 이메일 및 전화로 멘토링 및 견학 신청</td>
                                            <td></td>
                                            <td></td>
                                            <td rowspan="3">일정조율 및 운영지원</td>
                                        </tr>
                                        <tr>
                                            <td>준비</td>
                                            <td></td>
                                            <td></td>
                                            <td class="align_lt">
                                                <span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 멘토링 및 견학 일정 조율 및 접수<br>
                                                <span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="점"></span> 멘토링 운영 학생 선정
                                            </td>
                                            <td class="align_lt">
                                                <a href="#">1365:자원봉사 포털</a> 에 접속하여 봉사 신청
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>방문</td>
                                            <td>희망 학교 방문</td>
                                            <td>희망 학교 방문</td>
                                            <td></td>
                                            <td class="align_lt">
                                                멘토링 및 견학 운영<br>
                                                (멘토링 1시간, 견학1시간, 내외운영)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>완료</td>
                                            <td></td>
                                            <td class="align_lt">
                                                영재키움 홈페이지의 포트폴리오<br>
                                                작성페이지에서 멘토링 및 견학<br>
                                                프로그램 운영 결과 기록
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                멘토학생 봉사내용 확인 및<br>
                                                시간 인정(2시간)
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                                <ul class="intro_txt">
                                    <li>
                                        <p>1) 주체별 또래 멘토링 참여/운영 방법</p>
                                        <ul class="intro_sub_txt">
                                            <li>
                                                <span></span>참여 학생(영재키움 프로젝트 참여 학생)
                                                <ul class="intro_sub_ob">
                                                    <li>- 영재키움 프로젝트 참여 학생으로, 초등학교 4학년부터 고등학교 1학년까지의 학생(이 프로그램의 참여는 초등학교 4학년부터 중학교 3학년까지의 학생을 권장함)</li>
                                                    <li>- 멘토 교사에게 방문을 원하는 학교를 제안</li>
                                                </ul>
                                            </li>
                                            <li>
                                                <span></span>멘토 교사
                                                <ul class="intro_sub_ob">
                                                    <li>- 영재키움 프로젝트 참여 교사로, 참여 학생의 요구 수렴 및 방문 학교 섭외</li>
                                                    <li>- 방문 희망학교의 담당교사와 연락하여 일정 조율 및 방문 확정</li>
                                                    <li>- 참여 학생을 인솔하여 학교 방문(방문학교 목록은 붙 참조)</li>
                                                    <li>- 또래 멘토링 운영결과를 영재키움 프로젝트의 포트폴리오 작성페이지에 기록</li>
                                                </ul>
                                            </li>
                                            <li>
                                                <span></span>담당교사
                                                <ul class="intro_sub_ob">
                                                    <li>- 과학고/영재학교의 교원으로 멘토 교사가 학교방문을 요청할 경우 일정 조율</li>
                                                    <li>- 해당 학교에서 운영할 멘토링 및 견학을 지도할 학생을 선발</li>
                                                    <li>- 방문 희망 멘토 교사에게 확정된 일시와 장소, 멘토학생 등의 정보를 안내</li>
                                                </ul>
                                            </li>
                                            <li>
                                                <span></span>멘토학생(과학고/영재학교 재학생)
                                                <ul class="intro_sub_ob">
                                                    <li>1365(자원봉사포털)를 이용하여 봉사 신청(세부 신청 방법은 부록1 참조)</li>
                                                    <li>- 과학고/영재학교의 학생으로 멘토링 및 견학 운영</li>
                                                    <li>- 멘토링 및 견학의 운영 시간은 각 1시간 내외 총 2시간 내외로 운영</li>
                                                </ul>
                                            </li>
                                            <li>
                                                <span></span>KAIST 과학영재교육연구원(사업주관 기관 담당자)
                                                <ul class="intro_sub_ob">
                                                    <li>- 프로그램 일정조율 및 운영 지원</li>
                                                    <li>- 1365(자원봉사포털)를 이용하여 멘토학생 봉사내용 확인 및 봉사시수 승인</li>
                                                    <li>- 담당자 연락처: KAIST 과학영재교육연구원 김희목 연구원(042-350-6223, giftedup@kaist.ac.kr)</li>
                                                </ul>
                                            </li>
                                        </ul>
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
