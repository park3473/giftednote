<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
</head>

<style>
    input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {-webkit-appearance: none;margin: 0;}
</style>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../include/header.jsp" %>

        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../include/menu_sub.jsp" %>
        </section>
    </header>

    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <h2>선발</h2>
                        </div>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/check.do">신입생지원 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/inquiry.do">지원서/합격자 조회 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">

                        <!-- 온라인지원서 주의사항 -->
                        <div class="program_wrap memre_wrap">
                            <div class="program" style="width:100%;">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>신입생 지원 모집 안내</p>
                                </div>

                                <ul class="txt nanumbarungothic">
                                    <li class="pro_list_03">
                                        <p>2021년도 지원 모집 안내는 5월 초에 자세하게 공지될 예정입니다.</p>
                                    </li>
                                    <li class="pro_list_03">
                                        <p>영재키움 프로젝트에 신규로 참가하기 위해서는 아래 '온라인 지원서'에 정보를 입력해야 합니다.</p>
                                    </li>
                                    <li class="pro_list_03">
                                        <p>※ 주의사항</p>
                                        <span>
                                            온라인 지원서 자료입력은 멘토교사가 입력하되, 멘토교사가 아직 확정되지 않은 경우에는 학생이 작성하고, 멘토교사 확정 여부에 반드시 '미확정'으로 선택해야 합니다. 자세한 내용은 모집 요강을 꼭 참고하세요!
                                        </span>
                                    </li>
                                    <li class="pro_list_03">
                                        <div class="memre_down">
                                            <button type="button" id="fileDownBtn4" class="yellow_btn mr-2" style="margin-left: 0;" onclick="btn_alert()">모집요강 보기</button>
                                            <label class="relate_c">모집요강을 확인하여 온라인 지원서에 필요한 서류를 확인해주세요.</label>
                                        </div>
                                        <div class="memre_down">
                                  		    <button type="button" id="fileDownBtn3" class="yellow_btn" style="margin-left: 0;" onclick="btn_alert()">지원서류 다운로드</button>
                                            <label class="relate_c">서류을 다운로드하여 작성 후 영재키움 이메일 또는 우편으로 보내주시기바랍니다.</label>    
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="program_wrap memre_wrap">
                            <div class="program" style="width:100%;">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>'온라인 지원서' 작성 방법</p>
                                </div>

                                <ul class="txt nanumbarungothic memre_txt_01">
                                    <li class="pro_list_03">
                                        <p>※ 아래 3가지 유형 중 해당되는 유형에 따라 온라인 지원서를 작성해주시고, 지원서류를 제출해주시기 바랍니다.</p>
                                    </li>
                                </ul>
                                <div class="sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">'온라인 지원서' 작성방법</caption>
                                        <thead>
                                            <tr>
                                                <th style="width: 10%;">유형</th>
                                                <th style="width: 30%;">내용</th>
                                                <th style="width: 9%;">작성자</th>
                                                <th>온라인 지원서 작성 및 지원서류 제출 방법</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>유형1</td>
                                                <td class="align_lt">멘토교사와 학생이 모두 처음 신청하는 경우로 사전에 결정(매칭)된 경우</td>
                                                <td>멘토교사</td>
                                                <td class="align_lt" style="background-color: #f7f7f7;">
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 온라인 지원서 작성시 멘토교사, 학생 정보 모두 입력</p>
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 멘토교사가 담당 학생에 대한 지원서류와 증빙서류를 취합하여 제출</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>유형2</td>
                                                <td class="align_lt">멘토교사가 사전에 매칭되지 않은 경우</td>
                                                <td>학생</td>
                                                <td class="align_lt" style="background-color: #f7f7f7;">
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 온라인 지원서 작성시 반드시 '멘토교사 미확정' 선택 후, 학생 관련 자료만 입력</p>
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 학생이 학생 관련 지원서류와 증빙서류를 제출(학생관련 자료만 제출)</p>
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> KAIST에서 멘토교사 추천 지원 예정</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>유형3</td>
                                                <td class="align_lt">멘토교사는 기존 참가자로 학생만 새롭게 추천하는 경우</td>
                                                <td>멘토교사</td>
                                                <td class="align_lt" style="background-color: #f7f7f7;">
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 온라인 지원서 작성이 멘토교사, 학생 정보 모두 입력</p>
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 멘토교사가 새롭게 참여하는 학생의 지원서류와 증빙서류를 취합하여 제출</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- 온라인지원서 주의사항 end -->

                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <form action="./insert.do?" method="post" name="insertform" id="insertform" enctype="multipart/form-data" autocomplete="off">
                                    <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                    <input type="hidden" name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" />
                                    <div class="list_wrap">
                                        <div class="title">
                                            <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                            <p>학생 (온라인 지원서)</p>
                                        </div>
                                        <div class="member_input_wrap" style="padding: 0; margin-bottom: 10px;">
                                            <ul class="member_input nanumgothic">
                                                <li>
                                                    <span class="list_t">학생명<b class="relate_c">＊</b></span>
                                                    <input class="input_size mr-2" type="text" name="NAME" id="NAME">
                                                    <label class="blind" for="NAME">이름</label>

                                                </li>

                                                <!--2020년3월27일 추가개발-->
                                                <li>
                                                    <span class="list_t">성별<b class="relate_c">＊</b></span>
                                                    <input type="radio" name="SEX" id="man" value="남자" checked>
                                                    <label for="man">남자</label>
                                                    <input type="radio" name="SEX" id="woman" value="여자">
                                                    <label for="woman">여자</label>
                                                </li>
                                                <li>
                                                    <span class="list_t">학교급<b class="relate_c">＊</b></span>
                                                    <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE1" value="초" checked>
                                                    <label for="SCHOOL_TYPE1">초</label>
                                                    <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE2" value="중">
                                                    <label for="SCHOOL_TYPE2">중</label>
                                                    <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE3" value="고">
                                                    <label for="SCHOOL_TYPE3">고</label>
                                                </li>
                                                <!--2020년3월27일 추가개발 end-->
                                                <!-- 2020년 11 월 05일 추가개발 start -->
                                                <li>
                                                    <span class="list_t">멘토교사 여부<b class="relate_c">＊</b></span>
                                                    <input type="radio" name="TEACHER_TYPE" id="TEACHER_TYPE1" value="확정">
                                                    <label for="TEACHER_TYPE1">있음</label>
                                                    <input type="radio" name="TEACHER_TYPE" id="TEACHER_TYPE2" value="미확정" checked>
                                                    <label for="TEACHER_TYPE2">없음</label>
                                                    <span class="relate_c">멘토교사가 결정되지 않은 경우에만 반드시 '없음'으로 선택 후, 학생 관련 정보만 입력해주세요.</span>
                                                    <div class="member_input_wrap" style="padding: 0;margin-bottom: 0;">
                                                        <ul class="member_input" id="techerDiv" style="display:none;border: 0px;margin-bottom: 0px;">
                                                            <li style="border-top: 1px solid #d5dbe7;">
                                                                <span class="list_t">멘토교사명<b class="relate_c">＊</b></span>
                                                                <input class="input_size mr-2" type="text" name="TEACHER_NAME" id="TEACHER_NAME">
                                                                <label class="blind" for="TEACHER_NAME">멘토교사명</label>
                                                                <span class="list_t">연락처<b class="relate_c">＊</b></span>
                                                                <input class="input_size ONLYNUMBER" type="text" name="TEACHER_PHONE" id="TEACHER_PHONE">
                                                                <label class="blind" for="TEACHER_PHONE"></label>
                                                                <span class="relate_c">연락처 입력시 -없이 입력</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li>
                                                    <span class="list_t">학교 명<b class="relate_c">＊</b></span>
                                                    <input class="input_size mr-2 input_size_2" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="" placeholder="학교 검색이 안될시 직접 작성하여 주세요">
                                                    <label for="SCHOOL_NAME"></label>
                                                    <span class="btn_click"><a href="javascript:void(window.open('/user/member_re/search_school.do', '학교 검색','width=930, height=500'))">학교검색</a></span><br>
                                                    <p><span class="relate_c">'학교 검색'을 눌러 정확한 학교명을 선택해주세요. 학교 검색에 본인의 학교가 없는 경우, 학교 명을 직접 작성해주시기 바랍니다.</span></p>
                                                </li>
                                                <!-- 2020년 11 월 05일 추가 개발 end -->
                                                <li>
                                                    <span class="list_t">학년<b class="relate_c">*</b></span>
                                                    <select class="input_size mr-2" id="SCHOOL_YEAR" name="SCHOOL_YEAR">
                                                        <option value="">선택해주세요</option>
                                                        <option value="4">초등학교4학년</option>
                                                        <option value="5">초등학교5학년</option>
                                                        <option value="6">초등학교6학년</option>
                                                        <option value="7">중학교1학년</option>
                                                        <option value="8">중학교2학년</option>
                                                        <option value="9">중학교3학년</option>
                                                        <option value="10">고등학교1학년</option>
                                                        <option value="11">고등학교2학년</option>
                                                        <option value="12">고등학교3학년</option>
                                                    </select>
                                                    <label class="blind" for="SCHOOL_YEAR">학년</label>
                                                    <span class="list_t">반<b class="relate_c">＊</b></span>
                                                    <input class="input_size" type="number" name="SCHOOL_GROUP" id="SCHOOL_GROUP">
                                                    <label class="blind" for="SCHOOL_GROUP"></label>
                                                </li>
                                                <li>
                                                    <span class="list_t">생년월일<b class="relate_c">＊</b></span>
                                                    <input class="input_size datecalendar" type="text" name="BIRTH" id="BIRTH">
                                                    <label class="blind" for="BIRTH">생년월일</label>
                                                    <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                                    <span class="relate_c">클릭해서 생년월일을 선택해주세요.</span>
                                                    <span>
                                                        <!-- 11-17 생년월일 비번 테스트<button type="button" onclick="javascript:pass_test();">test</button> --><input type="hidden" value="" id="PASSWORD" name="PASSWORD" />
                                                    </span>
                                                </li>
                                                <li>
                                                    <span class="list_t">집주소<b class="relate_c">＊</b></span>
                                                    <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" readonly>
                                                    <label class="blind" for="ZIPCODE">집주소</label>
                                                    <button type="button" onClick="zipCode();">우편번호</button>
                                                    <div class="address_02">
                                                        <input class="input_address" type="text" name="ADDRESS" id="ADDRESS" readonly>
                                                        <label class="blind" for="ADDRESS"></label>
                                                        <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" placeholder="상세주소를 입력해주세요.">
                                                        <label class="blind" for="ADDRESS_DETAIL"></label>
                                                        <input class="input_address" type="hidden" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL">
                                                        <label class="blind" for="ADDRESS"></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <span class="list_t">연락처</span>
                                                    <input class="input_size ONLYNUMBER" type="text" maxlength="11" style="ime-mode:disabled" name="PHONE" id="PHONE" placeholder="연락처 없을시 보호자 연락처 작성.">
                                                    <label class="blind" for="PHONE"></label>
                                                    <span class="relate_c">연락처 입력시 -없이 입력</span>
                                                    <span class="relate_c">연락처 입력 안할시 비밀번호는 보호자 연락처로만 문자 갑니다.</span>
                                                </li>
                                                <li>
                                                    <span class="list_t">보호자 연락처<b class="relate_c">＊</b></span>
                                                    <input class="input_size ONLYNUMBER" type="text" name="TEL" id="TEL">
                                                    <label class="blind" for="TEL">보호자 연락처</label>
                                                    <span class="relate_c">연락처 입력시 -없이 입력</span>
                                                </li>
                                                <li>
                                                    <span class="list_t">이메일</span>
                                                    <input class="input_size" type="text" name="EMAIL" id="EMAIL" placeholder="이메일 없을시 빈공간 으로 남겨주세요">
                                                    <label class="blind" for="EMAIL">이메일</label>
                                                    <!--
                                                    <span class="relate_c">이메일이 없는 경우, 해당 공간에 이메일 주소를 입력하지 않아도 됩니다.</span>
                                                    -->
                                                </li>
                                                <li>
                                                    <span class="list_t">지원 유형<b class="relate_c">＊</b></span>
                                                    <select class="input_size mr-2" id="SUPPORT_AREA" name="SUPPORT_AREA">
                                                        <option value="">선택해주세요</option>
                                                        <option value="수학">수학</option>
                                                        <option value="과학">과학</option>
                                                        <option value="수·과">수·과학</option>
                                                        <option value="발명">발명</option>
                                                        <option value="정보">정보</option>
                                                        <option value="인문사회">인문사회</option>
                                                    </select>
                                                    <label class="blind" for="SUPPORT_AREA">지원 유형</label>
                                                    <span class="list_t">지원 자격<b class="relate_c">＊</b></span>
                                                    <select class="input_size" id="ELIGIBILITY" name="ELIGIBILITY">
                                                        <c:forEach var="item" items="${model.types }" varStatus="var">
                                                            <option value="${item.DCMNT_TYPE }">${item.DCMNT_TYPE }</option>
                                                        </c:forEach>
                                                    </select>
                                                    <label class="blind" for="ELIGIBILITY"></label>
                                                </li>
                                                <li>
                                                    <span class="list_t">영재 교육 경험 여부<b class="relate_c">＊</b></span>
                                                    <input type="radio" name="EXP" id="exist" value="유">
                                                    <label for="exist">유</label>
                                                    <input type="radio" name="EXP" id="none" value="무" checked>
                                                    <label for="none">무</label>
                                                </li>
                                                <li>
                                                    <span class="list_t">영재 교육 경험 종류<b class="relate_c">＊</b></span>
                                                    <select class="input_size mr-2" id="EXP_TYPE" name="EXP_TYPE">
                                                        <option value="">선택해주세요</option>
                                                        <option value="영재학교">영재학교</option>
                                                        <option value="과학고등학교">과학고등학교</option>
                                                        <option value="시도교육청 영재교육원">시도교육청 영재교육원</option>
                                                        <option value="대학교 영재교육원">대학교 영재교육원</option>
                                                        <option value="영재학급">영재학급</option>
                                                        <option value="기타">기타</option>
                                                    </select>
                                                    <label class="blind" for="EXP_TYPE">영재 교육 경험 종류</label>
                                                    <span class="list_t">영재 교육 참여 기간<b class="relate_c">＊</b></span>
                                                    <select class="input_size mr-2" id="EXP_DATA" name="EXP_DATA">
                                                        <option value="">선택해주세요</option>
                                                        <option value="1년 이하">1년 이하</option>
                                                        <option value="1년 ~ 2년">1년 ~ 2년</option>
                                                        <option value="2년 ~ 3년">2년 ~ 3년</option>
                                                        <option value="3년 ~ 4년">3년 ~ 4년</option>
                                                        <option value="4년 이상">4년 이상</option>
                                                    </select>
                                                    <label class="blind" for="EXP_DATA">영재 교육 참여 기간</label>
                                                </li>
                                                <!-- 2020년 11월 05일 추가 개발 start-->
                                                <li>
                                                    <span class="list_t"><span id="self_intr_text_1">자기소개서 - 1</span><b class="relate_c">＊</b><br>(<span id="self_length_1">0</span> / 1000자)</span>
                                                    <textarea class="input_size mr-2 textarea_size" type="text" maxlength="1000" name="SELF_INTR_1" id="SELF_INTR_1" placeholder="영재키움 프로젝트’에 지원하게 된 이유를 자기의 꿈과 관련지어 자기소개서를 작성하시기 바랍니다.(지원 이유, 다짐, 각오 등이 드러나게)" style="height: 180px;"></textarea>
                                                    <label class="blind" for="SELF_INTR">자기소개서</label>
                                                </li>
                                                <li>
                                                    <span class="list_t"><span id="self_intr_text_2">자기소개서 - 2</span><b class="relate_c">＊</b><br>(<span id="self_length_2">0</span> / 1000자)</span>
                                                    <textarea class="input_size mr-2 textarea_size" type="text" maxlength="1000" name="SELF_INTR_2" id="SELF_INTR_2" placeholder="지원하는 분야(수학, 과학, 정보, 발명, 인문사회의 즐거웠던 경험을 써 보세요." style="height: 180px;"></textarea>
                                                    <label class="blind" for="SELF_INTR">자기소개서</label>
                                                </li>
                                                <li id="self_intr_li" style="display:none">
                                                    <span class="list_t"><span id="self_intr_text_3">자기소개서 - 3</span><b class="relate_c">＊</b><br>(<span id="self_length_3">0</span> / 1000자)</span>
                                                    <textarea class="input_size mr-2 textarea_size" type="text" maxlength="1000" name="SELF_INTR_3" id="SELF_INTR_3" placeholder="1000자 이내로 입력해주세요." style="height: 180px;"></textarea>
                                                    <label class="blind" for="SELF_INTR">자기소개서</label>
                                                </li>
                                                </li>
                                                <!-- 2020년 11월 05일 추가 개발 end-->
                                                    <!--
                                                <input class="input_size" type="text" name="fileName" id="fileName">
                                                <label class="blind" for="fileName">파일이름</label>
                                                <input type="file" id="file" name="file" onchange="changeValue(this)" style="display: none;" />
                                                <label class="blind" for="file">파일업로드</label>
                                                <button type="button" id="btn-upload">파일선택</button>
                                                <span class="relate_b">선택된 파일 없음</span>
                                                -->
                                            </ul>
                                        </div>


                                        <div class="program_wrap">
                                            <div class="program" style="width:100%;">
                                                <ul class="txt nanumbarungothic" style="border: 0;">
                                                    <li class="pro_list_03">
                                                        <p>※ 지원서류와 증빙서류는 ZIP 파일 또는 1개의 PDF파일로 변환하여 이메일 제출(giftedup@kaist.ac.kr) 또는 우편으로 제출해주시기 바랍니다.</p>
                                                    </li>
                                                    <li class="pro_list_03">
                                                        <p>※ 우편제출처: 대전광역시 유성구 문지로 193 KAIST 문지캠퍼스 F618호(수령인: 영재키움 프로젝트 담당자, 전화번호: 042-350-6227)</p>
                                                    </li>
                                                    <li class="pro_list_03">
                                                        <p>※ 대전광역시 유성구 문지로 193 KAIST 문지캠퍼스 F618호 영재키움 프로젝트 담당자</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <!--보드 검색_버튼-->
                                        <div class="board_btn_wrap">
                                            <div class="board_btn">
                                                <!-- 신입생 지원 마감시 밑에 코드 실행되게 주석 삭제 부탁드립니다.. -->
                                                <!-- <a class="delete" href="#" onclick="insert_alert()">제출하기</a> -->

                                                <!-- 신입생 지원 시 밑에 코드 실행되게 주석 삭제 부탁드립니다.. -->
                                                <a class="delete" href="javascript:insertClick();">지원서 저장</a>
                                                <a class="register" href="${pageContext.request.contextPath}/index.do">취소하기</a>
                                            </div>
                                        </div>
                                </form>
                                <!--보드 검색_버튼 end-->

                                <div class="program_wrap">
                                    <div class="program" style="width:100%;">
                                        <div class="title">
                                            <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                            <p>지원서류 및 증빙서류 목록</p>
                                        </div>
                                        <div class="sub_page">
                                            <table class="txt select_table memre_table">
                                                <caption class="blind">'온라인 지원서' 작성방법</caption>
                                                <thead>
                                                    <tr>
                                                        <th rowspan="2" style="width: 10%;">순번</th>
                                                        <th rowspan="2" style="width: 30%;">목록</th>
                                                        <th rowspan="2" style="width: 9%;">부수</th>
                                                        <th rowspan="2">제출자</th>
                                                        <th colspan="3">유형별 제출 목록</th>
                                                    </tr>
                                                    <tr>
                                                        <th>유형1</th>
                                                        <th>유형2</th>
                                                        <th>유형3</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td rowspan="2">서식1</td>
                                                        <td rowspan="2">개인정보 수집·이용 및 제공에 대한 안내 및 동의서</td>
                                                        <td rowspan="2">1부</td>
                                                        <td>학생</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>멘토교사</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>서식2</td>
                                                        <td>멘토교사 지원서</td>
                                                        <td>1부</td>
                                                        <td>멘토교사</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>서식3</td>
                                                        <td>교사 추천서</td>
                                                        <td>1부</td>
                                                        <td>멘토교사</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>서식4</td>
                                                        <td>자기 소개서</td>
                                                        <td>1부</td>
                                                        <td>학생</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>서식5</td>
                                                        <td>학부모 서약서</td>
                                                        <td>1부</td>
                                                        <td>보호자</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>서식6</td>
                                                        <td>지원자 서약서</td>
                                                        <td>1부</td>
                                                        <td>학생</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>증빙서류</td>
                                                        <td>지원자격에 대한 해당 증빙서류<br>(참고2 에서 확인)</td>
                                                        <td>1부</td>
                                                        <td>관공서 및 학교에서 발급</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                </nav>
            </div>
        </div>
        </div>
    </section>
    <!--본문 end-->
    <div style="display:none">
        <form id="student_view" method="post" name="view" action="./view.do?">
            <input type="text" id="NAME" name="NAME" value="${model.ID}">
            <input type="text" id="PASSWORD" name="PASSWORD" value="${model.PASS}">
        </form>
    </div>



    <!--제출성공 모달-->
    <div id="sucs_modal" class="sucs_modal_wrap">
        <div class="sucs_modal_area">
            <div class="modal_model">
                <img src="${pageContext.request.contextPath}/resources/img/modal_model.png" alt="학생" />
            </div>
            <div class="sucs_modal_con">
                <div class="modal_close">
                    <a onclick="$('#sucs_modal').css('display','none');$('.danger_bg').css('display','none')"><i class="las la-times"></i></a>
                </div>
                <div class="sucs_title">
                    <h2>1차 지원서를 <span>성공적으로</span> 지원하였습니다!</h2>
                </div>
                <ul class="sucs_list_box">
                    <table class="sucs_table">
                        <caption class="blind">지원자격</caption>
                        <thead>
                        <tr>
                            <th>지원 자격</th>
                            <td>${model.DCMNT_TYPE}</td>
                        </tr>
                        </thead>
                    </table>
                </ul>
                <ul class="sucs_list_box">
                    <p>※ 2차 증빙 서류</p>
                    <table class="sucs_table">
                        <caption class="blind">2차 증빙 서류</caption>
                        <thead>
                            <tr>
                                <th>증빙 서류</th>
                                <td>
                                    <c:forEach var="item" items="${model.names }" varStatus="var">
                                    <span value="${item.DCMNT_NAME}">
                                    ${item.DCMNT_NAME},
                                    </span>
                                    </c:forEach>
                                </td>
                            </tr>
                        </thead>
                    </table>
                </ul>
                <div class="sucs_txt_box">
                    <p>위에 안내된 지원 자격에 따른 서류를 메일이나 우편으로 제출하여야<br> 2021 영재키움 프로젝트 신입생 지원에 최종 접수되오니 기한 내 서류를 꼭 제출해주시기 바랍니다.</p>
                    <p>메일 제출 : <span>giftedup@kaist.ac.kr</span></p>
                    <p>우편 제출 : <span>대전 유성구 문지로 193 KAIST문지캠퍼스 F618호 영재키움 담당자</span></p>
                    <p>영재키움 담당번호 : <span>042-350-6227</span></p>
                    <p class="last">2차 증빙서류를 전부 제출하셔야 최종적으로 지원이 완료가 됩니다.</p>
                </div>
                <div class="sucs_btn_box">
                    <h3>지원서 조회하기</h3>
                    <ul class="sucs_sub_btn">
                        <li class="sucs_btn_ob sucs_btn_ob_01">
                            <button type="button" id="student_view_open" onclick="javascript:student_view()">바로가기</button>
                        </li>
                        <li class="sucs_btn_ob sucs_btn_ob_02">
                            <button type="button" onclick="location.href='${pageContext.request.contextPath}/index.do'">메인으로</button>
                        </li>
                    </ul>
                </div>
                <div class="sucs_txt_box_01">
                    <p>※ 지원서 조회 및 수정이 필요하실 경우 <span>지원자/합격자</span> 조회에서 확인이 가능합니다.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="danger_bg"></div>
    <!--제출성공 모달 end-->


    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <%@ include file="../include/footerJs.jsp" %>
