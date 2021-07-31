<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css"> 
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
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>회원목록관리</span>
                                
                            </div>

                            <div class="table_wrap">
                                <table>
                                    <tr>
                                        <th class="">유형</th>
                                        <th class="name_id">멘토 이름</th>
                                        <th class="phone">멘토 연락처</th>
                                        <th class="rating">학생 이름</th>
                                        <th class="join">학생 연락처</th>
                                        <th class="">지원 자격</th>
                                    </tr>
                                    
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                       <td>${item.ID }</td>
                                       <td>${item.TEACHER_NAME }</td>
                                       <td>${item.TEACHER_PHONE }</td>
                                       <td>${item.STUDENT_NAME }</td>
                                       <td>${item.STUDENT_PHONE }</td>
                                       <td>${item.TYPE }</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <!--
                                    <li class="register">
                                        <a href="javascript:schoolNumberUpdate();">학번일괄</a>
                                    </li>
                                    -->
                                    
                                    <li class="register" id="member_excel">
                                        <a href="#">회원 엑셀 업로드</a>
                                    </li>
                                </ul>
                            </div>
                            <!--관리자 버튼 end-->

                            <!-- 모달창 -->
                            <form action="./excelReMemberUpload.do?" method="post" name="memberExcelform" id="memberExcelform" enctype="multipart/form-data">
                                <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                <div class="member_modal_wrap">
                                    <div class="member_modal_con member_input_wrap">
                                        <div class="modal_title">
                                            <h2>회원 엑셀 업로드</h2>
                                        </div>
                                        <ul class="modal_form member_input">
                                            <li>
                                                <span class="list_t">엑셀 업로드</span>
                                                <input type="file" id="file1" name="file" accept=".xls">
                                                <span class="relate_c">양식에 맞는 엑셀을 업로드 해주세요.</span>
                                            </li>
                                        </ul>
                                        
                                        <div class="member_btn adm_btn_wrap mr-0">
                                            <ul>
                                                <li class="register modal_close" ><a href="#">취소</a></li>
                                                <li class="register modal_upload" ><a href="javascript:memberXlexUpload()">회원 업로드</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- 모달창 end-->

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

	$('#fileDownBtn1').click(function(e) {
	
	    //var url = '${pageContext.request.contextPath}/resources/files/member_explanation.pptx'; 
	    //location.href = url;
	    alert("설명서 다운로드 준비중");
	});
	
	$('#fileDownBtn2').click(function(e) {
	    //var url = '${pageContext.request.contextPath}/resources/files/member_explanation.xls'; 
	    //location.href = url;
	    alert("양식 다운로드 준비중");
	});
	
	var uploadCheckBtn = false;
    function memberXlexUpload() {
        if(uploadCheckBtn == false) {
            uploadCheckBtn = true;
            $('#memberExcelform').submit();	
        }else {
            alert('처리중입니다.');	
        }
    }
	
	function memberModal(){
        $("#member_excel > a").click(function(){
            $(".member_modal_wrap").fadeIn(300);
        });

        $(".modal_close > a").click(function(){
            $(".member_modal_wrap").fadeOut(300);
        });
    }
    memberModal();

</script>
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
	
	
	var URL = "excel_upload.do?PAGE="+page;

	
	if('${model.beforeDomain.ITEM_COUNT}}' == '')
	{
		URL = URL + "&ITEM_COUNT=" + '10';
	}else
	{
		URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
	}
	

	URL = URL + "&SEARCH_TEXT=" + encodeURI('${model.beforeDomain.SEARCH_TEXT}');
	URL = URL + "&SEARCH_TYPE=" + '${model.beforeDomain.SEARCH_TYPE}';

	
	location.href = URL;
}


</script>
