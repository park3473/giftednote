<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
</head>

<style>
    #new_sub_hd .title > p:first-of-type {
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


                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>학생 (온라인 지원서)</p>
                                    </div>
                                    
                                   	<div id="pdf_wrap" class="member_input_wrap">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">이름</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.NAME}</li>
                                                </ul>
                                                <span class="list_t">성별</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.SEX}</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교급</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.SCHOOL_TYPE}</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">멘토교사 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.TEACHER_TYPE}</li>
                                                </ul>
                                            </li>
                                            <c:if test="${model.view.TEACHER_TYPE == '확정'}">
                                            	<li class="pd-lr-10">
	                                                <span class="list_t">멘토교사명</span>
	                                                <ul class="list_ob list_ob_01">
	                                                    <li>${model.view.TEACHER_NAME}</li>
	                                                </ul>
	                                                <span class="list_t">연락처</span>
	                                                <ul class="list_ob list_ob_01">
	                                                    <li>${model.view.TEACHER_PHONE}</li>
	                                                </ul>
	                                            </li>
                                            </c:if>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.SCHOOL_NAME}</li>
                                                </ul>
                                                <span class="list_t">학년/반</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>
                                                    	<c:if test="${model.view.SCHOOL_YEAR == '4'}">
	                                       					초등학교 4학년
		                                                </c:if>
		                                                <c:if test="${model.view.SCHOOL_YEAR == '5'}">
		                                       				초등학교 5학년
		                                                </c:if>
		                                                <c:if test="${model.view.SCHOOL_YEAR == '6'}">
		                                       				초등학교 6학년
		                                                </c:if>
		                                                <c:if test="${model.view.SCHOOL_YEAR == '7'}">
		                                       				중학교 1학년
		                                                </c:if>
		                                                <c:if test="${model.view.SCHOOL_YEAR == '8'}">
		                                       				중학교 2학년
		                                                </c:if>
		                                                <c:if test="${model.view.SCHOOL_YEAR == '9'}">
		                                       				중학교 3학년
		                                                </c:if>
		                                                <c:if test="${model.view.SCHOOL_YEAR == '10'}">
		                                       				고등학교 1학년
		                                                </c:if>
		                                                <c:if test="${model.view.SCHOOL_YEAR == '11'}">
		                                       				고등학교 2학년
		                                                </c:if>
		                                                <c:if test="${model.view.SCHOOL_YEAR == '12'}">
		                                       				고등학교 3학년
		                                                </c:if>
                                                     / 
                                                    	<span>${model.view.SCHOOL_GROUP}반</span>
                                                    </li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">생년월일</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.BIRTH}</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">집주소</span>
                                                <ul class="list_ob list_ob_02">
                                                    <li>${model.view.ZIPCODE} ${model.view.ADDRESS} ${model.view.ADDRESS_DETAIL} </li>
                                                </ul>
                                            </li>
                                            
											<li class="pd-lr-10">
												<span class="list_t">연락처</span>
												<ul class="list_ob list_ob_01">
                                                    <li>
                                                    	<c:if test="${model.view.PHONE != null and model.view.PHONE != ''}">
                                                    		${model.view.PHONE}
                                                    	</c:if>
                                                    	<c:if test="${model.view.PHONE == null or model.view.PHONE == ''}">
                                                    		미등록
                                                    	</c:if>
                                                    </li>
                                                </ul>
												<span class="list_t">보호자 연락처</span>
												<ul class="list_ob list_ob_01">
                                                    <li>${model.view.TEL}</li>
                                                </ul>
											</li>
                                            
											<li class="pd-lr-10">
												<span class="list_t">이메일</span>
												<ul class="list_ob list_ob_01">
                                                    <li>
                                                    	<c:if test="${model.view.EMAIL != null and model.view.EMAIL != ''}">
                                                    		${model.view.EMAIL}
                                                    	</c:if>
                                                    	<c:if test="${model.view.EMAIL == null or model.view.EMAIL == ''}">
                                                    		미등록
                                                    	</c:if>
                                                    </li>
                                                </ul>
											</li>
                                            
											<li class="pd-lr-10">
												<span class="list_t">지원 유형</span>
												<ul class="list_ob list_ob_01">
                                                    <li>
                                                        ${model.view.SUPPORT_AREA}
                                                    </li>
                                                </ul>
												<span class="list_t">지원 자격</span>
												<ul class="list_ob list_ob_01">
                                                    <li>
                                                        ${model.view.ELIGIBILITY}
                                                    </li>
                                                </ul>
											</li>
											
                                            <li class="pd-lr-10">
                                                <span class="list_t">영재 교육 경험 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>
                                                        ${model.view.EXP}
                                                    </li>
                                                </ul>
                                            </li>
											<c:if test="${model.view.EXP == '유'}">	
	                                            <li class="pd-lr-10">
	                                                <span class="list_t">영재 교육 경험 종류</span>
	                                                <ul class="list_ob list_ob_01">
	                                                    <li>
	                                                        ${model.view.EXP_TYPE}
	                                                    </li>
	                                                </ul>
	                                                <span class="list_t">영재 교육 참여 기간</span>
	                                                <ul class="list_ob list_ob_01">
	                                                    <li>
	                                                        ${model.view.EXP_DATA}
	                                                    </li>
	                                                </ul>
	                                            </li>
                                            </c:if>
											
                                            <li class="pd-lr-10">
                                                <span class="list_t" id="self_intr_text_1">자기소개서 - 1</span>
                                                <ul class="list_ob list_ob_03">
                                                    <li>
                                                        <div class="txtarea">${model.view.SELF_INTR_1}</div>
                                                    </li>
                                                </ul>
                                            </li>
                                            <c:if test="${model.view.SELF_INTR_2 != null and model.view.SELF_INTR_2 != ''}">
                                            <li class="pd-lr-10">
                                                <span class="list_t" id="self_intr_text_2">자기소개서 - 2</span>
                                                <ul class="list_ob list_ob_03">
                                                    <li>
                                                        <div class="txtarea">${model.view.SELF_INTR_2}</div>
                                                    </li>
                                                </ul>
                                            </li> 
                                            </c:if>
                                            <c:if test="${model.view.SELF_INTR_3 != null and model.view.SELF_INTR_3 != ''}">	
                                            <li class="pd-lr-10">
                                                <span class="list_t" id="self_intr_text_3">자기소개서 - 3</span>
                                                <ul class="list_ob list_ob_03">
                                                    <li>
                                                        <div class="txtarea">${model.view.SELF_INTR_3}</div>
                                                    </li>
                                                </ul>
                                            </li>
                                            </c:if>                                                 
                                        </ul>
                                    </div>
                                    
                                    <div class="title mento_title" style="display:none">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>멘토교사 (온라인 지원서)</p>
                                    </div>
                                    
                                    <div class="member_input_wrap" id="mentor_viewform" style="padding: 0; margin-bottom: 10px; display:none">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">멘토교사명</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.TEACHER_NAME }</li>
                                                </ul>
                                                <span class="list_t">성별</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.SEX }</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">생년월일</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.TEACHER_BIRTH }</li>
                                                </ul>
                                                <span class="list_t">연락처</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.TEACHER_PHONE }</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.TEACHER_SCHOOL_NAME }</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">이메일</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>
                                                        <c:if test="${model.view.TEACHER_EMAIL != null}">
                                                    		${model.view.TEACHER_EMAIL}
                                                    	</c:if>
                                                    	<c:if test="${model.view.TEACHER_EMAIL == null or model.view.TEACHER_EMAIL == ''}">
                                                    		미등록
                                                    	</c:if>
                                                    </li>
                                                </ul>
                                                <span class="list_t">전공</span>
                                                <ul class="list_ob list_ob_01"> 
                                                    <li>${model.view.TEACHER_MAJOR }</li>
                                                </ul>
                                            </li>
											
                                            <li class="pd-lr-10">
                                                <span class="list_t">멘토교사 지원 동기</span>
                                                <ul class="list_ob list_ob_03">
                                                    <li>
                                                        ${model.view.TEACHER_MTV }
                                                    </li>
                                                </ul>
                                            </li> 
											
                                            <li class="pd-lr-10">
                                                <span class="list_t">학생추천서</span>
                                                <ul class="list_ob list_ob_03">
                                                    <li>
                                                        ${model.view.LETER_RCMND }
                                                    </li>
                                                </ul>
                                            </li>                                                   
                                        </ul>
                                    </div>
                                    <!-- 
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
                                     -->
                                    <!-- 멘토 지원서 view form end-->
                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                           	<c:if test="${model.rtn == '1' }">
                                           		<a class="delete" id="mentor_insert" href="javascript:mento_check()">멘토 지원서 작성</a>
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
                                            	${model.rtn }
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
    <form id="hidden_mentor" action="./mento_check.do?" method="post" name="hidden_mentor" >
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
    <div class="danger_modal_area">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>2021년 영재키움프로젝트 신입생 선발을 지원을 취소하겠습니까?</h2>
                <p>다시 지원을 원하시면 신입생 지원메뉴를 통해서 지원해주시기 바랍니다.</p>
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <button type="button" id="delete_check_button" onclick="javascript:delete_check_button()">확인</button>
                </li>
                <li class="danger_btn_02">
                    <button type="button" onclick="$('.danger_modal_area').css('display','none');$('.danger_bg').css('display','none')">아니요</button>
                </li>
            </ul>
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
	/*
	//자기소개서 갯수표현
	var self_length = $("#SELF_INTR").val();
	$('#self_length').text(self_length.length);
	//지원동기 갯수 표현
	var mtv_length = $("#TEACHER_MTV").val();
	$('#mtv_length').text(mtv_length.length);
	//멘토 동기 갯수표현
	var rcmnd_length = $("#LETER_RCMND").val();
	$('#rcmnd_length').text(rcmnd_length.length);
	*/
	//자기소개서 표현 글
	if('${model.view.SCHOOL_TYPE}' == '초'){
		$('#self_intr_text_1').html('지원동기');
		$('#self_intr_text_2').html('지원하는 분야');
	}else{
		$('#self_intr_text_1').html('성장과정');
		$('#self_intr_text_2').html('장·단점');
		$('#self_intr_text_3').html('활동내용');
	}
	
	
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
				$(".danger_modal_area").show();
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
			$('.mento_title').css('display','table');
			$('#mentor_insert').text('멘토 지원서 수정');
			console.log('test123456');
		}
		if('${model.rtn}' != '1'){
			$('#mentor_viewform').css('display','none');
			$('.mento_title').css('display','none');
			console.log('fdsfdsfds');
			console.log(${model.rtn});
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

		function mento_check(){
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
