 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp" %> 
</head>

<body>
    <!--헤더-->
	<%@ include file="../include/header.jsp" %>
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

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
                                <span>신입생 등록</span>
                            </div>

                            <div class="member_register_wrap">
                                <form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                	<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                	<input type="hidden"  name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" />
                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">학생명＊</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="한글" >
                                                <input class="input_size mr" type="text" name="NAME_ENG" id="NAME_ENG" placeholder="영문">
                                                <input class="input_size mr" type="text" name="NAME_HANJA" id="NAME_HANJA" placeholder="한자">
                                            </li>
                                            <li>
                                                <span class="list_t">추천교사명＊</span>
                                                <input class="input_size mr" type="text" name="TEACHER_NAME" id="TEACHER_NAME">
                                            </li>
                                            <li>
                                                <span class="list_t">성별＊</span>
                                                <input type="radio" name="SEX" id="man" value="1" checked>
                                                <label for="man">남자</label>
                                                <input type="radio" name="SEX" id="woman" value="2">
                                                <label for="woman">여자</label>
                                            </li>
                                            <li>
                                                <span class="list_t">소속학교명＊</span>
                                                <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME">
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size mr" type="text" name="BIRTH" id="BIRTH">
                                                <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a>
                                                
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">집주소</span>
                                                    <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" readonly>
                                                    <button type="button" onClick="zipCode();">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="ADDRESS" id="ADDRESS" readonly>
                                                    <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL">
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처＊</span>
                                                <input class="input_size" type="text" name="TEL" id="TEL">
                                            </li>
                                            <li>
                                                <span class="list_t">휴대폰＊</span>
                                                <input class="input_size" type="text" name="PHONE" id="PHONE">
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL">
                                            </li>
                                            <li>
                                                <span class="list_t">파일첨부</span>
                                                <input class="input_size" type="file" name="file" id="file">
                                                <button type="button" class="yellow_btn">다운로드</button>
                                                <span class="relate_c">양식을 다운로드하여 작성 후 파일을 첨부해 주세요.</span>
                                            </li>
                                        </ul>
                                    </div>
                                </form>
                            </div>

                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="bd_storage_w_btn" href="javascript:insertClick()">저장하기</a>
                                </div>
                            </div>
                            <!--저장하기 버튼 end-->
                        </div>
                    </section>
                    <!--본문 내용 end-->
                </div>
            </div>
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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/freshman.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>

</body></html>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
</script>
<script type="text/javascript">
	

	function insertClick()
	{
		
		if($('#TITLE').val() == '')
		{
			alert('제목을 입력 하여 주세요');
			return;
		}
	
		
		
		$('#updateform').submit();
	}
</script>