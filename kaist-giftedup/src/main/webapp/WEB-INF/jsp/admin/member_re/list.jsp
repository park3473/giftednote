<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %> 
        <link href="${pageContext.request.contextPath}/resources/css/admin/member_re_list.css" rel="stylesheet" type="text/css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>
    <!--헤더-->
    <%@ include file="../include/header.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css"> 
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>신입생 지원 리스트</span>
                            </div>
                            <form action="list.do?" method="get">
                                <div class="member_re_seach_form">
                                    <div class="member_re_01_wrap">
                                        <form>
                                            <div class="form_01">
                                                <div class="page">
                                                    <input style="width: 44px; margin-right: 10px" type="number" value="${model.beforeDomain.ITEM_COUNT }" name="ITEM_COUNT" id="ITEM_COUNT">
                                                    <span>/ 페이지</span>
                                                </div>
                                                <div class="page_seach">
                                                    <select ID="RESULT" NAME="RESULT">
                                                        <option value="">결과</option>
                                                        <option value="pass" <c:if test="${model.beforeDomain.RESULT == 'pass'}">selected</c:if>>합격</option>
                                                        <option value="fail" <c:if test="${model.beforeDomain.RESULT == 'fail'}">selected</c:if>>불합격</option>
                                                        <option value="wating" <c:if test="${model.beforeDomain.RESULT == 'wating'}">selected</c:if>>대기</option>
                                                    </select>

                                                    <select ID="ADDRESS_LOCAL" NAME="ADDRESS_LOCAL">
                                                        <option value="">지역</option>
                                                        <option value="서울" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '서울'}">selected</c:if>>서울</option>
                                                        <option value="경기" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '경기'}">selected</c:if>>경기</option>
                                                        <option value="인천" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '인천'}">selected</c:if>>인천</option>
                                                        <option value="강원" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '강원'}">selected</c:if>>강원</option>
                                                        <option value="대전" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '대전'}">selected</c:if>>대전</option>
                                                        <option value="세종" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '세종'}">selected</c:if>>세종</option>
                                                        <option value="충남" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '충남'}">selected</c:if>>충남</option>
                                                        <option value="충북" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '충북'}">selected</c:if>>충북</option>
                                                        <option value="광주" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '광주'}">selected</c:if>>광주</option>
                                                        <option value="전남" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '전남'}">selected</c:if>>전남</option>
                                                        <option value="전북" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '전북'}">selected</c:if>>전북</option>
                                                        <option value="부산" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '부산'}">selected</c:if>>부산</option>
                                                        <option value="경남" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '경남'}">selected</c:if>>경남</option>
                                                        <option value="대구" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '대구'}">selected</c:if>>대구</option>
                                                        <option value="경북" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '경북'}">selected</c:if>>경북</option>
                                                        <option value="제주" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '제주'}">selected</c:if>>제주</option>
                                                    </select>

                                                    <select ID="SCHOOL_TYPE" NAME="SCHOOL_TYPE">
                                                        <option value="">학교급</option>
                                                        <option value="초" <c:if test="${model.beforeDomain.SCHOOL_TYPE == '초'}">selected</c:if>>초등학교</option>
                                                        <option value="중" <c:if test="${model.beforeDomain.SCHOOL_TYPE == '중'}">selected</c:if>>중학교</option>
                                                        <option value="고" <c:if test="${model.beforeDomain.SCHOOL_TYPE == '고'}">selected</c:if>>고등학교</option>
                                                    </select>

                                                    <select ID="SCHOOL_YEAR" NAME="SCHOOL_YEAR">
                                                        <option value="">학년</option>
                                                        <option value="4" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교 4학년</option>
                                                        <option value="5" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교 5학년</option>
                                                        <option value="6" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교 6학년</option>
                                                        <option value="7" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '7'}">selected</c:if>>중학교 1학년</option>
                                                        <option value="8" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '8'}">selected</c:if>>중학교 2학년</option>
                                                        <option value="9" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '9'}">selected</c:if>>중학교 3학년</option>
                                                        <option value="10" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교 1학년</option>
                                                        <option value="11" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교 2학년</option>
                                                        <option value="12" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '12'}">selected</c:if>>고등학교 3학년</option>
                                                    </select>

                                                    <select ID="SEARCH_TYPE" NAME="SEARCH_TYPE">
                                                        <option value="ALL">전체</option>
                                                        <option value="NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'NAME'}">selected</c:if>>학생명</option>
                                                        <option value="SEX" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SEX'}">selected</c:if>>성별</option>
                                                        <option value="SCHOOL_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_NAME'}">selected</c:if>>학교명</option>
                                                        <option value="SCHOOL_YEAR" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_YEAR'}">selected</c:if>>학년</option>
                                                        <option value="SUPPORT_AREA" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SUPPORT_AREA'}">selected</c:if>>지원유형</option>
                                                        <option value="ELIGIBILITY" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ELIGIBILITY'}">selected</c:if>>지원자격</option>
                                                        <option value="PHONE" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'PHONE'}">selected</c:if>>연락처</option>
                                                    </select>

                                                    <input style="width: 191px;" type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT" placeholder="검색할 내용을 입력해주세요.">
                                                    <button type="button" onClick="searchBtnClick()" value="검색">검색</button>
                                                    <a class="w_btn" href="./list.do">새로고침</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="member_re_02_wrap">
                                        <form>
                                            <select id="RESULT2" name="RESULT2">
                                                <option value="">합격자 선정</option>
                                                <option value="pass">합격</option>
                                                <option value="fail">불합격</option>
                                                <option value="wating">대기</option>
                                                <option value=''>멘토 수정 가능</option>
                                            </select>
                                            <button type="button" onClick="resultChangedArr()" value="일괄변경">일괄변경</button>
                                        </form>
                                        <form>
                                            <div>
                                                <input type="radio" name="excelDownType" value="ALL" checked>
                                                <label>전체</label>
                                            </div>
                                            <div>
                                                <input type="radio" name="excelDownType" value="PASS_STUDENT">
                                                <label>합격자</label>
                                            </div>
                                            <button type="button" value="엑셀출력" onClick="excelDown()">엑셀출력</button>
                                        </form>
                                        <form>
                                            <button type="button" value="지원종료" onClick="AllComplete()">지원종료</button>
                                            <button type="button" onClick="location.href='${pageContext.request.contextPath}/admin/member_re/dcmnt.do'" >지원 자격 리스트 관리</button>
                                        </form>
                                    </div>

                                    <!-- 문자 발송  -->
                                    <div class="member_re_03_wrap">
                                        <form>
                                            <span>문자메세지 (<span style="vertical-align: baseline;" id="sms_text_size">0</span>글자)</span>
                                            <input style="width: 397px;" type="text" value="" id="sms_text" name="MESSAGE">
                                            <input type="checkbox" id="RESERVATION" name="RESERVATION"  >
                                            <input class="datecalendar2" type="text"  value="" id="RESERVATION_TM" name="RESERVATION_TM" readonly style="display: none;">
                                            <input  type="text"  value="" id="RESERVATION_TM2" name="RESERVATION_TM2" readonly>
                                            <button type="button" onClick="javascript:smssend_re('member')" value="문자발송">문자발송</button>
                                            <button type="button" onClick="javascript:smssend_all('member')" value="합격문자발송">전체 문자발송</button>    
                                            <a class="w_btn" href="${pageContext.request.contextPath}/admin/sms_log/member/list.do">발송내역</a>
                                        </form>
                                    </div>
                                    <!-- 문자 종료  -->

                                </div>

                                <!-- 신입생 테이블 -->
                                <div class="table_wrap">
                                    <table id="gcTable" class="tablesorter">
                                        <thead>
                                            <tr>
                                                <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                                <th class="number" data-col="IDX">순번</th>
                                                <th class="name">학생명</th>
                                                <th class="sex">성별<button id="upbtn" class="updwbtn" value="SEX">▲</button><button id="dwbtn" class="updwbtn" value="SEX" >▼</button></th>
                                                <th class="address_local">지역<button id="upbtn" class="updwbtn" value="ADDRESS_LOCAL">▲</button><button id="dwbtn" class="updwbtn" value="ADDRESS_LOCAL" >▼</button></th>
                                                <th class="birth">생년월일<button id="upbtn" class="updwbtn" value="BIRTH">▲</button><button id="dwbtn" class="updwbtn" value="BIRTH" >▼</button></th>
                                                <th class="school_name">학교명<button id="upbtn" class="updwbtn" value="SCHOOL_NAME">▲</button><button id="dwbtn" class="updwbtn" value="SCHOOL_NAME" >▼</button></th>
                                                <th class="school_type">학교급</th>
                                                <th class="school_year" data-col="SCHOOL_YEAR">학년<button id="upbtn" class="updwbtn" value="SCHOOL_YEAR">▲</button><button id="dwbtn" class="updwbtn" value="SCHOOL_YEAR" >▼</button></th>
                                                <th class="phone">연락처</th>
                                                <th class="support_area">지원 유형</th>
                                                <th class="eligibility">지원자격</th>
                                                <th class="teacher_name">멘토교사 명</th>
                                                <th class="teacher_phone">멘토교사 연락처</th>
                                                <th class="create_tm" data-col="CREATE_TM">지원 날짜<button id="upbtn" class="updwbtn"  value="CREATE_TM" >▲</button><button id="dwbtn" class="updwbtn"  value="CREATE_TM" >▼</button></th>
                                                <th class="score" data-col="SCORE">평가 점수<button id="upbtn" class="updwbtn"  value="SCORE" >▲</button><button id="dwbtn" class="updwbtn" value="SCORE" >▼</button></th>
                                                <th class="dcmnt">서류 확인</th>
                                                <th class="result">결과</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${model.list}" varStatus="var">
                                            <tr>
                                                <td><input type="checkbox" value="${item.IDX}" name="chk_calc" data-id="${item.IDX}"  data-idx="${item.IDX}" data-phone="${item.PHONE}"></td>
                                                <td>${model.itemtotalcount - (var.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                                <td><a href="./${item.IDX}/update.do">${item.NAME}</a></td>
                                                <td>${item.SEX}</td>                                        
                                                <td>
                                                    <!--${item.ADDRESS_LOCAL}-->
                                                    <c:if test="${item.ADDRESS_LOCAL == '서울'}">서울</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '경기'}">경기</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '인천'}">인천</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '강원'}">강원</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '대전'}">대전</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '세종'}">세종</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '충남'}">충남</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '충북'}">충북</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '광주'}">광주</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '전남'}">전남</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '전북'}">전북</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '부산'}">부산</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '경남'}">경남</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '대구'}">대구</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '경북'}">경북</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '제주특별자치도'}">제주</c:if>
                                                </td>                                        
                                                <td>${item.BIRTH}</td>
                                                <td>${item.SCHOOL_NAME}</td>
                                                <td>
                                                    <!--${item.SCHOOL_TYPE}-->
                                                    <c:if test="${item.SCHOOL_TYPE == '초'}">초등학교</c:if>
                                                    <c:if test="${item.SCHOOL_TYPE == '중'}">중학교</c:if>
                                                    <c:if test="${item.SCHOOL_TYPE == '고'}">고등학교</c:if>
                                                </td>
                                                <td>
                                                    <!--${item.SCHOOL_YEAR}-->
                                                    <c:if test="${item.SCHOOL_YEAR == '4'}">4</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '5'}">5</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '6'}">6</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '7'}">1</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '8'}">2</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '9'}">3</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '10'}">1</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '11'}">2</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '12'}">3</c:if>
                                                </td>
                                                <td>${item.PHONE}</td>
                                                <td>${item.SUPPORT_AREA}</td>
                                                <td id="ELIGIBILITY">${item.ELIGIBILITY}</td>
                                                <td>${item.TEACHER_NAME}</td>
                                                <td>${item.TEACHER_PHONE}</td>
                                                <td class="td_08">${fn:substring(item.CREATE_TM,0,11)}</td>
                                                <td>
                                                    <script>
                                                        var socre = '${item.SCORE}';
                                                        if(socre.slice(-3) == '100'){
                                                            socre = socre.slice(-3);
                                                        }else if(socre.slice(-2,-1) == ':'){
                                                            socre = socre.slice(-1);
                                                        }else{
                                                            socre = socre.slice(-2);
                                                        }
                                                        document.write('<p>'+socre+'</p>');
                                                    </script>
                                                </td>
                                                <td> 
                                                    <form>
                                                        <button type="button" id="dcmnt_open${item.IDX}" class="dcmnt_open" 
                                                        	data-dcmnt_check="${item.DCMNT_CHECK}" data-id="${item.IDX }" 
                                                        	data-target="#modal${item.IDX}" name="dcmntCheckList" 
                                                        	<c:if test="${item.DCMNT_CHECK == null || empty item.DCMNT_CHECK || item.DCMNT_CHECK == '서류 대기'}"><%--서류 대기--%>style="background-color:#d5d5d5; color:#464646;"</c:if>
                                                        	<c:if test="${item.DCMNT_CHECK == '서류 확인' }"><%--서류 확인--%>style="background-color:#50ad64;color:#fff;"</c:if>
                                                        	<c:if test="${item.DCMNT_CHECK == '서류 확인 중' }"><%--서류 확인 중--%>style="background-color:#71a0ff; color:#fff;"</c:if> 
                                                        >
                                                            <c:if test="${item.DCMNT_CHECK == null || empty item.DCMNT_CHECK}">서류 대기</c:if>
                                                            <c:if test="${item.DCMNT_CHECK != null }">${item.DCMNT_CHECK }</c:if>
                                                        </button>
                                                    </form>
                                                </td>
                                                <div class="modal_fade" id="modal${item.IDX}" data-id="${item.IDX}" data-dcmnt_check="${item.DCMNT_CHECK}"> 
                                                    <div value="${item.IDX}" class="modal_content" id="dcmnt_check_box${item.IDX}">
                                                        <div class="docu_list">
                                                            <form id="hahaha${item.IDX}" action="./dcmnt_result">
                                                                <!-- 서류 명단 들어갈 부분 11 - 27 -->
                                                            </form>
                                                        </div>
                                                        <div class="modal_btn">
                                                            <button type="submit" id="modal_submit${item.IDX}" class="modal_submit modal_submit_ob modal_submit_01" value="저장" data-count="" data-id="${item.IDX}" data-dcmnt_check="${item.DCMNT_CHECK}" onclick="document.getElementById('modal${item.IDX}').style.display='none'">저장</button>
                                                            <button type="button" id="modal_close" class="modal_close modal_submit_ob"  data-id="${item.IDX}" onclick="$('#modal'+${item.IDX}+'').css('display','none');javascript:remove_dcmnt_modal(${item.IDX})">취소</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <td>
                                                    <!-- ${item.RESULT}-->
                                                    <c:if test="${item.RESULT == 'no_mento'}"><p class="pass_btn pass_btn_01">멘토 대기중</p></c:if>
                                                    <c:if test="${item.RESULT == 'pass'}"><p class="pass_btn pass_btn_02">합격</p></c:if>
                                                    <c:if test="${item.RESULT == 'fail'}"><p class="pass_btn pass_btn_03">불합격</p></c:if>
                                                    <c:if test="${item.RESULT == 'wating'}"><p class="pass_btn pass_btn_04">대기중</p></c:if>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!--페이지 넘버-->
                                <nav class="paging_number">
                                    <ul class="page">

										<c:if test="${model.page > 0}"> 
											<c:if test="${model.itempagestart-model.itemCount > 0}">
								                 <li id="first_a"><a href="javascript:pageChanged(0, 0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
								                 <li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
											</c:if>
											<c:if test="${model.itempagestart-model.itemCount <= 0}">
												<li id="first_a"><a href="javascript:pageChanged(0,0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
												<li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
											</c:if>
										</c:if>
							
										<c:if test="${model.page <= 0}">
											  <li id="first_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
										      <li id="prev_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
										</c:if>
										
										<c:if test="${model.itempageend > 0}">
											<c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
												<c:choose>
													<c:when test="${model.page == i }">
														<li class="number page_active"><a href="#">${i+1}</a></li>
													</c:when>
													<c:otherwise>
														<li class="number"><a href="javascript:pageChanged(${i}, ${model.itempageend});">${i+1}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:if>
							
										<c:if test="${model.itempageend == 0}">
											<li class="number">1</li>
										</c:if>
										<c:if test="${model.itempageend < 0}">
											<li class="number">1</li>
										</c:if>
										
										<c:if test="${model.itemCount < model.itemtotalcount/(model.page+1)}">
											<li id="next_a"><a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
										</c:if>
										<c:if test="${model.itemCount >= model.itemtotalcount/(model.page+1)}">
											<li id="next_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
										</c:if>
							
										<fmt:parseNumber var="lastPage" value="${(model.itemtotalcount % model.itemCount)==0? ((model.itemtotalcount/model.itemCount)-1) : (model.itemtotalcount / model.itemCount)}" integerOnly="true" />
										<c:choose>
											<c:when	test="${model.itemCount < model.itemtotalcount/(page+1)}">
											<li id="end_a"><a href="javascript:pageChanged(${model.itemtotalpage-1}, ${model.itemtotalpage-1});"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
												
											</c:when>
											<c:otherwise>
											<li id="end_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
											</c:otherwise>
										</c:choose>
										
										</ul>
                                </nav>
                                <!--페이지 넘버 end-->

                            </form>
                        </div>
                    </section>
                    <!--본문 내용 end-->
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <!--푸터-->
    <footer>
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/freshman.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.table2excel.js" type="text/javascript"></script>

