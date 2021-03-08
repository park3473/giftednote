<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
</head>

<style>
    #new_sub_hd .title>p:first-of-type {
    display: none;
    }
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
                            <h2>커뮤니티</h2>
                        </div>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">공지사항 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/12/list.do">FAQ<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/11/list.do">알림마당 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/check.do">신입생 지원 모집 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">


                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>학생 (지원서)</p>
                                    </div>
                                   	 <form action="./update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data" autocomplete="off">
                                        <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden" name="IDX" value="${model.view.IDX}" />
                                        <input type="hidden" name="PASSWORD" value=${model.view.PASSWORD }>
                                    <div class="member_input_wrap" style="padding: 0; margin-bottom: 10px;">
                                        <ul class="member_input nanumgothic">
                                            <li>
                                                <span class="list_t">이름<b class="relate_c">＊</b></span>
                                                <span class="list_t">${model.view.NAME}</span>
                                                <label class="blind" for="NAME">이름</label>
                                           
                                            </li>
                                            
                                            <!--2020년3월27일 추가개발-->
                                            <li>
                                            	<c:if test="${model.view.SEX == '남자' }">
	                                            	<span class="list_t">성별<b class="relate_c">＊</b></span>
	                                                <input type="radio" name="SEX" id="man" value="남자" checked>
	                                                <label for="man">남자</label>
	                                            </c:if>
	                                            <c:if test="${model.view.SEX == '여자' }">
	                                            	<span class="list_t">성별<b class="relate_c">＊</b></span>
	                                                <input type="radio" name="SEX" id="woman" value="여자" checked>
	                                                <label for="woman">여자</label>
	                                            </c:if>
	                                            <c:if test="${model.view.SCHOOL_TYPE == '초' }">
	                                                <span class="list_t">학교급<b class="relate_c">＊</b></span>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE1" value="초" checked>
	                                                <label for="exist">초</label>
	                                             </c:if>
	                                             <c:if test="${model.view.SCHOOL_TYPE == '중' }">
	                                                <span class="list_t">학교급<b class="relate_c">＊</b></span>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE2" value="중" checked>
	                                                <label for="none">중</label>
	                                             </c:if>
	                                             <c:if test="${model.view.SCHOOL_TYPE == '고' }">
	                                                <span class="list_t">학교급<b class="relate_c">＊</b></span>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE3" value="고" checked>
	                                                <label for="none">고</label>
	                                             </c:if>
                                            </li>
                                            <!--2020년3월27일 추가개발 end-->
                                            <!-- 2020년 11 월 05일 추가개발 start -->
                                            <li>
                                                    <span class="list_t">멘토교사 여부<b class="relate_c">＊</b></span>
                                                    <input type="radio" name="TEACHER_TYPE" id="TEACHER_TYPE1" value="확정" <c:if test="${model.view.TEACHER_TYPE == '확정'}">checked</c:if><c:if test="${model.view.TEACHER_TYPE == '미확정'}">disabled</c:if> >
                                                    <label for="exist">있음</label>
                                                    <input type="radio" name="TEACHER_TYPE" id="TEACHER_TYPE2" value="미확정" <c:if test="${model.view.TEACHER_TYPE == '미확정'}">checked</c:if><c:if test="${model.view.TEACHER_TYPE == '확정'}">disabled</c:if> >
                                                    <label for="none">없음</label>
		                                            <div class="member_input_wrap" style="padding: 0;margin-bottom: 0;">
		                                              	<ul class="member_input" id="techerDiv" style="display:none;border: 0px;margin-bottom: 0px;">
		                                                    <li style="border-top: 1px solid #d5dbe7;">
		                                                        <span class="list_t">멘토교사명<b class="relate_c">＊</b></span>
		                                                        <span class="list_t">${model.view.TEACHER_NAME}</span>
		                                                       	<label class="blind" for="TEACHER_NAME">멘토교사명</label>
		                                                      	<span class="list_t">연락처<b class="relate_c">＊</b></span>
		                                                      	<span class="list_t">${model.view.TEACHER_PHONE}</span>
		                                                        <label class="blind" for="TEACHER_PHONE"></label>
		                                                        <span class="relate_c">연락처 입력시 -없이 입력</span>
		                                                 	</li>
		                                       			</ul>
		                                 			</div>
		                                 		
                                 			</li>
                                 			<li>
                                 				<span class="list_t">학교 명<b class="relate_c">＊</b></span>
                                 				<span class="list_t">${model.view.SCHOOL_NAME }</span>
                                 				<label for="SCHOOL_NAME"></label>
                                 			</li>
                                            <!-- 2020년 11 월 05일 추가 개발 end -->
                                            <li>
                                                <span class="list_t">학년<b class="relate_c">*</b></span>
                                                <c:if test="${model.view.SCHOOL_YEAR == '4'}">
                                       				<span class="list_t">초등학교 4학년</span>
                                                </c:if>
                                                <c:if test="${model.view.SCHOOL_YEAR == '5'}">
                                       				<span class="list_t">초등학교 5학년</span>
                                                </c:if>
                                                <c:if test="${model.view.SCHOOL_YEAR == '6'}">
                                       				<span class="list_t">초등학교 6학년</span>
                                                </c:if>
                                                <c:if test="${model.view.SCHOOL_YEAR == '7'}">
                                       				<span class="list_t">중학교 1학년</span>
                                                </c:if>
                                                <c:if test="${model.view.SCHOOL_YEAR == '8'}">
                                       				<span class="list_t">중학교 2학년</span>
                                                </c:if>
                                                <c:if test="${model.view.SCHOOL_YEAR == '9'}">
                                       				<span class="list_t">중학교 3학년</span>
                                                </c:if>
                                                <c:if test="${model.view.SCHOOL_YEAR == '10'}">
                                       				<span class="list_t">고등학교 1학년</span>
                                                </c:if>
                                                <c:if test="${model.view.SCHOOL_YEAR == '11'}">
                                       				<span class="list_t">고등학교 2학년</span>
                                                </c:if>
                                                <c:if test="${model.view.SCHOOL_YEAR == '12'}">
                                       				<span class="list_t">고등학교 3학년</span>
                                                </c:if>
                                                <label class="blind" for="SCHOOL_YEAR">학년</label>
                                                <span class="list_t">반<b class="relate_c">＊</b></span>
                                                <span class="list_t">${model.view.SCHOOL_GROUP }</span>
                                                <label class="blind" for="SCHOOL_GROUP"></label>
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일<b class="relate_c">＊</b></span>
                                                <span class="list_t">${model.view.BIRTH }</span>
                                                <label class="blind" for="BIRTH">생년월일</label>
                                            </li>
                                            <li>
                                                <span class="list_t">집주소<b class="relate_c">＊</b></span>
                                                <span class="list_t">${model.view.ZIPCODE }</span>
                                                <label class="blind" for="ZIPCODE">집주소</label>
                                                <div class="address_02">
                                                	<span class="list_t list_t_address">${model.view.ADDRESS }</span>
                                                    <label class="blind" for="ADDRESS"></label>
                                                    <span class="list_t">${model.view.ADDRESS_DETAIL }</span>
                                                    <label class="blind" for="ADDRESS_DETAIL"></label>
                                                    <input class="input_address" type="hidden" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL" value="${model.view.ADDRESS_LOCAL }" >
                                                    <label class="blind" for="ADDRESS"></label>
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처<b class="relate_c">＊</b></span>
                                                <span class="list_t">${model.view.PHONE }</span>
                                                <label class="blind" for="PHONE"></label>
                                            </li>
                                            <li>
                                                <span class="list_t">보호자 연락처</span>
                                                <span class="list_t">${model.view.TEL }</span>
                                                <label class="blind" for="TEL">보호자 연락처</label>
                                            </li>
                                            <li>
                                                <span class="list_t">이메일<b class="relate_c">＊</b></span>
                                                <span class="list_t">${model.view.EMAIL }</span>
                                                <label class="blind" for="EMAIL"></label>
                                            </li>
                                            <li>
                                                <span class="list_t">지원 유형<b class="relate_c">＊</b></span>
                                                <span class="list_t">${model.view.SUPPORT_AREA}</span>
                                                <label class="blind" for="SUPPORT_AREA">지원 유형</label>
                                                <span class="list_t">지원 자격<b class="relate_c">＊</b></span>
                                                <span class="list_t">${model.view.ELIGIBILITY}</span>
                                                <label class="blind" for="ELIGIBILITY"></label>
                                            </li>
                                            <li>
                                                <span class="list_t">영재 교육 경험 여부<b class="relate_c">＊</b></span>
                                                <c:if test="${model.view.EXP == '유'}">
                                                	<input type="radio" name="EXP" id="exist" value="유" <c:if test="${model.view.EXP == '유'}">checked</c:if>>
                                                	<label for="exist">유</label>
                                                </c:if>
                                                <c:if test="${model.view.EXP == '무'}">
                                                	<input type="radio" name="EXP" id="none" value="무" <c:if test="${model.view.EXP == '무'}">checked</c:if>>
                                                	<label for="none">무</label>
                                                </c:if>
                                            </li>
                                            <li>
                                            	<span class="list_t">영재 교육 경험 종류<b class="relate_c">＊</b></span>
                                            	<span class="list_t">${model.view.EXP_TYPE }</span>
                                                <label class="blind" for="EXP_TYPE">영재 교육 경험 종류</label>
                                                <span class="list_t">영재 교육 참여 기간<b class="relate_c">＊</b></span>
                                                <span class="list_t">${model.view.EXP_DATA }</span>
                                                <label class="blind" for="EXP_DATA">영재 교육 참여 기간</label>
                                            </li>
                                            <!-- 2020년 11월 05일 추가 개발 start-->
                                            <li>
                                            	<span class="list_t">자기 소개서<b class="relate_c">＊</b><br>(<span id="self_length">0</span> / 1000자)</span>
                                            	<textarea class="input_size mr-2" type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" placeholder="1000자 이내로 입력해주세요." value="${model.view.SELF_INTR }" disabled>${model.view.SELF_INTR}</textarea>
                                                <label class="blind" for="SELF_INTR">자기소개서</label>
                                            </li>
                                            <!-- 2020년 11월 05일 추가 개발 end-->
                                        </ul>
                                    </div>
									</form>
									<!-- 멘토 지원서 view form start-->
										<div class="member_input_wrap" id="mentor_viewform" style="padding: 0; margin-bottom: 10px; display:none" >
											<div class="title">
                                        	<span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        	<p>멘토 (지원서)</p>
                                    		</div>
											<ul class="member_input nanumgothic">
												<li>
													<span class="list_t">멘토교사명<b class="relate_c">＊</b></span>
													<span class="list_t">${model.view.TEACHER_NAME }</span>
	                                                <label class="blind" for="TEACHER_NAME">멘토교사명</label>
													<span class="list_t">성별<b class="relate_c">＊</b></span>
													<c:if test="${model.view.TEACHER_SEX == '남자'}">
														<input type="radio" name="TEACHER_SEX" id="man" value="남자" checked>
		                                                <label for="man">남자</label>
		                                                <input type="radio" name="TEACHER_SEX" id="woman" value="여자">
		                                                <label for="woman">여자</label>
													</c:if>
													<c:if test="${model.view.TEACHER_SEX == '여자'}">
														<input type="radio" name="TEACHER_SEX" id="man" value="남자" >
		                                                <label for="man">남자</label>
		                                                <input type="radio" name="TEACHER_SEX" id="woman" value="여자" checked>
		                                                <label for="woman">여자</label>
													</c:if>
													<c:if test="${model.view.TEACHER_SEX == null}">
														<input type="radio" name="TEACHER_SEX" id="man" value="남자" >
		                                                <label for="man">남자</label>
		                                                <input type="radio" name="TEACHER_SEX" id="woman" value="여자">
		                                                <label for="woman">여자</label>
													</c:if>
												</li>
												<li>
													<span class="list_t">생년월일<b class="relate_c">＊</b></span>
													<span class="list_t">${model.view.TEACHER_BIRTH }</span>
	                                                <label class="blind" for="TEACHER_BIRTH">생년월일</label>
												</li>
												<li>
													<span class="list_t">연락처<b class="relate_c">＊</b></span>
													<span class="list_t">${model.view.TEACHER_PHONE }</span>
	                                                <label class="blind" for="PHONE"></label>
												</li>
												<li>
													<span class="list_t">학교 명<b class="relate_c">＊</b></span>
	                                 				<span class="list_t">${model.view.TEACHER_SCHOOL_NAME }</span>
	                                 				<label for="TEACHER_SCHOOL_NAME"></label>
												</li>
												<li>
													<span class="list_t">이메일<b class="relate_c">＊</b></span>
	                                                <span class="list_t">${model.view.TEACHER_EMAIL }</span>
	                                                <label class="blind" for="EMAIL"></label>
	                                                <span class="list_t">전공<b class="relate_c">＊</b></span>
	                                                <span class="list_t">${model.view.TEACHER_MAJOR }</span>
	                                                <label class="blind" for="TEACHER_MAJOR">전공</label>
												</li>
												<li>
													<span class="list_t">멘토교사 지원 동기<b class="relate_c">＊</b><br>(<span id="mtv_length">0</span> / 1000자)</span>
	                                            	<textarea class="input_size mr-2" type="text" maxlength="1000" name="TEACHER_MTV" id="TEACHER_MTV" placeholder="(개조식으로 3개 ~ 5개 작성)" value="${model.view.TEACHER_MTV }" disabled>${model.view.TEACHER_MTV }</textarea>
	                                                <label class="blind" for="TEACHER_MTV">멘토교사 지원 동기</label>
												</li>
												<li>
													<span class="list_t">학생 추천서<b class="relate_c">＊</b><br>(<span id="rcmnd_length">0</span> / 1000자)</span>
	                                            	<textarea class="input_size mr-2" type="text" maxlength="1000" name="LETER_RCMND" id="LETER_RCMND" placeholder="1000자 이내로 입력해주세요." value="${model.view.LETER_RCMND }" disabled>${model.view.LETER_RCMND }</textarea>
	                                                <label class="blind" for="LETER_RCMND">학생 추천서</label>
												</li>
     												<input type="hidden" name="TEACHER_PASS" id="TEACHER_PASS" value="${model.view.TEACHER_PASS }">
											</ul>
										</div>
										<!-- 멘토 지원서 view form end-->
                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                           	<c:if test="${model.rtn == '1' }">
                                           		<a class="delete" id="mentor_insert" href="javascript:mento_insert()">멘토 지원서 작성</a>
                                           		<!--
                                           		12-17 최종 완료 버튼 삭제 
	                                           	<c:if test="${model.view.LETER_RCMND != '' && model.view.LETER_RCMND != null}">
	                                       			<c:if test="${model.view.RESULT == 'nomento'}">
	                                       				<a class="delete" id="mentor_completion"  href="javascript:Final_Completion()">최종 완료</a>
	                                       			</c:if>
	                                           	</c:if>
	                                           	 -->
                                           	</c:if>
                                           	<c:if test="${model.rtn != '1' }">
                                            	<a class="delete" id="view_update" href="javascript:UpdateClick()">수정</a>
                                           	</c:if>
                                           	<c:if test="${model.view.RESULT != 'nomento'}">
                                           		<a class="delete" id="main" href="${pageContext.request.contextPath}/index.do">메인으로</a>
                                           	</c:if>
                                           	<c:if test="${model.view.RESULT == 'nomento'}">
                                            	<a class="delete" href="javascript:delete_check()">지원취소</a>
	                                       	</c:if>
                                        </div>
                                    </div>
                                <!--보드 검색_버튼 end-->

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <div style="display:none" >
		<form id="student_update" method="post" name="student_update" action="./student_update.do?">
			<input type="hidden" id="NAME" name="NAME" value="${model.view.NAME}">
			<input type="hidden" id="PASSWORD" name="PASSWORD"value="${model.view.PASSWORD}">
		</form>
	</div>
    <form id="hidden_mentor" action="./mento_all.do?" method="post" name="hidden_mentor" >
     	<input type="hidden" name="NAME" id="NAME" value="${model.view.NAME}" >
     	<input type="hidden" name="TEACHER_PASS" id="TEACHER_PASS" value="${model.view.TEACHER_PASS }">
    </form>
 	


	<!-- 
	 최종 완료 모달창 12-17 최종 완료 버튼 삭제
	<div id="final_check_box" class="member_re_modal modal_wrap">
		<div id="new_modal">
			<div class="modal_area">
				<div class="modal_con">
					<div class="modal_close">
						<i class="las la-times modal_close_click"></i>
					</div>
					<div class="modal_size">
						<div class="table_area">
							<div class="board_title">
								<h2>
									<span>최종완료 하시겠습니까?</span>
								</h2>
							</div>
							<div class="table_con">
								<div class="table_box">
									<h1>최종 완료시 조회 수정이 불가능 합니다</h1>
									<p>최종 완료 하시겠습니까?</p>
									<button type="button" id="final_check_button"
										onclick="javascript:final_check_button()">확인</button>
									<button type="button"
										onclick="$('#final_check_box').css('display','none')">아니요</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 -->
	<!-- 모달창 end -->
 	 <!--지원취소 모달-->
    <div id="sucs_modal" class="sucs_modal_wrap">
        <div class="sucs_modal_area">
            <div class="modal_model">
                <img src="${pageContext.request.contextPath}/resources/img/modal_model.png" alt="학생" />
            </div>
            <div class="sucs_modal_con">
                <div class="modal_close">
                    <a onclick="$('#sucs_modal').css('display','none');$('.danger_bg').css('display','none')"><i class="las la-times"></i></a>
                </div>
                <div class="sucs_btn_box">
                    <h3>- 지원서 취소하기 -</h3>
                    <ul class="sucs_sub_btn">
                        <li class="sucs_btn_ob sucs_btn_ob_01">
                            <button type="button" id="delete_check_button" onclick="javascript:delete_check_button()">확인</button>
                        </li>
                        <li class="sucs_btn_ob sucs_btn_ob_02">
                            <button type="button" onclick="$('#sucs_modal').css('display','none');$('.danger_bg').css('display','none')">아니요</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="danger_bg"></div>
    <!--제출성공 모달 end-->
 
    <!--본문 end-->
    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <%@ include file="../include/footerJs.jsp" %>
