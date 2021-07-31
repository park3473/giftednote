<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->
<!--공통상단-->
<%@ include file="../../include/header.jsp" %>
<!--공통상단 끝-->


<style>
    a {
        color: #ffffff;
        text-decoration: none !important;
    }
    .test_div > .test_p{
    	display:none;
    }
    #detail_show > .test_p{
    	display:block;
    }
	
	.tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-0pky{border-color:#3364b1;}
	table{
	text-align : center;
	width:100%;
	}
	
	.tbl_th{
		background-color : #d0dcef;
	}
	.join_table {
    height: auto;
    max-height: 720px;
	}
	
	.table_two {
	    width: -webkit-calc((100% - 51px) / 2);
	    width: calc((100% - 51px) / 2);
	    margin-right: 50px;
	    float: left;
	}
	
	.all_table {
	    width: 100%;
	    height: auto;
	    position: relative;
	}
	
	.table_two:last-of-type {
	    margin-right: 0;
	}
		
	.all_table_3 .all_table_box tr th {
	    background-color: #f7f7f7;
	    border-bottom: 1px solid #dedede;
	    border-right: 1px solid #dedede;
	    padding: 10px 5px;
	    letter-spacing: -1px;
	    text-align: center;
	    font-size: 0.938rem;
	}
	
	.all_table_3 .all_table_box tr th:last-of-type {
	    border-right: 0;
	}
	
	.all_table_3 .all_table_box tr td {
	    border-bottom: 1px solid #dedede;
	    padding: 10px 15px;
	    text-align: center;
	    color: #595959;
	    letter-spacing: -.5px;
	}
	
	.all_table_3 .all_table_box tr td {
	    border-right: 1px solid #dedede;
	}
	
	.all_table_3 .all_table_box tr td:last-of-type {
	    border-right: 0;
	}
	
	.all_table_3 .all_table_box tr:hover {
	    background-color: #fdfdfd;
	}
		
	
	</style>
<div style="display:none">
	<input type="hidden" value="${fn:length(model.list)}" id="teamcount">
	<input type="hidden" value="${model.lab_id }" id="_MAIN_LAB_ID">
</div>
<section id="new_sc" class="sc_wrap">
        <div class="sc_area">
            <div class="sc_con">
                <div class="sc_size">
					<%@ include file="../../include/top.jsp" %>

                    <!-- 본문 내용-->
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>연구노트</li>
                                    <li>학생연구역량평가</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title" style="margin-bottom:30px;">
                                        <div class="line"><span></span></div>
                                        <h2>▣ 평가 방법</h2>
                                    </div>
                                    <div style="margin-bottom:40px;">
                                    	<p>- 지도한 학생 개개인에 대해서 세부 항목에 대해 각 영역별로 연구역량을 평가해주시기 바랍니다.</p>
                                    	<p>- 모든 항목에 대해 1~5점으로 표기해주시고, 모든 영역 점수가 동일하거나 개개인의 평가 결과가 동일한 경우에는 관리부서로부터 평가지를 재작성하도록 요청받을 수 있습니다.</p>
                                    </div>
                                    
                                    <div class="all_title" style="margin-bottom:20px;">
                                        <div class="line"><span></span></div>
                                        <h2>▣ 작성 항목 및 기준</h2>
                                        <div class="join_table">
                                        <div class="all_table all_table_3">
                                        <table class="all_table_box">
                                                <thead>
                                                    <tr>
                                                        <th class="subject">항목</th>
                                                        <th class="group_infro">내용</th>
                                                        <th class="group_name">평가</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            연구역량 기초 역량
                                                        </td>
                                                        <td>
                                                           <ul>
                                                           		<li>연구 윤리에 대한 이해</li>
                                                           		<li>실험실 안전 관리</li>
                                                           		<li>연구 참여자간의 소통능력</li>
                                                           </ul>
                                                        </td>
                                                        <td rowspan="4">
                                                            1~5점<br>Likert 척도
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            사전 연구
                                                        </td>
                                                        <td>
                                                            <ul>
                                                           		<li>지도자(멘토)연구 분야에 대한 이해</li>
                                                           		<li>연구 주제 파악 및 전공 지식에 대한 이해</li>
                                                           		<li>실험설계 및 연구활동 계획 수립 능력</li>
                                                           </ul>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            집중 연구
                                                        </td>
                                                        <td>
                                                            <ul>
                                                           		<li>실험 주제 설정 및 연구 수행</li>
                                                           		<li>데이터 정리와 분석,연구노트 작성 능력</li>
                                                           		<li>연구결과에 대한 피드백과 비판적 검토 능력</li>
                                                           </ul>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            사후 연구
                                                        </td>
                                                        <td>
                                                            <ul>
                                                           		<li>데이터 결과 해석 (타당성,논리성,체계성)</li>
                                                           		<li>데이터 시각화 및 표현 능력</li>
                                                           		<li>연구 결과 및 가치 이해</li>
                                                           </ul>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                          </div>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>학생연구역량평가</h2>
                                    </div>
                                    <!-- 공통타이틀 -->

                                    <!-- 공통서치 -->
                                    <div class="meeting_search">

                                        <div id="meeting_form_btn" class="meeting_add floatR" >
                                            <a onclick="javascript:srce_insert(${fn:length(model.list)})">저장</a>
                                        </div>

                                    </div>
                                    <!-- 공통서치 end-->

                                    <!-- 양식 리스트 -->
                                    <div>
										<table class="tg" id="SRCE_TABLE">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0lax">구분</th>
											    <th class="tg-0lax">연구역량</th>
											    <th class="tg-0lax">평가 문항</th>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax" id="teamname_${Status.index }" idx="${item.ur_id }" name="${item.std_name }">${item.std_name }</th>
											    </c:forEach>
											  </tr>
											</thead>
											<tbody>
											  <tr>
											    <td class="tg-0lax" rowspan="6">기초역량<br></td>
											    <td class="tg-0lax" rowspan="2">연구윤리</td>
											    <td class="tg-0lax">참고 문헌과 인용표기를 표준 형식에 따라 표기할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">실험결과와 데이터, 통계를 위조, 변조하지 않고 정확하게 기술할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="2">실험실 안전</td>
											    <td class="tg-0lax">실험실에서 응급상황이 생겼을 때 대처 방법을 알고 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">실험 후, 정리 정돈과 청결 상태를 잘 유지할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="2">소통 능력</td>
											    <td class="tg-0lax">지도교수 및 멘토, 동료들과 꾸준히 대화하여 연구 수행결과를 증진하기 위해 노력할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">지도교수 및 멘토, 동료에게 연구에 대한 의견을 적극적으로 제시할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="6">사전연구</td>
											    <td class="tg-0lax" rowspan="2">주제 파악</td>
											    <td class="tg-0lax">멘토의 연구 분야에 관한 내용과 연구주제를 파악할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">멘토의 연구 분야와 관련된 연구주제를 조사할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="2">전공 지식 함양</td>
											    <td class="tg-0lax">각 연구 주제별로 장단점을 적절하게 파악할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">실험 기기(도구)의 용도를 정확하게 조사하고, 실험에 사용되는 핵심 기기(도구)를 잘 다룰 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="2">실험설계</td>
											    <td class="tg-0lax">변인통제 계획에 맞는 통제변인, 조작변인, 종속 변인을 설정할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">변인 간의 관계를 파악하고, 실험(연구) 상황에서 변인을 통제할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="6">집중연구</td>
											    <td class="tg-0lax" rowspan="2">실험 수행</td>
											    <td class="tg-0lax">연구주제를 해결할 수 있는 세부 실험주제를 설정할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">실제로 실험(연구)에 사용될 준비물과 기초자료를 제시할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="2">데이터 정리와 분석</td>
											    <td class="tg-0lax">연구주제, 준비물, 실험 결과를 정리할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">날짜별(회차별) 관찰/실험기록을 연구 노트에 작성할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="2">오류 판단</td>
											    <td class="tg-0lax">실험과정과 결과에 대하여 지속적으로 비판적인 검토를 할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">멘토의 피드백을 고려하여 실험을 진행할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="6">사후연구</td>
											    <td class="tg-0lax" rowspan="2">결과 해석</td>
											    <td class="tg-0lax">각 데이터를 적절하게 해석할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">실험 결과에 타당한 결론을 도출할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="2">표현 능력</td>
											    <td class="tg-0lax">데이터에 대한 설명을 간결하고, 이해하기 쉽게 작성할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">데이터를 시각적으로 잘 전달할 수 있도록 자료를 가공할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax" rowspan="2">발표 능력</td>
											    <td class="tg-0lax">연구 결과를 논리적으로 잘 설명할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}">
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											  <tr>
											    <td class="tg-0lax">연구의 가치, 유용성, 기대효과 등을 설명할 수 있는가?</td>
											    <c:forEach items="${model.list }" var="item" varStatus="Status">
													<th class="tg-0lax">
														<select name="SCORE" id="${item.NAME }_${Status.index}" >
															<option value="">선택해주세요</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</th>
											    </c:forEach>
											  </tr>
											</tbody>
										</table>
									</div>
                                    </div>
                                    <!-- 양식 리스트 end-->

                                </div>
                                <!-- 진행중인 회의 end -->
                            </div>

                        </div>
                    </div>
                    <!-- 본문 내용 end-->

                </div>
            </div>
        </div>
    </section>