</body>

</html>

<%@ include file="../include/footerJs.jsp" %>


<script>			
function pageChanged(page, endpage)
{
	if (page < 0) 
	{
		page = 0;
	}
	if (endpage < 0){
		endpage = 0;
	}
	if (page >= endpage) {
		page = endpage;
	}
	
	
	var URL = "list.do?PAGE="+page;

	
	if('${model.beforeDomain.ITEM_COUNT}}' == '')
	{
		URL = URL + "&ITEM_COUNT=" + '10';
	}else
	{
		URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
	}
	

	URL = URL + "&SEARCH_TEXT=" + encodeURI('${model.beforeDomain.SEARCH_TEXT}');
	URL = URL + "&SEARCH_TYPE=" + '${model.beforeDomain.SEARCH_TYPE}';

	
	if('${model.beforeDomain.LEVEL}' != ''){
		URL = URL + "&LEVEL=" + '${model.beforeDomain.LEVEL}';
	}
	
	if('${model.beforeDomain.RESULT}' != ''){
		URL = URL + "&RESULT=" + '${model.beforeDomain.RESULT}';
	}
	

	if('${model.beforeDomain.ADDRESS_LOCAL}' != ''){
		URL = URL + "&ADDRESS_LOCAL=" + '${model.beforeDomain.ADDRESS_LOCAL}';
	}
	
	if('${model.beforeDomain.SCHOOL_TYPE}' != ''){
		URL = URL + "&SCHOOL_TYPE=" + '${model.beforeDomain.SCHOOL_TYPE}';
	}
	
	if('${model.beforeDomain.TYPE}' != ''){
		URL = URL + "&TYPE=" + '${model.beforeDomain.TYPE}';
	}
	
	if('${model.beforeDomain.START_TM}' != ''){
		URL = URL + "&START_TM=" + '${model.beforeDomain.START_TM}';
	}
	if('${model.beforeDomain.END_TM}' != ''){
		URL = URL + "&END_TM=" + '${model.beforeDomain.END_TM}';
	}
	
	
	if('${model.beforeDomain.ENROLLMENT_STATUS}' != ''){
		URL = URL + "&ENROLLMENT_STATUS=" + '${model.beforeDomain.ENROLLMENT_STATUS}';
	}
	
	if('${model.beforeDomain.SUPPORT_GROUP}' != ''){
		URL = URL + "&SUPPORT_GROUP=" + '${model.beforeDomain.SUPPORT_GROUP}';
	}
	
	
	if('${model.beforeDomain.YEAR}' != ''){
		URL = URL + "&YEAR=" + '${model.beforeDomain.YEAR}';
	}
	
	if('${model.beforeDomain.LOCATION}' != ''){
		URL = URL + "&LOCATION=" + '${model.beforeDomain.LOCATION}';
	}
	
	if('${model.beforeDomain.SCHOOL_YEAR}' != ''){
		URL = URL + "&SCHOOL_YEAR=" + '${model.beforeDomain.SCHOOL_YEAR}';
	}
	
	if('${model.beforeDomain.UP}' != ''){
		URL = URL + "&UP=" + '${model.beforeDomain.UP}';
	}
	
	
	if('${model.beforeDomain.DOWN}' != ''){
		URL = URL + "&DOWN=" + '${model.beforeDomain.DOWN}';
	}
	
	if('${model.beforeDomain.SEX}' != ''){
		URL = URL + "&SEX=" + '${model.beforeDomain.SEX}';
	}
	if('${model.beforeDomain.ADDRESS_LOCAL}' != ''){
		URL = URL + "&ADDRESS_LOCAL=" + '${model.beforeDomain.ADDRESS_LOCAL}';
	}
	
	var haha = '';
	haha = '${model.beforeDomain.BIRTH}';
	if('${model.beforeDomain.BIRTH}' != ''){
		URL = URL + "&BIRTH=" + '${model.beforeDomain.BIRTH}';
	}
	if('${model.beforeDomain.SCHOOL_NAME}' != ''){
		URL = URL + "&SCHOOL_NAME=" + '${model.beforeDomain.SCHOOL_NAME}';
	}
	
	location.href = URL;
}


