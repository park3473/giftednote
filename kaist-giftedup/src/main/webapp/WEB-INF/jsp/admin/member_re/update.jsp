<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<!--css-->
<link rel="stylesheet" href="/resources/css/admin/jquery.datetimepicker.css">
    <%@ include file="../include/head.jsp" %> 
</head>

<body>
	<%@ include file="../include/header.jsp" %>

        <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                      <form action="./update.do" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" /> <!-- Spring security 사용하기 때문에 csrf 토큰 필요!! -->
                        <input type="hidden"  name="IDX" value="${model.pageDomain.IDX}" />
                        
                        <div class="sc_con"  id="div_con">
                            <div class="title">
                                <span></span>
                                <span>${model.pageDomain.NAME}님의 지원서</span>
                            </div>

                            <div class="member_register_wrap">

                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">학생명</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="이름"  value="${model.pageDomain.NAME}" >
                                            </li>
                                            <li>
                                                <span class="list_t">멘토교사 비밀번호</span>
                                                <input class="input_size mr" type="text" name="TEACHER_PASS" id="TEACHER_PASS"  value="${model.pageDomain.TEACHER_PASS}" >
                                            </li>
                                            <li>
                                                <span class="list_t">성별</span>
                                                <input type="radio" name="SEX" id="man" value="남자" <c:if test="${fn:indexOf(model.pageDomain.SEX, '남자') > -1}">checked</c:if>>
                                                <label for="man">남자</label>
                                                <input type="radio" name="SEX" id="woman" value="여자" <c:if test="${fn:indexOf(model.pageDomain.SEX, '여자') > -1}">checked</c:if>>
                                                <label for="woman">여자</label>
                                            </li>
                                            <li>
                                                <span class="list_t">학교 급</span>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_1" value="초" <c:if test="${fn:indexOf(model.pageDomain.SCHOOL_TYPE, '초') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_1">초</label>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_2" value="중" <c:if test="${fn:indexOf(model.pageDomain.SCHOOL_TYPE, '중') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_2">중</label>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_3" value="고" <c:if test="${fn:indexOf(model.pageDomain.SCHOOL_TYPE, '고') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_3">고</label>
                                            </li>
                                            <li>
                                            	<span class="list_t">학교명</span>
                                                <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.pageDomain.SCHOOL_NAME}">
                                            </li>
                                            <li>
                                            	<span class="list_t">학년</span>
                                            	<select class="input_size mr-2" id="SCHOOL_YEAR" name="SCHOOL_YEAR">
                                            		<option value="4"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교4학년</option>
                                                    <option value="5"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교5학년</option>
                                                    <option value="6"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교6학년</option>
                                                    <option value="7"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '7'}">selected</c:if>>중학교1학년</option>
                                                    <option value="8"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '8'}">selected</c:if>>중학교2학년</option>
                                                    <option value="9"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '9'}">selected</c:if>>중학교3학년</option>
                                                    <option value="10" <c:if test="${model.pageDomain.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교1학년</option>
                                                    <option value="11" <c:if test="${model.pageDomain.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교2학년</option>
                                                    <option value="12" <c:if test="${model.pageDomain.SCHOOL_YEAR == '12'}">selected</c:if>>고등학교3학년</option>
                                            	</select>
                                            	<span class="list_t">반</span>
                                                <input class="input_size" type="text" name="SCHOOL_GROUP" id="SCHOOL_GROUP" value="${model.pageDomain.SCHOOL_GROUP}">
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size mr datecalendar" type="text" name="BIRTH" id="BIRTH" value="${model.pageDomain.BIRTH}">
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">집주소</span>
                                                    <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" value="${model.pageDomain.ZIPCODE}" >
                                                    <button type="button" onClick="zipCode();">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="ADDRESS" id="ADDRESS"  value="${model.pageDomain.ADDRESS}">
                                                    <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" value="${model.pageDomain.ADDRESS_DETAIL}">
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처</span>
                                                <input class="input_size" type="text" name="PHONE" id="PHONE" value="${model.pageDomain.PHONE}">
                                            </li>
                                            <li>
                                                <span class="list_t">보호자 연락처</span>
                                                <input class="input_size" type="text" name="TEL" id="TEL" value="${model.pageDomain.TEL}">
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL" value="${model.pageDomain.EMAIL}">
                                            </li>
                                             <li>
                                                <span class="list_t">지원 유형</span>
                                                 <select class="input_size mr-2" id="SUPPORT_AREA" name="SUPPORT_AREA">
                                                    <option value="">없음</option>
                                                    <option value="수학" <c:if test="${model.pageDomain.SUPPORT_AREA == '수학'}">selected</c:if>>수학</option>
                                                    <option value="과학" <c:if test="${model.pageDomain.SUPPORT_AREA == '과학'}">selected</c:if>>과학</option>
                                                    <option value="수·과" <c:if test="${model.pageDomain.SUPPORT_AREA == '수·과'}">selected</c:if>>수·과</option>
                                                    <option value="발명" <c:if test="${model.pageDomain.SUPPORT_AREA == '발명'}">selected</c:if>>발명</option>
                                                    <option value="정보" <c:if test="${model.pageDomain.SUPPORT_AREA == '정보'}">selected</c:if>>정보</option>
                                                    <option value="인문사회" <c:if test="${model.pageDomain.SUPPORT_AREA == '인문사회'}">selected</c:if>>인문사회</option>
                                                </select>
                                                
                                                <span class="list_t">지원 자격</span>
                                                <select class="input_size mr-2" id="ELIGIBILITY" name="ELIGIBILITY">
                                                    <option value="">없음</option>
                                                    <option value="교육급여수급자" <c:if test="${model.pageDomain.ELIGIBILITY == '교육급여수급자'}">selected</c:if>>교육급여수급자</option>
                                                    <option value="특수교육대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '특수교육대상자'}">selected</c:if>>특수교육대상자</option>
                                                    <option value="도서·벽지 거주자" <c:if test="${model.pageDomain.ELIGIBILITY == '도서·벽지 거주자'}">selected</c:if>>도서·벽지 거주자</option>
                                                    <option value="읍·면지역 거주자" <c:if test="${model.pageDomain.ELIGIBILITY == '읍·면지역 거주자'}">selected</c:if>>읍·면지역 거주자</option>
                                                    <option value="학교장 추천" <c:if test="${model.pageDomain.ELIGIBILITY == '학교장 추천'}">selected</c:if>>학교장 추천</option>
                                                    <option value="국가보훈처 지정 교육보호대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '국가보훈처 지정 교육보호대상자'}">selected</c:if>>국가보훈처 지정 교육보호대상자</option>
                                                    <option value="북한이탈주민 또는 그 자녀" <c:if test="${model.pageDomain.ELIGIBILITY == '북한이탈주민 또는 그 자녀'}">selected</c:if>>북한이탈주민 또는 그 자녀</option>
                                                    <option value="법정차상위계층" <c:if test="${model.pageDomain.ELIGIBILITY == '법정차상위계층'}">selected</c:if>>법정차상위계층</option>
                                                    <option value="한부모 가정보호 대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '한부모 가정보호 대상자'}">selected</c:if>>한부모 가정보호 대상자</option>
                                                    <option value="아동 복지 전담기관 보호 대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '아동 복지 전담기관 보호 대상자'}">selected</c:if>>아동 복지 전담기관 보호 대상자</option>
                                                    <option value="다문화 대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '다문화 대상자'}">selected</c:if>>다문화 대상자</option>
                                                    <option value="소년·소녀 가장 및 조손가정의 자녀" <c:if test="${model.pageDomain.ELIGIBILITY == '소년·소녀 가장 및 조손가정의 자녀'}">selected</c:if>>소년·소녀 가장 및 조손가정의 자녀</option>
                                                    <option value="순직 군경·소방관·교직원의 자녀" <c:if test="${model.pageDomain.ELIGIBILITY == '순직 군경·소방관·교직원의 자녀'}">selected</c:if>>순직 군경·소방관·교직원의 자녀</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">영재 교육 경험 여부</span>
                                                <input type="radio" name="EXP" id="man" value="유" <c:if test="${fn:indexOf(model.pageDomain.EXP, '유') > -1}">checked</c:if>>
                                                <label for="man">유</label>
                                                <input type="radio" name="EXP" id="woman" value="무" <c:if test="${fn:indexOf(model.pageDomain.EXP, '무') > -1}">checked</c:if>>
                                                <label for="woman">무</label>
                                            </li> 
                                             <li>
                                                <span class="list_t">영재 교육 경험 종류</span>
                                                <select class="input_size mr-2" id="EXP_TYPE" name="EXP_TYPE">
                                                    <option value="">없음</option>
                                                    <option value="영재학교" <c:if test="${model.pageDomain.EXP_TYPE == '영재학교'}">selected</c:if>>영재학교</option>
                                                    <option value="과학고등학교" <c:if test="${model.pageDomain.EXP_TYPE == '과학고등학교'}">selected</c:if>>과학고등학교</option>
                                                    <option value="시도교육청 영재교육원" <c:if test="${model.pageDomain.EXP_TYPE == '시도교육청 영재교육원'}">selected</c:if>>시도교육청 영재교육원</option>
                                                    <option value="대학교 영재교육원" <c:if test="${model.pageDomain.EXP_TYPE == '대학교 영재교육원'}">selected</c:if>>대학교 영재교육원</option>
                                                    <option value="영재학급" <c:if test="${model.pageDomain.EXP_TYPE == '영재학급'}">selected</c:if>>영재학급</option>
                                                    <option value="기타" <c:if test="${model.pageDomain.EXP_TYPE == '기타'}">selected</c:if>>기타</option>
                                                </select>
                                                
                                                <span class="list_t">영재 교육 참여 기간</span>
                                                <select class="input_size mr-2" id="EXP_DATA" name="EXP_DATA">
                                                    <option value="">없음</option>
                                                    <option value="1년 이하" <c:if test="${model.pageDomain.EXP_DATA == '1년 이하'}">selected</c:if>>1년 이하</option>
                                                    <option value="1년 ~ 2년" <c:if test="${model.pageDomain.EXP_DATA == '1년 ~ 2년'}">selected</c:if>>1년 ~ 2년</option>
                                                    <option value="2년 ~ 3년" <c:if test="${model.pageDomain.EXP_DATA == '2년 ~ 3년'}">selected</c:if>>2년 ~ 3년</option>
                                                    <option value="3년 ~ 4년" <c:if test="${model.pageDomain.EXP_DATA == '3년 ~ 4년'}">selected</c:if>>3년 ~ 4년</option>
                                                    <option value="4년 이상" <c:if test="${model.pageDomain.EXP_DATA == '4년 이상'}">selected</c:if>>4년 이상</option>
                                                </select>
                                            </li>
                                             <li>
                                                <span class="list_t"><span id="self_intr_text_1">자기 소개서 - 1</span><br>(<span id="self_length_1">0</span> / 1000자)</span>
                                   			   	<textarea class="textarea_size" type="text" maxlength="1000" name="SELF_INTR_1" id="SELF_INTR_1" placeholder="영재키움 프로젝트’에 지원하게 된 이유를 자기의 꿈과 관련지어 자기소개서를 작성하시기 바랍니다.(지원 이유, 다짐, 각오 등이 드러나게)" style="height: 180px;" value="${model.pageDomain.SELF_INTR_1 }">${model.pageDomain.SELF_INTR_1 }</textarea>
                                    		</li>
                                       		<li>
                                      			<span class="list_t"><span id="self_intr_text_2">자기 소개서 - 2</span><br>(<span id="self_length_2">0</span> / 1000자)</span>
                                       			<textarea class="textarea_size" type="text" maxlength="1000" name="SELF_INTR_2" id="SELF_INTR_2" placeholder="지원하는 분야(수학, 과학, 정보, 발명, 인문사회의 즐거웠던 경험을 써 보세요." style="height: 180px;" value="${model.pageDomain.SELF_INTR_2 }">${model.pageDomain.SELF_INTR_2 }</textarea>
                                           	</li>
                                         	<li id="self_intr_li" style="display:none">
                                              	<span class="list_t"><span id="self_intr_text_3">자기 소개서 - 3</span><br>(<span id="self_length_3">0</span> / 1000자)</span>
                                              	<textarea class="textarea_size" type="text" maxlength="1000" name="SELF_INTR_3" id="SELF_INTR_3" placeholder="1000자 이내로 입력해주세요." style="height: 180px;" value="${model.pageDomain.SELF_INTR_3 }" >${model.pageDomain.SELF_INTR_3 }</textarea>
                                           	</li>
                                        </ul>
                                    </div>
                                    
                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                        	<li>
                                        		<span class="list_t">멘토교사 여부</span>
                                                <input type="radio" name="TEACHER_TYPE" id="TEACHER_TYPE1" value="확정" <c:if test="${model.pageDomain.TEACHER_TYPE == '확정'}">checked</c:if> >
                                                <label for="exist">있음</label>
                                            	<input type="radio" name="TEACHER_TYPE" id="TEACHER_TYPE2" value="미확정" <c:if test="${model.pageDomain.TEACHER_TYPE == '미확정'}">checked</c:if> >
                                       			<label for="none">없음</label>
                                        	</li>
                                            <li>
                                                <span class="list_t">멘토교사명</span>
                                                <input class="input_size mr-2" type="text" name="TEACHER_NAME" id="TEACHER_NAME" value="${model.pageDomain.TEACHER_NAME}"  readonly="readonly">
                                                 <span class="list_t">성별</span>
                                                <input type="radio" name="TEACHER_SEX" id="man" value="남자" <c:if test="${fn:indexOf(model.pageDomain.TEACHER_SEX, '남자') > -1}">checked</c:if>>
                                                <label for="man">남자</label>
                                                <input type="radio" name="TEACHER_SEX" id="woman" value="여자" <c:if test="${fn:indexOf(model.pageDomain.TEACHER_SEX, '여자') > -1}">checked</c:if>>
                                                <label for="woman">여자</label>
                                            </li>
                                             <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="datecalendar mr input_size" type="text" name="TEACHER_BIRTH" id="TEACHER_BIRTH" value="${model.pageDomain.TEACHER_BIRTH}">
                                                <span class="relate_c">클릭해서 생년월일을 선택해주세요.</span>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처</span>
                                                <input class="input_size mr" type="text" name="TEACHER_PHONE" id="TEACHER_PHONE" value="${model.pageDomain.TEACHER_PHONE}">
                                                <input class="input_size" type="hidden" name="MCP" id="MCP" <c:if test="${model.pageDomain.TEACHER_PHONE == null or model.pageDomain.TEACHER_PHONE == ''}">value="1"</c:if>>
                                                <span class="relate_c">연락처 입력시 -없이 입력</span>
                                            </li>
                                            <li>
                                            	<span class="list_t">학교명</span>
                                                <input class="input_size" type="text" name="TEACHER_SCHOOL_NAME" id="TEACHER_SCHOOL_NAME" value="${model.pageDomain.TEACHER_SCHOOL_NAME}">
                                            </li>
                                             <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size mr-2" type="text" name="TEACHER_EMAIL" id="TEACHER_EMAIL"  value="${model.pageDomain.TEACHER_EMAIL}">
                                                <span class="list_t">전공</span>
                                                <input class="input_size" type="text" name="TEACHER_MAJOR" id="TEACHER_MAJOR"  value="${model.pageDomain.TEACHER_MAJOR}">
                                            </li>
                                             <li>
                                                <span class="list_t">학생으로 추천하는 이유<br/>(<span id="mtv_length">0</span>/1000자)</span>
                                                 <textarea name="TEACHER_MTV" id="TEACHER_MTV" value="${model.pageDomain.TEACHER_MTV}">${model.pageDomain.TEACHER_MTV}</textarea>
                                                 <!--
                                                <input type="text" name="TEACHER_MTV" id="TEACHER_MTV" style="width: 700px; height: 80px;" value="${model.pageDomain.TEACHER_MTV}">								
                                                -->
                                            </li>
                                             <li>
                                                <span class="list_t">지원자의 성장가능성 및 우수성<br/>(<span id="rcmnd_length">0</span>/1000자)</span>
                                                 <textarea name="LETER_RCMND" id="LETER_RCMND" value="${model.pageDomain.LETER_RCMND}">${model.pageDomain.LETER_RCMND}</textarea>
                                                 <!--
                                                <input type="text" name="LETER_RCMND" id="LETER_RCMND" style="width: 700px; height: 80px;" value="${model.pageDomain.LETER_RCMND}">
                                                    -->
                                            </li>
                                        </ul>
                                    </div>
                                    
                                    <div class="title">
		                                <h2>서류 평가</h2>
		                            </div>
                                    
                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">멘토 교사 추천 점수</span>
                                                <input class="input_score" type="number" name="MENTO_SCORE" id="MENTO_SCORE" maxlength="2" oninput="maxLengthCheck(this)" placeholder="멘토 점수를 입력해주세요."> <span class="input_txt">점 / 50점 만점</span>
                                            </li>
                                            <li>
                                                <span class="list_t">자기소개서 점수</span>
                                                <input class="input_score" type="number" name="SELF_SCORE" id="SELF_SCORE" maxlength="2" oninput="maxLengthCheck(this)" placeholder="자기소개서 점수를 입력해주세요."> <span class="input_txt">점 / 50점 만점</span>
                                            </li>
                                            <li>
                                                <span class="list_t">총점</span>
                                                <input class="input_score" type="text" name="TOTAL_SCORE" id="TOTAL_SCORE" placeholder="총점" readonly> <span class="input_txt">점 / 100점 만점</span>
                                                <input class="input_size" type="hidden" name="SCORE" id="SCORE"  value="${model.pageDomain.SCORE}"  readonly>
                                            </li>
                                        </ul>
                                    </div>
                            </div>

                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="bd_storage_w_btn" href="javascript:insertClick()">평가 완료</a>
                                    <a class="bd_storage_w_btn" href="javascript:updateClick()">수정 하기</a>
                                    <a class="bd_storage_w_btn" href="javascript:history.back()">뒤로 가기</a>
                                </div>
                            </div>
                           </form>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>

    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/freshman.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</body>
