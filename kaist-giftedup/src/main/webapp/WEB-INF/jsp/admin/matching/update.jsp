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

                    <!--본문 내용-->
                    <form action="./update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                    <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                    
                    
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>교사-학생 매칭관리</span>
                            </div>

                            <div class="member_register_wrap">
                                <form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
 								<input type="hidden"  name="csrf" value="${CSRF_TOKEN}"/>
 								<input type="hidden"  name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}"/>
                                    <div class="title">
                                        <h2>매칭정보 입력</h2>
                                    </div>
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">학년도＊</span>
                                                <select class="input_size mr" id="YEAR" name="YEAR">
                                                    <option>2020</option>
                                                    <option>2019</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">학년＊</span>
                                                <select class="input_size mr" id="SUPPORT_GROUP" name="SUPPORT_GROUP">
                                                    <option value="">선택해주세요</option>
		 											<option value="4"  <c:if test="${model.pageDomain.SUPPORT_GROUP == '4'}">selected</c:if>>초등학교4학년</option>
                                                    <option value="5"  <c:if test="${model.pageDomain.SUPPORT_GROUP == '5'}">selected</c:if>>초등학교5학년</option>
                                                    <option value="6"  <c:if test="${model.pageDomain.SUPPORT_GROUP == '6'}">selected</c:if>>초등학교6학년</option>
                                                    <option value="7"  <c:if test="${model.pageDomain.SUPPORT_GROUP == '7'}">selected</c:if>>중학교1학년</option>
                                                    <option value="8"  <c:if test="${model.pageDomain.SUPPORT_GROUP == '8'}">selected</c:if>>중학교2학년</option>
                                                    <option value="9"  <c:if test="${model.pageDomain.SUPPORT_GROUP == '9'}">selected</c:if>>중학교3학년</option>
                                                    <option value="10"  <c:if test="${model.pageDomain.SUPPORT_GROUP == '10'}">selected</c:if>>고등학교1학년</option>
                                                    <option value="11"  <c:if test="${model.pageDomain.SUPPORT_GROUP == '11'}">selected</c:if>>고등학교2학년</option>
                                                    <option value="12"  <c:if test="${model.pageDomain.SUPPORT_GROUP == '12'}">selected</c:if>>고등학교3학년</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">학생선택＊</span>
                                                <span class="txt_ob">${model.pageDomain.NAME}(${model.pageDomain.MEMBER_ID})</span>
                                            </li>
                                            <!-- 
                                            <li>
                                                <span class="list_t">소속학교＊</span>
                                                <select class="input_size mr" id="SCHOOL_NAME" name="SCHOOL_NAME">
                                                    <c:forEach var="item" items="${model.SCHOOLNAME.list}" varStatus="status">
			                                        <option value="${item.SCHOOL_NAME}" <c:if test="${model.pageDomain.SCHOOL_NAME == item.SCHOOL_NAME}">selected</c:if>>${item.SCHOOL_NAME}</option>
			                                        </c:forEach>
                                                </select>
                                                <input type="radio" name="direct">
                                               	<label class="relate_c" for="direct">직접입력</label>
                                            </li>
                                            <li>
                                                <span class="list_t">학년/반</span>
                                                <input class="input_size" type="text" name="SCHOOL_YEAR" id="SCHOOL_YEAR" value="${model.pageDomain.SCHOOL_YEAR }">
                                            </li>
                                             -->
                                            <li>
                                                <span class="list_t">멘토교사</span>
                                                 <select class="input_size mr" id="PROFESSOR_MEMBER_ID" name="PROFESSOR_MEMBER_ID">
                                                    <option value="">선택해주세요</option>
			                                        <c:forEach var="item" items="${model.MEMBER2.list}" varStatus="status">
			                                        <option value="${item.MEMBER_ID}" <c:if test="${model.pageDomain.PROFESSOR_MEMBER_ID == item.MEMBER_ID}">selected</c:if>>${item.NAME}(${item.SCHOOL_NAME})</option>
			                                        </c:forEach>
                                                </select>
                                               <!-- <input type="radio" name="direct">
                                                <label class="relate_c" for="direct">직접입력</label>-->
                                            </li>
                                            <!-- 
                                            <li>
                                                <span class="list_t">재학상태</span>
                                                <select class="input_size mr" id="ENROLLMENT_STATUS" name="ENROLLMENT_STATUS">
                                                    <option value="">선택해주세요</option>
                                                    <option value="1" <c:if test="${model.pageDomain.ENROLLMENT_STATUS == '1'}">selected</c:if>>재학</option>
                                                    <option value="2" <c:if test="${model.pageDomain.ENROLLMENT_STATUS == '2'}">selected</c:if>>수료</option>
                                                    <option value="3" <c:if test="${model.pageDomain.ENROLLMENT_STATUS == '3'}">selected</c:if>>휴학</option>
                                                    <option value="4" <c:if test="${model.pageDomain.ENROLLMENT_STATUS == '4'}">selected</c:if>>미이수</option>
                                                    <option value="5" <c:if test="${model.pageDomain.ENROLLMENT_STATUS == '5'}">selected</c:if>>자퇴</option>
                                                </select>
                                               	<input type="radio" name="direct">
                                                < <label class="relate_c" for="direct">직접입력</label>
                                            </li>
                                             -->
                                            <!--
                                            <li>
                                                <span class="list_t">파일첨부</span>
                                                <input class="input_size" type="file" name="file" id="file">
                                                <c:if test="${model.pageDomain.FILES != '' && model.pageDomain.FILES != null}">
                                            	<a class="relate_c" href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/matching/${model.pageDomain.FILES}')">다운로드</a>
                                            	</c:if>
                                            </li>
                                            -->
                                            <li>
                                                <span class="list_t">비고</span>
                                                <textarea id="MEMO" name="MEMO">${model.pageDomain.MEMO}</textarea>
                                            </li>
                                        </ul>
                                    </div>
                                </form>
                            </div>

                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="storage" href="javascript:insertClick()">저장하기</a>
                                    <a class="cancel" href="javascript:history.back();">취소하기</a>
                                </div>
                            </div>
                            <!--저장하기 버튼 end-->
                        </div>
                    </section>
                    </form>
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>

</body></html>

<script type="text/javascript">
$(document).ready(function()
{
	 $("input:radio[name=TYPE]").click(function(){
	        if($("input[name=TYPE]:checked").val() == "1"){
	        	location.href='./insert.do?TYPE=1';
	        }else if($("input[name=TYPE]:checked").val() == "2"){
	        	location.href='./insert.do?TYPE=2';					
	        }
	        $("input[name=radio]:checked")
	    });
});

	/*$("#YEAR").change(function() {

	    $.ajax({
			type : "GET",
			url : './getMemviewView.do?MEMBER_ID='+$(this).val(),
			cache : false,
			data : "",
			success: function(result)
			{
				$('#IDX').html(result);
			}
		});
	});
	*/
	function insertClick()
	{
		if($('#MEMBER_ID').val() == '')
		{
			alert('아이디를 입력 하여 주세요');
			return;
		}
		
		$('#updateform').submit();
	}
	
</script>