</body>
</html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type=text/javascript>
/*
		$("#TEACHER_TYPE1").click(function(){
		    $('#techerDiv').show();
		})
		
		$("#TEACHER_TYPE2").click(function(){
		    $('#techerDiv').hide();
		})
	*/
	
	//자기소개서 갯수표현
	var self_length = $("#SELF_INTR").val();
	$('#self_length').text(self_length.length);
	//지원동기 갯수 표현
	var mtv_length = $("#TEACHER_MTV").val();
	$('#mtv_length').text(mtv_length.length);
	//멘토 동기 갯수표현
	var rcmnd_length = $("#LETER_RCMND").val();
	$('#rcmnd_length').text(rcmnd_length.length);
	
	//모달창 관련 태그
		//모달창 닫기
		$(".modal_close_click").click(function(){
			$(".modal_wrap").hide();
		})
		
		
		//지원 취소 모달창 관련
			//지원 취소 OK 버튼
			
			function delete_check_button(){
				$(document).ready(function(){
					var IDX = ${model.view.IDX};
					//alert(IDX);
					URL = './delete.do';
			        URL = URL + "?IDX=" + IDX;
			       	//alert(URL);
			       	location.href = URL;	
				});
			}
		
			function delete_check(){
				$("#sucs_modal").show();
				$('.danger_bg').show();
			}
			
		/*	
		//최종 확인 모달창 관련
		function Final_Completion(){
			$("#final_check_box").show();
		}
			function final_check_button(){
				$(document).ready(function(){
					var IDX = ${model.view.IDX};
					URL = './completion.do';
			        URL = URL + "?IDX=" + IDX;
			       	
			       	location.href = URL;
				});
			}
		*/
		//
	
	
	
		if('${model.view.RESULT}' != 'nomento'){
			$('#view_update').css('display','none');
			$('#mentor_insert').css('display','none');
			$("input:radio").attr('disabled',true);
			$("input").attr('readonly',true);
			$("textarea").attr('readonly',true);
		}
		
		
		if('${model.view.LETER_RCMND}' != ''){
			$('#mentor_viewform').css('display','block');
			$('#mentor_insert').text('멘토 지원서 수정');
		}
		if('${model.rtn}' != '1'){
			$('#mentor_viewform').css('display','none');
		}
		
		if($("input:radio[name=TEACHER_TYPE]:checked").val() == '확정'){
			$('#techerDiv').show();
		}else{
			$('#techerDiv').hide();
		}
	
		$("input:radio[name=TEACHER_TYPE]").click(function(){
			if($("input:radio[name=TEACHER_TYPE]:checked").val() == '확정'){
				    $('#techerDiv').show();
			}else{
				    $('#techerDiv').hide();
			};
		})
		
		if($("input:radio[name=EXP]:checked").val() == '무'){
			$("#EXP_TYPE").attr("disabled", true);
			$("#EXP_DATA").attr("disabled", true);;
		}
		
				
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
		
		
		function zipCode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            console.log(data);
		            $('#ZIPCODE').val(data.zonecode);
		            $('#ADDRESS').val(data.roadAddress);
		            $('#ADDRESS_LOCAL').val(data.sido);
		        }
		    }).open();
		}
		
		/*멘토 지원서 버튼 클릭시 작동 11-24 */

		function mento_insert(){
			if('${model.view.RESULT}' != 'nomento'){
				alert("최종 완료 상태여서 수정이 불가능 합니다.");
				return;
			}
			$('#hidden_mentor').submit();
		}
		function UpdateClick() {
			if('${model.view.RESULT}' != 'nomento'){
				alert("최종 완료 상태여서 수정이 불가능합니다.");
				return
			}
	        $('#student_update').submit();
	    }
		
		$.datetimepicker.setLocale('ko');
	    jQuery('.datecalendar').datetimepicker({
	        format: 'Y.m.d',
	        lang: "ko",
	        timepicker: false
	    });

	    $.datetimepicker.setLocale('ko');
	    jQuery('.datecalendar2').datetimepicker({
	        format: 'Y.m.d H:i',
	        lang: "ko",
	        timepicker: true
	    });
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