<!--공통하단-->
<%@ include file="../../include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
/*
alert('${ip_session}');
if('${check}' == 'fail'){
	alert("실패");
}else{
	alert("성공")
}
*/
	$('select').attr('what_set','insert');
	var teamcount = $('#teamcount').val();
	for(x = 0; x < teamcount; x++){
		AJAX(x);
		
	}
	
	function AJAX(x){
		var IDX = $('#teamname_'+x).attr('idx');
		var lab_id = $('#_MAIN_LAB_ID').val();
		//console.log(IDX);
		$.ajax({
			type : "POST",
			url : "/srce/srce.do?",
			cache : false,
			data : ({
				lab_id : lab_id,
				IDX : IDX,
			}),
			dataType : "json",
			success: function(data , status, xhr){
				var check = data[0];
				//console.log(data[0]);
				if(check != "" && check != null){
					const srce_table = document.getElementById('SRCE_TABLE');
					console.log(data.length);
					for(y = 1; y < data.length+1; y++){
							console.log(data);
							console.log(data.length);
							console.log(data[y-1].NAME);
							var line = data[y-1].S_IDX;
							var z = 0;
							if((line-1) == 0 || (line-1)%6 == 0){
								z = 3+x;
							}else if(line%2 == 0){
								z = 1+x;
							}else if(line%2 == 1){
								z = 2+x;
							}
							console.log("x"+x+"y"+line+"z"+z);
							console.log(data[(y-1)].SCORE);
							console.log(y-1);
							console.log(line);
							srce_table.rows[line].cells[z].getElementsByTagName('select').namedItem('SCORE').value = data[(y-1)].SCORE;
							srce_table.rows[line].cells[z].getElementsByTagName('select').namedItem('SCORE').setAttribute('what_set','update');
						}

					$('#teamname_'+x).attr('what_set','update');
				}else{
					$('#teamname_'+x).attr('what_set','insert');
				}
				}
				
			})
			
	}
	
	
	function srce_insert(teamcount){
		for(x = 0 ; x < teamcount ; x++){
			for(y = 1; y < 25; y++){
				const srce_table = document.getElementById('SRCE_TABLE');
				var z = 0;
				if((y-1) == 0 || (y-1)%6 == 0){
					z = 3+x;
				}else if(y%2 == 0){
					z = 1+x;
				}else if(y%2 == 1){
					z = 2+x;
				}
				var SCORE = srce_table.rows[y].cells[z].getElementsByTagName('select').namedItem('SCORE').value;
				var what = srce_table.rows[y].cells[z].getElementsByTagName('select').namedItem('SCORE').getAttribute('what_set');
				if(SCORE != ''){
					if(what == 'update'){
						//console.log("update"+SCORE)
						var lab_id = $('#_MAIN_LAB_ID').val();
						var SCORE = SCORE;
						var IDX = $('#teamname_'+x).attr('idx');
						var S_IDX = y;
						var NAME = $('#teamname_'+x).attr('name');
						$.ajax({
							type : "POST",
							url : "/srce/setUpdate.do?",
							cache : false,
							data : ({
								IDX : IDX,
								lab_id : lab_id,
								S_IDX : S_IDX,
								NAME : NAME,
								SCORE : SCORE
							}),
							dataType : "json",
							success: function(data , status, xhr){
								console.log(data);
								
								}
						})
					}else if(what == 'insert'){
						//console.log("insert"+SCORE)
						var lab_id = $('#_MAIN_LAB_ID').val();
						var SCORE = SCORE;
						var IDX = $('#teamname_'+x).attr('idx');
						var S_IDX = y;
						var NAME = $('#teamname_'+x).attr('name');
						$.ajax({
							type : "POST",
							url : "/srce/setInsert.do?",
							cache : false,
							data : ({
								IDX : IDX,
								lab_id : lab_id,
								S_IDX : S_IDX,
								NAME : NAME,
								SCORE : SCORE
							}),
							dataType : "json",
							success: function(data , status, xhr){
								console.log(data);
								}
						})
					}else{
						console.log('오류!')
					}
				}
			}
		}
	}
	
</script>
<!-- js 끝 -->