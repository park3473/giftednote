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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/member_view.css" type="text/css">
<style>
    a {
        color: #ffffff;
        text-decoration: none !important;
    }
    
    .tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:#3364b1;border-style:solid;border-width:1px;font-family:'Noto Sans KR', sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-0pky{border-color:#3364b1;}
</style>
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
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>관리자</li>
                                    <li>팀 리스트</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size" style="height:100vh !important">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>노트 리스트</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
									<div>
										<table class="tg" style="width:100%">
											<thead>
											  <tr class="tbl_th">
											    <th class="tg-0lax">순번</th>
											    <th class="tg-0lax">연구번호</th>
											    <th class="tg-0lax">제목</th>
											    <th class="tg-0lax">소속 대학 코드</th>
											    <th class="tg-0lax">작성자</th>
											    <th class="tg-0lax">작성일</th>
											    <th class="tg-0lax">지도일지</th>
											    <th class="tg-0lax">학생연구역량평가</th>
											    <th class="tg-0lax">연구 팀원 리스트</th>
											  </tr>
											</thead>
											<tbody id="list">
												<c:forEach var="item" items="${model.list }" varStatus="Status">
												<tr class="note_list">
												    <td class="tg-0lax">${model.itemtotalcount - (Status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
												    <td class="tg-0lax" id="lab_name_${Status.index+1 }">${item.lab_id }</td>
												    <td class="tg-0lax" id="lab_study_title_${Status.index+1 }" >${item.lab_study_title }</td>
												    <td class="tg-0lax" id="lab_coll_cd_${Status.index+1 }">${item.lab_coll_cd }</td>
												    <td class="tg-0lax" id="lab_ur_userid_${Status.index+1 }">${item.lab_ur_userid }</td>
												    <td class="tg-0lax" id="lab_reg_dt_${Status.index+1 }">${item.lab_reg_dt }</td>
												    <td class="tg-0lax" id="exploring_${Status.index+1 }"><button type="button" onclick="location.href='${pageContext.request.contextPath}/record/list.do?lab_id=${item.lab_id }'">지도일지</button></td>
												    <td class="tg-0lax" id="srce_${Status.index+1 }"><button type="button" onclick="location.href='${pageContext.request.contextPath}/srce/srce.do?lab_id=${item.lab_id}'">학생연구역량평가</button></td>
												    <td class="tg-0lax" id="team_${Status.index+1 }"><button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/team/getTeamList.do?lab_id=${item.lab_id }'">팀리스트</button></td>
												 </tr>
												 </c:forEach>
											</tbody>
										</table>
									</div>
									
									<!-- 페이징 -->
									<input type="hidden" value="${model.page}">
									<input type="hidden" value="${model.itempagestart}">
									<input type="hidden" value="${model.itempageend}">
									<input type="hidden" value="${model.itemCount}">
									<input type="hidden" value="${model.itemtotalcount}">
									<input type="hidden" value="${model.itemtotalpage }">
                                    <div class="paging_con">
                                        <div class="paging_box">
	                                        <c:if test="${model.page > 0 }">
		                                    	<div class="arrows_box arrows_box_lt">
											        <a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});">
											            <i class="las la-angle-left"></i>
											        </a>
											    </div>
	                                    	</c:if>
	                                    	<c:if test="${model.page <= 0}">
	                                    		<div class="arrows_box arrows_box_lt">
											        <a href="#">
											            <i class="las la-angle-left"></i>
											        </a>
											    </div>
	                                    	</c:if>
                                            <ul class="number_box">
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
											    <li class="number page_active"><a>1</a></li>
											    </c:if>
											    <c:if test="${model.itempageend < 0}">
											    <li class="number page_active"><a>1</a></li>
											    </c:if>
                                            </ul>
                                            <c:if test="${model.itemCount < model.itemtotalcount/(model.page+1)}">
                                            	<div class="arrows_box arrows_box_gt">
	                                                <a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});"><i class="las la-angle-right"></i></a>
	                                            </div>
                                            </c:if>
                                            <c:if test="${model.itemCount >= model.itemtotalcount/(model.page+1)}">
                                            	<div class="arrows_box arrows_box_gt">
	                                                <a href="#"><i class="las la-angle-right"></i></a>
	                                            </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <!-- 페이징 end-->
									
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
	
	$.datetimepicker.setLocale('ko');
	jQuery('#UPDATE_BIRTH').datetimepicker({
		format : 'Y-m-d',
		lang : "ko",
		timepicker : false
	});
	
	
	/*
	function team_list(idx){
		
		var N_IDX = idx;
		
		$.ajax({
			type : "POST",
			url : "/admin/team/getTeamList.do",
			cache : false,
			data : ({
				N_IDX : N_IDX
			}),
			dataType : "json",
			success : function(data , status , xhr) {
				console.log(data);
				var html = "";
				for(i = 0; i < data.length; i++){
					html += '<tr onclick='
					html += 'location.href="${pageContext.request.contextPath}/exploring/exploring.do?N_IDX='+data[i].N_IDX+'&IDX='+data[i].IDX+'">'
					html += '<td>'+i+'</td>'
					html += '<td>'+data[i].NAME+'</td>'
					html += '<td>'+data[i].SCHOOL_NAME+'</td>'
					html += '<td>'+data[i].EMAIL+'</td>'
					
					html += '</tr>'
				}
				console.log(html);
				$('#teamList').html(html);
			}
		});
		
	}
	*/
	
	function pageChanged(page , endpage){
		if (page < 0) {
            page = 0;
        }
        
        if (endpage < 0) {
            endpage = 0;
        }
        
        if (page >= endpage) {
            page = endpage;
        }

        var URL = "note_list.do?PAGE="+page;
        if('${model.ITEM_COUNT}' == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + '${model.ITEM_COUNT}';
        }
        
        location.href = URL;
	}
	
	
	
</script>
<!-- js 끝 -->