</script>

<script>
    //  서류확인 -----------------------------------------------------------------------------------
    $( document ).ready(function() {
        $(".modal_submit").click(function(){
            var data_id = $(this).attr('data-id');
            var formData = $('#hahaha'+data_id).serialize();
            console.log(formData);
            
            var size = $(".dcmntlist"+data_id).length;
            console.log(size);
            for(i=0; i < size; i++){

                if($("input[name='DCMNT_CHECK']").eq(i).is(':checked') == true){
                    var DCMNT_CHECK = "OK";
                }else{
                    var DCMNT_CHECK = "NO";
                }
                var insert_or_update = $("input[name='DCMNT_CHECK']").eq(i).attr('value');
                var DCMNT_NAME = $("input[name='DCMNT_NAME']").eq(i).attr('value');
                var MEMBER_IDX = data_id;

                if(insert_or_update == 'insert'){
                    $.ajax({
                        type : "POST",
                        url : "./Dcmnt_result_insert.do?",
                        cache : false,
                        data : ({
                            DCMNT_CHECK : DCMNT_CHECK,
                            DCMNT_NAME : DCMNT_NAME,
                            MEMBER_IDX : MEMBER_IDX,
                        }),
                        dataType : "json",
                        success : function(data,status,xhr){
                            alert("결과 성공");
                        }
                    });
                }else{
                    $.ajax({
                        type : "POST",
                        url : "./Dcmnt_result_update.do?",
                        cache : false,
                        data : ({
                            DCMNT_CHECK : DCMNT_CHECK,
                            DCMNT_NAME : DCMNT_NAME,
                            MEMBER_IDX : MEMBER_IDX,
                        }),
                        dataType : "json",
                        success : function(data,status,xhr){
                            alert("결과 성공");
                        }
                    });	
                }
            }

            var dcmnt_length = $(this).attr('data-count');
            console.log("서류갯수"+dcmnt_length);
            var data_id = $(this).attr('data-id');
            var check_length = $("input:checkbox[data-id = 'dcmntlist"+data_id+"']:checked").length; //체크된 개수
            console.log("체크된 갯수"+check_length);

            if(check_length == dcmnt_length){
                var DCMNT_CHECK = "서류 확인";
            }else if(check_length == "0"){
                var DCMNT_CHECK = "서류 대기";
            }else{
                var DCMNT_CHECK = "서류 확인 중";
            }


            var MEMBER_IDX = data_id;

            //서류 제출 변경 후 멤버 테이블 서류 제출 여부 변경
            $.ajax({
                type : "POST",
                url : "./Dcmnt_result_change.do?",
                cache : false,
                data : ({
                    DCMNT_CHECK : DCMNT_CHECK,
                    MEMBER_IDX : MEMBER_IDX,
                }),
                dataType : "json",
                success : function(data,status,xhr){
                    alert("결과 성공");
                }
            });

            if(check_length == dcmnt_length){
                var idx_check = $(this).attr('data-id');
                $('#dcmnt_open'+idx_check+'').html('서류 확인');
                
                //서류 확인
                $('#dcmnt_open'+idx_check+'').css({backgroundColor: "#50ad64", color: "#fff"});
            }else if(check_length == 0 || check_length == null){
                var idx_check = $(this).attr('data-id');
                $('#dcmnt_open'+idx_check+'').html('서류 대기');
                
                //서류 대기
                $('#dcmnt_open'+idx_check+'').css({backgroundColor: '#d5d5d5', color: "#464646"});
            }else if(check_length < dcmnt_length){
                var idx_check = $(this).attr('data-id');
                $('#dcmnt_open'+idx_check+'').html('서류 확인 중');

                //서류 확인 중
                $('#dcmnt_open'+idx_check+'').css({backgroundColor: '#71a0ff', color: "#fff"});
            }
        });
    });
	//////////////////////////////////////////////
	//	서류 취소 버튼 시 모달창 내용 삭제 01 - 05		//
	//////////////////////////////////////////////
	function remove_dcmnt_modal(date_de){
		console.log(date_de);
		$('#hahaha'+date_de).children().remove('input');
	}
	
	
    //서류 리스트 ajax------------------------------------------------------------------------------
    $(document).ready(function(){
        $(".dcmnt_open").click(function(){
        	$('.modal_fade').css('display','none');
            var ELIGIBILITY = $(this).parent().parent().prevAll("#ELIGIBILITY").html();
            var formData = "DCMNT_TYPE="+ELIGIBILITY;
            var dataid = $(this).attr('data-id');
            formData += "&IDX="+dataid;
            $.ajax({
                type : "POST",
                url : "./Dcmnt_list.do?",
                cache : false,
                data : formData,
                dataType : "json",
                success: function(data, status, xhr) {
                    console.log(data);
                    var html = "";
                    if(data.length > 0){
                        for(i=0; i<data.length; i++){
                            if(data[i].member_IDX != null){
                                if(data[i].dcmnt_CHECK == "OK"){
                                    html += "<input type='checkbox' class='dcmntlist"+dataid+"' data-id='dcmntlist"+dataid+"' name='DCMNT_CHECK' value='update' checked>";
                                }else{
                                    html += "<input type='checkbox' class='dcmntlist"+dataid+"' data-id='dcmntlist"+dataid+"' name='DCMNT_CHECK' value='update'>";
                                }
                            }else{
                                if(data[i].dcmnt_CHECK == "OK"){
                                    html += "<input type='checkbox' class='dcmntlist"+dataid+"' data-id='dcmntlist"+dataid+"' name='DCMNT_CHECK' value='insert' checked>";
                                }else{
                                    html += "<input type='checkbox' class='dcmntlist"+dataid+"' data-id='dcmntlist"+dataid+"' name='DCMNT_CHECK' value='insert'>";
                                }	
                            }
                            html += data[i].dcmnt_NAME;
                            html += "<input type='hidden' name='DCMNT_NAME' value='"+data[i].dcmnt_NAME+"'>";
                            html += "</br>";
                        }

                        $("#hahaha"+dataid+"").html(html);
                    }
                    $('#modal'+dataid+'').css('display','block');
                    $('#modal_submit'+dataid+'').attr('data-count',data.length);
                },
                error : function(xhr,status,error){
                    if(xhr.status == 404){
                        alert("오류!!");
                    }
                }
            });
        });
    });

    // 정렬 
    $(document).ready(function(){
        $(".updwbtn").click(function(){
            if(($(this).attr('id')) == 'upbtn'){
                UPDWVAL = $(this).val();
                URL = './list.do';
                URL = URL + "?PAGE=0";
                if($('#ITEM_COUNT').val() == '') {
                    URL = URL + "&ITEM_COUNT=" + '10';
                }else {
                    URL = URL + "&ITEM_COUNT=" + $('#ITEM_COUNT').val();
                }
                
                URL = URL + "&RESULT="+$('#RESULT').val();
                URL = URL + "&ADDRESS_LOCAL=" + $('#ADDRESS_LOCAL').val();
                URL = URL + "&SCHOOL_TYPE=" +$('#SCHOOL_TYPE').val();
                URL = URL + "&SCHOOL_YEAR=" +$('#SCHOOL_YEAR').val();
                URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
                URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
                URL = URL + "&UP=" + UPDWVAL;
                location.href = URL;
            }else{
                UPDWVAL = $(this).val();
                URL = './list.do';
                URL = URL + "?PAGE=0";
                if($('#ITEM_COUNT').val() == '') {
                    URL = URL + "&ITEM_COUNT=" + '10';
                }else {
                    URL = URL + "&ITEM_COUNT=" + $('#ITEM_COUNT').val();
                }
                
                URL = URL + "&RESULT="+$('#RESULT').val();
                URL = URL + "&ADDRESS_LOCAL=" + $('#ADDRESS_LOCAL').val();
                URL = URL + "&SCHOOL_TYPE=" +$('#SCHOOL_TYPE').val();
                URL = URL + "&SCHOOL_YEAR=" +$('#SCHOOL_YEAR').val();

                URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
                URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
                URL = URL + "&DOWN=" + UPDWVAL;
                location.href = URL;
            }
        });
    });

    // 테이블  ==============================================================================
    /*
    var myTable = document.getElementById( "gcTable" ); 
    var replace = replacement( myTable ); 
    function sortTD( index ){    replace.ascending( index );    } 
    function reverseTD( index ){    replace.descending( index );    } 

    $(function(){
        $("#tablesort").dataTable();
    });
    
    $( document ).ready(function() {
        $("#gcTable").tablesorter({sortList:[[0,0],[1,0]]});
    });

    $(document).ready( function () {
        $('#gcTable').DataTable();
    });
    */

    $( document ).ready(function() {
        var oldVal = "";
        $("#sms_text").on("change keyup paste", function() {
            var currentVal = $(this).val();
            if(currentVal == oldVal) {
                return;
            }

            oldVal = currentVal;
            $('#sms_text_size').text(oldVal.length);
        });
        $("#RESERVATION").change(function(){
            if($("#RESERVATION").is(":checked")){
                $("#RESERVATION_TM").show();
                $("#RESERVATION_TM2").hide();    
            }else{
                $("#RESERVATION_TM").hide();
                $("#RESERVATION_TM2").show();
            }
        });
    });

    $(document).on("click", "#chk_calc_all", function(e) {
        if ($(this).prop('checked')) {
            $('input[name="chk_calc"]').prop('checked', true);
        } else {
            $('input[name="chk_calc"]').prop('checked', false);
        }
    });

    $("#bootstrap-data-table tr").click(function(){     
        console.log($(this).data("id"));
        if($(this).data("role") == 'button') {
            var URL = './'+$(this).data("id")+'/update.do?';
            URL = URL + "PAGE=${model.beforeDomain.PAGE}";
            URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
            URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
            location.href = URL;
        }	    
    });

    function searchBtnClick() {
        URL = './list.do';
        URL = URL + "?PAGE=0";
        
        if($('#ITEM_COUNT').val() == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + $('#ITEM_COUNT').val();
        }
        
        URL = URL + "&RESULT="+$('#RESULT').val();
        URL = URL + "&ADDRESS_LOCAL=" + $('#ADDRESS_LOCAL').val();
        URL = URL + "&SCHOOL_TYPE=" +$('#SCHOOL_TYPE').val();
        URL = URL + "&SCHOOL_YEAR=" +$('#SCHOOL_YEAR').val();
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        location.href = URL;
    }

    //합격자 일괄변경
    function resultChangedArr() {
        /*
        if($('#RESULT2').val() == "") {
            alert('결과를 선택 해주세요.');
            return;	
        }
        */
        updateArrIdx = "";
        
        $("input[name=chk_calc]").each(function() {
            var chk = $(this).is(":checked");
            console.log(chk);
            if(chk == true) {
                updateArrIdx = updateArrIdx + $(this).data("id") + ",";
            }

        }); 

        if(updateArrIdx == "") {
            alert('회원을 선택 해주세요.');
            return;	
        }

        var URL = './TypeToTextUpdateArr.do?';

        //var formData = $("#updateform").serialize();
        var formData = "SEARCH_TYPE=RESULT";
        formData += "&SEARCH_TEXT="+$('#RESULT2').val();
        formData += "&IDX="+updateArrIdx;
        
        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : formData,
            success: function(result) {
                if(result.indexOf("true") > -1) {
                    alert('성공하였습니다.');
                    //$('.modal').click();
                    window.location.reload();
                }else {
                    alert('실패 하였습니다.');
                    //$('.modal').click();
                }
            }
        });
    }
    //엑셀 다운
    function excelDown() {
        var st = $(":input:radio[name=excelDownType]:checked").val();
        //console.log(st);
        if("PASS_STUDENT" == st){
            $('#iframe2').show();
            $('#iframeDiv').attr('src', '${pageContext.request.contextPath}/admin/member_re/passExcelDown.do');
            setTimeout(function() {
                $('#iframe2').hide();
            }, 500);        
        }else{
            location.href = '${pageContext.request.contextPath}/admin/member_re/excelDown.do';	
        }
    }

    // 정렬 _ 숫자
    function sortingNumber( a , b ){  
        
        //if ( $('#ITEM_COUNT').val() == a && $('#ITEM_COUNT').val() == b ) return a - b; 
        if ( typeof a == "number" && typeof b == "number" ) return a - b; 
        
        // 천단위 쉼표와 공백문자만 삭제하기.  
        var a = ( a + "" ).replace( /[,\s\xA0]+/g , "" ); 
        var b = ( b + "" ).replace( /[,\s\xA0]+/g , "" ); 
        var numA = parseFloat( a ) + ""; 
        var numB = parseFloat( b ) + ""; 

        if ( numA == "NaN" || numB == "NaN" || a != numA || b != numB ) return false; 
        
        return parseFloat( a ) - parseFloat( b ); 
    } 


    /* 정렬 _ changeForSorting() : 문자열 바꾸기. */ 

    function changeForSorting( first , second ){  

        // 문자열의 복사본 만들기. 
        var a = first.toString().replace( /[\s\xA0]+/g , " " ); 
        var b = second.toString().replace( /[\s\xA0]+/g , " " ); 
        var change = { first : a, second : b }; 

        if ( a.search( /\d/ ) < 0 || b.search( /\d/ ) < 0 || a.length == 0 || b.length == 0 ) return change; 
        var regExp = /(\d),(\d)/g; // 천단위 쉼표를 찾기 위한 정규식. 

        a = a.replace( regExp , "$1" + "$2" ); 
        b = b.replace( regExp , "$1" + "$2" ); 

        var unit = 0; 
        var aNb = a + " " + b; 
        var numbers = aNb.match( /\d+/g ); // 문자열에 들어있는 숫자 찾기 

        for ( var x = 0; x < numbers.length; x++ ){ 
            var length = numbers[ x ].length; 
            if ( unit < length ) unit = length; 
        } 

        var addZero = function( string ){ // 숫자들의 단위 맞추기 
            var match = string.match( /^0+/ ); 
            if ( string.length == unit ) return ( match == null ) ? string : match + string; 
            var zero = "0"; 
            for ( var x = string.length; x < unit; x++ ) string = zero + string; 
            return ( match == null ) ? string : match + string; 
        }; 

        change.first = a.replace( /\d+/g, addZero ); 
        change.last = b.replace( /\d+/g, addZero ); 

        return change; 
    } 

    /* 정렬 _ byLocale() */ 
    //평가점수
    function byLocale(){ 
        var compare = function( a , b ){ 
            var sorting = sortingNumber( a , b ); 

            if ( typeof sorting == "number" ) return sorting; 

            var change = changeForSorting( a , b ); 

            var a = change.first; 
            var b = change.second; 

            return a.localeCompare( b ); 
        }; 

        var ascendingOrder = function( a , b ){  return compare( a , b );  }; 
        var descendingOrder = function( a , b ){  return compare( b , a );  }; 

        return { ascending : ascendingOrder, descending : descendingOrder }; 
    } 


    /* 정렬 _  replacement() */ 
    function replacement( parent ){  
        var tagName = parent.tagName.toLowerCase(); 
        if ( tagName == "table" ) parent = parent.tBodies[ 0 ]; 
        tagName = parent.tagName.toLowerCase(); 
        if ( tagName == "tbody" ) var children = parent.rows; 
        else var children = parent.getElementsByTagName( "li" ); 

        var replace = { 
            order : byLocale(), 
            index : false, 
            array : function(){ 
                var array = [ ]; 
                for ( var x = 0; x < children.length; x++ ) array[ x ] = children[ x ]; 
                return array; 
            }(), 
            checkIndex : function( index ){ 
                if ( index ) this.index = parseInt( index, 10 ); 
                var tagName = parent.tagName.toLowerCase(); 
                if ( tagName == "tbody" && ! index ) this.index = 0; 
            }, getText : function( child ){ 
                if ( this.index ) child = child.cells[ this.index ]; 
                return getTextByClone( child ); 
            }, setChildren : function(){ 
                var array = this.array; 
                while ( parent.hasChildNodes() ) parent.removeChild( parent.firstChild ); 
                for ( var x = 0; x < array.length; x++ ) parent.appendChild( array[ x ] ); 
            }, ascending : function( index ){ // 오름차순 
                this.checkIndex( index ); 
                var _self = this; 
                var order = this.order; 
                var ascending = function( a, b ){ 
                    var a = _self.getText( a ); 
                    var b = _self.getText( b ); 
                    return order.ascending( a, b ); 
                }; 
                this.array.sort( ascending ); 
                this.setChildren(); 
            }, descending : function( index ){ // 내림차순
                this.checkIndex( index ); 
                var _self = this; 
                var order = this.order; 
                var descending = function( a, b ){ 
                    var a = _self.getText( a ); 
                    var b = _self.getText( b ); 
                    return order.descending( a, b ); 
                }; 
                this.array.sort( descending ); 
                this.setChildren(); 
            } 
        }; 
        return replace; 
    } 

    function getTextByClone( tag ){  
        var clone = tag.cloneNode( true ); // 태그의 복사본 만들기. 
        var br = clone.getElementsByTagName( "br" ); 
        while ( br[0] ){ 
            var blank = document.createTextNode( " " ); 
            clone.insertBefore( blank , br[0] ); 
            clone.removeChild( br[0] ); 
        } 
        var isBlock = function( tag ){ 
            var display = ""; 
            if ( window.getComputedStyle ) display = window.getComputedStyle ( tag, "" )[ "display" ]; 
            else display = tag.currentStyle[ "display" ]; 
            return ( display == "block" ) ? true : false; 
        }; 
        var children = clone.getElementsByTagName( "*" ); 
        for ( var x = 0; x < children.length; x++){ 
            var child = children[ x ]; 
            if ( ! ("value" in child) && isBlock(child) ) child.innerHTML = child.innerHTML + " "; 
        } 
        var textContent = ( "textContent" in clone ) ? clone.textContent : clone.innerText; 
        return textContent; 
    } 
    
    //사용자들 전체 마감
    function AllComplete(){
        if(confirm("정말로 현 신입생 지원을 마감 하시겠습니까?")){
            var URL = '${pageContext.request.contextPath}/admin/member_re/AllComplete.do';
            $.ajax({
                type : "POST",
                url : URL,
                cache : false,
                success: function(result) {
                    alert("마감 성공!!");
                }
            });
        }else{
            return;
        }
    }
</script>


<div id="iframe2" style="display:none">
    <iframe id="iframeDiv" src="#" width="750" height="800" left="300" top="150"></iframe>
</div>