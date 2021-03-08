<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html lang="ko">

<head>
<link href="${pageContext.request.contextPath}/resources/css/admin/member_re_list.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/css/admin/jquery.datetimepicker.css">
<%@ include file="../include/head.jsp" %> 
</head>

<body>
    <!--헤더-->
	<%@ include file="../include/header.jsp" %>
    <!--헤더 end-->

    <!--본문 end-->
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
                                <span>신입생 지원 통계</span>
                            </div>
                            <div class="main">
                                <div class="main_right">
                                    <div class="table_wrap">
                                        <table id="table">
	                                            <tr>
	                                                <th rowspan="2">순번</th>
	                                                <th rowspan="2">지역</th>
	                                                <th colspan="9">학생</th>
	                                                <th rowspan="2">멘토교사</th>
	                                                <th rowspan="2">총계</th>
	                                            </tr>
	                                            <tr>
	                                            	<th>초4</th>
	                                            	<th>초5</th>
	                                            	<th>초6</th>
	                                            	<th>중1</th>
	                                            	<th>중2</th>
	                                            	<th>중3</th>
	                                            	<th>고1</th>
	                                            	<th>고2</th>
	                                            	<th>고3</th>
	                                            </tr>
                                            
	                                            <c:forEach var="item" items="${model.list}" varStatus="status">
										         <tr>
	                                                <td class="td_01">${status.index+1 }</td>
	                                                <td class="td_02">${item.ADDRESS_LOCAL}</td>
	                                                <td class="td_03">${item.SCHOOL_YEAR4}</td>
	                                                <td class="td_03">${item.SCHOOL_YEAR5}</td>
	                                                <td class="td_03">${item.SCHOOL_YEAR6}</td>
	                                                <td class="td_03">${item.SCHOOL_YEAR7}</td>
	                                                <td class="td_03">${item.SCHOOL_YEAR8}</td>
	                                                <td class="td_03">${item.SCHOOL_YEAR9}</td>
	                                                <td class="td_03">${item.SCHOOL_YEAR10}</td>
	                                                <td class="td_03">${item.SCHOOL_YEAR11}</td>
	                                                <td class="td_03 school_year_12" id="school_year_12">${item.SCHOOL_YEAR12}</td>
	                                                <td class="td_04" id="mento_score_${status.index }">
	                                                	<c:if test="${model.me_list[status.index].MENTO eq ''}">
	                                                		0
	                                                	</c:if>
	                                                	<c:if test="${model.me_list[status.index].MENTO != ''}">
	                                                		${model.me_list[status.index].MENTO}
	                                                	</c:if>
	                                                	
	                                                </td>
	                                                <td class="td_05" id="row_total_score_${status.index}"></td>
	                                            </tr>
										        </c:forEach>
									        	<tr>
									        		<td id="totalscore0"></td>
									        		<td id="totalscore1">총계</td>
											        <td id="totalscore2"></td>
											        <td id="totalscore3"></td>
											        <td id="totalscore4"></td>
											        <td id="totalscore5"></td>
											        <td id="totalscore6"></td>
											        <td id="totalscore7"></td>
											        <td id="totalscore8"></td>
											        <td id="totalscore9"></td>
											        <td id="totalscore10"></td>
											        <td id="totalscore11"></td>
											        <td id="totalscore12"></td>
										        </tr>
									        
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="register">
                                        <a href="javascript:excelDown()">엑셀출력</a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </section>

                </div>
            </div>
        </div>
    </section>
    <!--푸터-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/freshman.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery.table2excel.js" type="text/javascript"></script>
    
</body></html>

<script type="text/javascript">
	//가로 줄 총계
	const table = document.getElementById('table');
	let sum = 0;
	for(let j = 2; j < table.rows.length-1; j++){
		for(let i = 2; i < 12; i++){
			sum +=
			parseInt(table.rows[j].cells[i].innerHTML);
		}
		//console.log("횟수1"+j+"횟수2"+sum);
		document.getElementById('row_total_score_'+(j-2)).innerText = sum;
		sum = 0;
	}
	
	
	//세로 줄 총계
	for(let j = 2; j < 13; j++){
		for(let i = 2; i < table.rows.length-1; i++){
			sum +=
			parseInt(table.rows[i].cells[j].innerHTML);
		}
		//console.log("횟수1"+j+"횟수2"+sum);
		document.getElementById('totalscore'+j).innerText = sum;
		sum = 0;
	}
	
	//엑셀다운
	function excelDown()
	{
    	 $("#table").table2excel({
             name: "Excel table",
             filename: "신입생 통계 표",
             fileext: ".xls",
             exclude_img: true,
             exclude_links: true,
             exclude_inputs: true
         });
	}
	
	


</script>