</html>

<script src="/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
<!-- 다음 주소 검색 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!--부트스트랩 js-->
<script src="/resources/js/bootstrap/bootstrap.js"></script>
<script>
    function maxLengthCheck(object){
        if (object.value.length > object.maxLength){
            object.value = object.value.slice(0, object.maxLength);
        }    
    }
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
	//자기소개서 학년 체크
	if($("input:radio[name=SCHOOL_TYPE]:checked").val() == '고' || $("input:radio[name=SCHOOL_TYPE]:checked").val() == '중'){
    	$('#self_intr_li').show();
    	$('#SELF_INTR_1').attr('placeholder','지원자의 성장과정과 배경에 대해서 구체적으로 기술하시오. 또한 자신의 꿈이 무엇이며, 어떤 계기로 이 꿈을 가지게 되었는지, 그리고 지금까지 그 꿈을 이루기 위해 어떤 노력을 해왔는지 기술하십시오.');
    	$('#SELF_INTR_2').attr('placeholder','남보다 뛰어나다고 생각하는 자신의 장점(혹은 능력)과 고쳐야 할 단점(혹은 능력)이 있습니까? 그렇다면 자신의 장점을 발휘하였던 사례와, 단점을 극복하기 위해 기울인 노력에 대해서 구체적인 예와 함께 설명하십시오.');
    	$('#SELF_INTR_3').attr('placeholder','학교 재학기간 중 학업 이외의 활동(사회봉사, 교내·외 동아리활동, 단체 활동, 취미활동, 문화 활동, 발명관련 활동 등)에서 가장 소중했던 경험을 소개하고, 이러한 경험을 통해 무엇을 배웠는지에 대해서 기술하십시오.');
    	$('#self_intr_text_1').html('자신의 성장과정');
		$('#self_intr_text_2').html('자신의 장·단점');
		$('#self_intr_text_3').html('재학기간 중 활동내용');
	}else{
		$('#self_intr_text_1').html('지원하게 된 동기');
		$('#self_intr_text_2').html('지원하는 분야');
	}
	//자기소개서 학년
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
	//지원동기 갯수 표현
	var mtv_length = $("#TEACHER_MTV").val();
	$('#mtv_length').text(mtv_length.length);
	//멘토 동기 갯수표현
	var rcmnd_length = $("#LETER_RCMND").val();
	$('#rcmnd_length').text(rcmnd_length.length);
	
	//멘토교사 지원동기 갯수
	$(document).ready(function(){
		$("#TEACHER_MTV").on("change keyup paste", function() {
			var mtv_length = $(this).val();
			$('#mtv_length').text(mtv_length.length);
		})
	})
	//멘토교사 자기소개서 갯수
	$(document).ready(function(){
		$("#LETER_RCMND").on("change keyup paste", function() {
			var rcmnd_length = $(this).val();
			$('#rcmnd_length').text(rcmnd_length.length);
		})
	})
	
	
	
	//점수 배분
	if($('#SCORE').val() != ''){
		console.log($('#SCORE').val())
		var allsocre = $('#SCORE').val();
		var scorelist = allsocre.split(",");
		var mento_val = scorelist[0].slice(-2);
		if(scorelist[0].slice(-2,-1) == ':'){
			mento_val = scorelist[0].slice(-1);
		}
		$('#MENTO_SCORE').val(mento_val);
		var self_val = scorelist[1].slice(-2);
		if(scorelist[1].slice(-2,-1) == ':'){
			self_val = scorelist[0].slice(-1);
		}
		$('#SELF_SCORE').val(self_val);
		var total_val = scorelist[2].slice(-2);
		if(scorelist[2].slice(-3) == '100'){
			total_val = scorelist[2].slice(-3);
		}
		if(scorelist[2].slice(-2,-1) == ':'){
			total_val = scorelist[2].slice(-1);
		}
		$('#TOTAL_SCORE').val(total_val);	
	}
	
	$(function() {
		$.datetimepicker.setLocale('ko');
	    jQuery('.datecalendar').datetimepicker({
	        format: 'Y.m.d',
	        lang: "ko",
	        timepicker: false
	    });
	});

	//동시입력
	$("#TEACHER_NAME").keydown(function(){
	    $('#TEACHER_NAME2').val($(this).val());
	});
	
	$("#TEACHER_NAME").change(function(){
	    $('#TEACHER_NAME2').val($(this).val());
	});
	
    $("#TEACHER_PHONE").keydown(function(){
        $('#TEACHER_PHONE2').val($(this).val());
    });
    $("#TEACHER_PHONE").change(function(){
        $('#TEACHER_PHONE2').val($(this).val());
    });
	
	function zipCode()
	{
		new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	        	$('#ZIPCODE').val(data.sigunguCode);
	        	$('#ADDRESS').val(data.roadAddress);
	        }
	    }).open();	
	}
	//점수 받아서 표기
	$(document).ready(function(){
		var totalScore = "";
		$("#MENTO_SCORE").on("change keyup paste", function() {
		    var MENTO_SCORE = $(this).val();
		    MENTO_SCORE = parseInt(MENTO_SCORE);
		    var SELF_SCORE = $("#SELF_SCORE").val();
		    SELF_SCORE = parseInt(SELF_SCORE);
		    if($("#SELF_SCORE").val() == ''){
		    	SELF_SCORE = 0;
		    }
		    if($("#MENTO_SCORE").val() == ''){
		    	MENTO_SCORE = 0;
		    }
		 
		    totalScore = MENTO_SCORE + SELF_SCORE;
		    $('#TOTAL_SCORE').val(totalScore);
		});
		$("#SELF_SCORE").on("change keyup paste", function() {
		    var SELF_SCORE = $(this).val();
		    SELF_SCORE = parseInt(SELF_SCORE);
		    var MENTO_SCORE = $("#MENTO_SCORE").val();
		    MENTO_SCORE = parseInt(MENTO_SCORE);
		    if($("#SELF_SCORE").val() == ''){
		    	SELF_SCORE = 0;
		    }
		    if($("#MENTO_SCORE").val() == ''){
		    	MENTO_SCORE = 0;
		    }
		 
		    totalScore = MENTO_SCORE + SELF_SCORE;
		    $('#TOTAL_SCORE').val(totalScore);
		});
	})
	
	function insertClick()
	{
		MENTO_SCORE = parseInt($("#MENTO_SCORE").val());
		 if(MENTO_SCORE > 50){
			 alert("멘토 최고점수는 50점 입니다.");
			 return;
		}
		 SELF_SCORE = parseInt($("#SELF_SCORE").val());
		if(SELF_SCORE > 50){
	    	alert("자기소개서 최고점수는 50점 입니다.");
	    	return;
	    }
		if($('#TOTAL_SCORE').val() == '')
		{
			alert('평가점수를 입력 하여 주세요');
			return;
		}
		TOTAL_SCORE = parseInt($('#TOTAL_SCORE').val());
		if(TOTAL_SCORE > 100)
		{
			console.log($('#TOTAL_SCORE').val());
			alert('총최고점수는 100점 입니다.');
			return;
		}
		var mento = $("#MENTO_SCORE").val();
		var self = $("#SELF_SCORE").val();
		var total = $("#TOTAL_SCORE").val();
		var total_text= "";
		var total_text = "멘토점수:" + mento + "," + "자기소개서점수:" + self + "," +"총점:" + total;
		$('#SCORE').val(total_text);
		if($("input:radio[name=SCHOOL_TYPE]:checked").val() == '초'){
			$('#SELF_INTR_3').val('');
		}
		$('#updateform').submit();
	}
	function updateClick()
	{
		if($("input:radio[name=SCHOOL_TYPE]:checked").val() == '초'){
			$('#SELF_INTR_3').val('');
		}
		$('#updateform').submit();
	}
</script>