</body>

</html>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	//연락처에숫자입력
	$(".ONLYNUMBER").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^0-9]/gi,''));
	});

    //자기 소개서 글 갯수 표현
    $(document).ready(function() {
        $("#SELF_INTR_1").on("change keyup paste", function() {
            var self_length = $(this).val();
            $('#self_length_1').text(self_length.length);
        })
    })
    $(document).ready(function() {
        $("#SELF_INTR_2").on("change keyup paste", function() {
            var self_length = $(this).val();
            $('#self_length_2').text(self_length.length);
        })
    })
    $(document).ready(function() {
        $("#SELF_INTR_3").on("change keyup paste", function() {
            var self_length = $(this).val();
            $('#self_length_3').text(self_length.length);
        })
    })
    //자기 소개서 표현
    if($("input:radio[name=SCHOOL_TYPE]:checked").val() == '초'){
		$('#self_intr_text_1').html('지원하게 된 동기');
		$('#self_intr_text_2').html('지원하는 분야');
	}else{
		$('#self_intr_text_1').html('자신의 성장과정');
		$('#self_intr_text_2').html('자신의 장·단점');
		$('#self_intr_text_3').html('재학기간 중 활동내용');
	}
    
	//자기 소개서 표현 중 , 고
	$("input:radio[name=SCHOOL_TYPE]").click(function(){
		if($("input:radio[name=SCHOOL_TYPE]:checked").val() == '초' ){
			$('#self_intr_li').hide();
			$('#SELF_INTR_1').attr('placeholder','영재키움 프로젝트’에 지원하게 된 이유를 자기의 꿈과 관련지어 자기소개서를 작성하시기 바랍니다..(지원 이유, 다짐, 각오 등이 드러나게)');
			$('#SELF_INTR_2').attr('placeholder','지원하는 분야(수학, 과학, 정보, 발명, 인문사회의 즐거웠던 경험을 써 보세요.');
			$('#self_intr_text_1').html('지원하게 된 동기');
			$('#self_intr_text_2').html('지원하는 분야');
		}else{
			$('#self_intr_li').show();
			$('#SELF_INTR_1').attr('placeholder','지원자의 성장과정과 배경에 대해서 구체적으로 기술하시오. 또한 자신의 꿈이 무엇이며, 어떤 계기로 이 꿈을 가지게 되었는지, 그리고 지금까지 그 꿈을 이루기 위해 어떤 노력을 해왔는지 기술하십시오.');
			$('#SELF_INTR_2').attr('placeholder','남보다 뛰어나다고 생각하는 자신의 장점(혹은 능력)과 고쳐야 할 단점(혹은 능력)이 있습니까? 그렇다면 자신의 장점을 발휘하였던 사례와, 단점을 극복하기 위해 기울인 노력에 대해서 구체적인 예와 함께 설명하십시오.');
			$('#SELF_INTR_3').attr('placeholder','학교 재학기간 중 학업 이외의 활동(사회봉사, 교내·외 동아리활동, 단체 활동, 취미활동, 문화 활동, 발명관련 활동 등)에서 가장 소중했던 경험을 소개하고, 이러한 경험을 통해 무엇을 배웠는지에 대해서 기술하십시오.');
			$('#self_intr_text_1').html('자신의 성장과정');
			$('#self_intr_text_2').html('자신의 장·단점');
			$('#self_intr_text_3').html('재학기간 중 활동내용');
		}
	})

    //function btn_alert(){
    //    alert("5월 초부터 모집요강 및 지원서류를 확인하실수 있습니다.")
    //}

    //모달창 관련 태그
    //모달창 닫기
    $(".modal_close > a").click(function() {
        $(".sucs_modal_wrap").hide();
        $(".danger_bg").hide();
    })

    //지원서가 저장 되고 난 뒤에 온 rtn =1 값을 받아 모달창 열기
    var rtn = '${model.RTN}';
    if (rtn == '1') {
        $(document).ready(function() {
            $(".sucs_modal_wrap").show();
            $(".danger_bg").show();
        })
    }

    //OK버튼 클릭시 view폼 보내기
    function student_view() {
        $(document).ready(function() {
            $("#student_view").submit();
        });
    }
    //


    function insert_alert() {
        alert("신입생지원모집이 종료 되었습니다.");
    }

    $('#fileDownBtn4')
        .click(
            function(e) {
                var url = '${pageContext.request.contextPath}/resources/files/브로슈어_2020 영재키움 프로젝트 선발 안내.pdf';
                window.open(url);
            });

    $('#fileDownBtn3')
        .click(
            function(e) {
                var url = '${pageContext.request.contextPath}/resources/files/신입생_지원서류.zip';
                location.href = url;
            });

    $("#TEACHER_TYPE1").click(function() {
        $('#techerDiv').show();
    })

    $("#TEACHER_TYPE2").click(function() {
        $('#techerDiv').hide();
    })

    $("#EXP_TYPE").attr("disabled", true);
    $("#EXP_DATA").attr("disabled", true);

    //경험 여부
    $("input:radio[name=EXP]").click(function() {

        if ($("input:radio[name=EXP]:checked").val() == '무') {
            $("#EXP_TYPE").attr("disabled", true);
            $("#EXP_DATA").attr("disabled", true);
            $("#EXP_TYPE").val("");
            $("#EXP_DATA").val("");

        } else {
            $("#EXP_TYPE").attr("disabled", false);
            $("#EXP_DATA").attr("disabled", false);
        }
    });

    $(function() {
        $('#btn-upload').click(function(e) {
            e.preventDefault();
            $('#file').click();
        });
    });

    function changeValue(obj) {
        var fileObj = obj.value;
        var pathHeader, pathMiddle, pathEnd, allFilename, fileName, extName;
        pathHeader = fileObj.lastIndexOf("\\");
        pathMiddle = fileObj.lastIndexOf(".");
        pathEnd = fileObj.length;
        fileName = fileObj.substring(pathHeader + 1, pathMiddle);
        extName = fileObj.substring(pathMiddle + 1, pathEnd);
        allFilename = fileName + "." + extName;

        $('#fileName').val(allFilename);
    }

    function zipCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                $('#ZIPCODE').val(data.zonecode);
                $('#ADDRESS').val(data.roadAddress);
            }
        }).open();
    }

    /*
    function test_swal() {
    	swal({
            title:'지원서 저장이 완료가 되었습니다.',
            text:'지원서 내용 조회하기',
            type: "success",
            confirmButtonText: '바로가기',
      		closeOnConfirm: false,
      		showCancelButton : true,
    		},function(isConfirm){
    			if(isConfirm){
    				location.href = "${pageContext.request.contextPath}/index.do";
    			}else{
    				return;
    			}
      		});
    }
     */

    function insertClick() {

        if ($(":input:radio[name=TEACHER_TYPE]:checked").val() == '확정') {

            if ($('#TEACHER_NAME').val() == '') {
                alert('멘토교사 이름을 입력 하여 주세요');
                return;
            }
            if ($('#TEACHER_PHONE').val() == '') {
                alert('멘토교사 연락처를 입력 하여 주세요');
                return;
            }
          	//연락처 자리수 11자리가 맞는지 확인
    		if ($('#TEACHER_PHONE').val().length != 11) {
    			alert('멘토교사연락처 11자리를 제대로 기입하였는지 확인하여주십쇼');
    			return;
    		}
        }

        if ($('#NAME').val() == '') {
            alert('이름을 입력 하여 주세요');
            return;
        }

        if ($('#man').val() == '') {
            alert('성별을 선택해주세요.');
            return;
        }

        if ($('#woman').val() == '') {
            alert('성별을 선택해주세요.');
            return;
        }
        
          
		if ($('#SCHOOL_NAME').val() == '') {
			alert('소속학교명 입력 하여 주세요');
			return;
		}

		if ($('#SCHOOL_YEAR').val() == '') {
			alert('학년을 입력 하여 주세요');
			return;
		}

		if ($('#SCHOOL_GROUP').val() == '') {
			alert('반을 입력 하여 주세요');
			return;
		}
		
		//학교 급 , 학년 선택 잘못하는거 방지 ex) 학교급 => 고 학년 => 초등학교4학년
		if($(':input:radio[name=SCHOOL_TYPE]:checked').val() != $('#SCHOOL_YEAR option:selected').text().substring(0,1)){
			alert('학교급과 , 학년 을 같은 급으로 설정하여 주세요. ');
			return;
		}

		if ($('#BIRTH').val() == '') {
			alert('생년월일을 선택해주세요.');
			return;
		}

		if ($('#ZIPCODE').val() == '') {
			alert('우편번호를 입력 하여 주세요.');
			return;
		}

		if ($('#ADDRESS').val() == '') {
			alert('상세주소를 입력 하여 주세요.');
			return;
		}

		if ($('#TEL').val() == '') {
			alert('연락처를 입력 하여 주세요');
			return;
		}
		//연락처 자리수 11자리가 맞는지 확인
		if ($('#TEL').val().length != 11) {
			alert('부호자 연락처 11자리를 제대로 기입하였는지 확인하여주십쇼');
			return;
		}
		//연락처 자리수 11자리가 맞는지 확인
		if($('#PHONE').val != ''){
			if ($('#PHONE').val().length != 11) {
				alert('연락처 11자리를 제대로 기입하였는지 확인하여주십쇼');
				return;
			}
		}

		if ($('#SUPPORT_AREA').val() == '') {
			alert('지원유형을 선택해주세요.');
			return;
		}

		if ($('#ELIGIBILITY').val() == '') {
			alert('지원자격을 선택해주세요.');
			return;
		}
		if ($(":input:radio[name=EXP]:checked").val() == '유') {

			if ($('#EXP_TYPE').val() == '') {
				alert('영재 교육 경험 여부를 선택해주세요.');
				return;
			}

			if ($('#EXP_DATA').val() == '') {
				alert('영재 교육 경험 여부를 선택해주세요.');
				return;
			}
		}
		if ($('#SELF_INTR').val() == '') {
			alert('자기소개서를 작성하여 주세요.');
			return;
		}
		if($("input:radio[name=SCHOOL_TYPE]:checked").val() == '초'){
			$('#SELF_INTR_3').val('');
		}

		//핸드폰 번호 바꾸기 - 학생
		var st_phone = $('#PHONE').val();
		var st_phone = st_phone.replace(/-/gi, "");
		$('#PHONE').val(st_phone);

		//핸드폰 번호 바꾸기 - 멘토
		var me_phone = $('#TEACHER_PHONE').val();
		var me_phone = me_phone.replace(/-/gi, "");
		$('#TEACHER_PHONE').val(me_phone);

		//핸드폰 번호 바꾸기 - 부모
		var pa_phone = $('#TEL').val();
		var pa_phone = pa_phone.replace(/-/gi, "");
		$('#TEL').val(pa_phone);

		//생년월일 비번 만들기
		var bir_pass = $('#BIRTH').val();
		var pass_bir;
		pass_bir = bir_pass.replace(/\./gi, "");
		var pass_bir = pass_bir.substr(-6);
		$('#PASSWORD').val(pass_bir);

		$('#insertform').submit();
	}

	$.datetimepicker.setLocale('ko');
	jQuery('.datecalendar').datetimepicker({
		format : 'Y.m.d',
		lang : "ko",
		timepicker : false
	});

	$.datetimepicker.setLocale('ko');
	jQuery('.datecalendar2').datetimepicker({
		format : 'Y.m.d H:i',
		lang : "ko",
		timepicker : true
	});
</script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
