<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://unpkg.com/html2canvas@1.0.0-rc.5/dist/html2canvas.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/detail.css" type="text/css">
<!--삭제금지-->
<!--공통상단-->
<%@ include file="../include/header.jsp" %>
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

	#detail_modal_content{
		width:798px;
		height:1098px;
		border:1px solid lightgray;
	}
	
	    #cke img {
    	width: auto;
    	max-width: 100%;
    	float: none !important;
    }
    
    .pdf_IMG{
    	background-size : cover;
    	text-align:center;
    	width:798px;
    	height:1098px
    }

</style>
<section id="new_sc" class="sc_wrap">
        <div class="sc_area">
            <div class="sc_con">
                <div class="sc_size">

                    <!-- 공통 탑 -->
                    <%@ include file="../include/top.jsp" %>
                    <!-- 공통 탑 end-->

                    <!-- 본문 내용-->
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>노트</li>
                                    <li>연구노트</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>연구노트</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
                                    <!-- 양식 리스트 -->
                                    <c:if test="${model.Pagecount > 0 }">
                                    <div id="detail_modal">
                                    	<ul id="detail_modal_ul">
                                    		<li class="detail_modal_li">
												<ul>
												<c:forEach var="i" begin="1" end="${model.Pagecount}" varStatus="count">
											    	<li id="deatil_page_list" onclick="javascript:content(${count.index})" class="page${count.index} allpage <c:if test="${count.index == '1' }">PageActive</c:if>">${count.index}<span>Page</span></li>
												</c:forEach>
													<li class="detail_page_up"><button type="button" id="savePdf">PDF 다운로드</button></li>
												</ul>
												<ul style="display:none">
													<li>${model.list[0].P_IDX }</li>
													<li id="lab_id" value="${model.lab_id}">${model.lab_id }</li>
													<li id="CONTENT" content="${model.list[0].CONTENT }">${model.list[0].CONTENT }</li>
												</ul>
                                    		</li>
                                    		<li class="detail_modal_li">
                                    			<div>
													<div id="cke">
														<div name="CONTENT" id="detail_modal_content" listsize="${model.list.size() }">
															${model.list[0].CONTENT }
														</div>
													</div>
												</div>
                                    		</li>
                                    	</ul>
									</div>
									 <div id="detail_modal">
                                    	<ul id="detail_modal_ul">
                                    		<li class="detail_modal_li" id="pdf_wrap">
                                    			<div>
													<div id="pdf_down" style="height:1098px;overflow:scroll;display:none;">
														<div class="pdf_page pdf_IMG" style="background-image : url('${pageContext.request.contextPath}/resources/img/note_img/${model.coll}.jpg');">
														
														</div>
															<c:forEach var="AllList" items="${model.AllList }" varStatus="var" >
																<c:if test="${AllList.CONTENT != '' }">
																	<div class="pdf_page" style="width:798px;border:1px solid black; padding:20px;">	
																	${AllList.CONTENT }
																	</div>
																</c:if>
															</c:forEach>
													</div>
												</div>
                                    		</li>
                                    	</ul>
									</div>
									</c:if>
									<c:if test="${model.Pagecount == 0 }">
										<script type="text/javascript">
											alert('등록된 연구노트가 없습니다. 연구노트를 작성하여주세요.');
											history.go(-1);
										</script>
									</c:if>
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
<%@ include file="../include/footer.jsp" %>
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
	
	function content(P_IDX){
		var lab_id = $('#lab_id').val();
		$.ajax({
			type : "POST",
			url : "/user/note/detail.do?",
			cache : false,
			data : ({
				P_IDX : P_IDX,
				lab_id : lab_id,
			}),
			dataType : "json",
			success: function(data , status, xhr){
				console.log(data);
				var view = data[0].CONTENT;
				$('#detail_modal_content').html(view);
				$('#insert_bt').attr('P_IDX',P_IDX);
				$('.allpage').removeClass('PageActive')
				$('.page'+P_IDX+'').addClass('PageActive');
				}
		})
	};
	
	
</script>
<script type="text/javascript">
/*
alert('${ip_session}');
if('${check}' == 'fail'){
	alert("실패");
}else{
	alert("성공")
}
*/

/*
$(window).load(function(){
	
	jQuery(function() {
        // ckeditor 적용
        editor = CKEDITOR.replace("ckeditor", ckeditor_config);   
    });
});
*/
	
</script>
<script>
//pdf 작성 js


$(function() {
  $("#savePdf").click(function() { // pdf저장 button id
      //$(".ad_i, .wrap_chart_btn").css("display", "none"); // 불필요한 태그 숨김
    //document.getElementById("loading").style.display = "block"; // 로딩 이미지 보이기
    //$("#loading").show(); jquery 사용할 경우
      //$("#main_frame", parent.document).parents("body").find("#loading").show(); // 부모 frame에 있는 loading 보이기

    // setTImeout을 하는 이유는 html2canvas를 불러오는게 너무 빨라서 앞의 js가 먹혀도 반영되지 않은 것처럼 보임
    // 따라서 0.1 초 지연 발생 시킴
	$('#pdf_down').css('display','block');
      setTimeout(function() {
        createPdf();
      }, 100);
  });
});

var renderedImg = new Array;

var contWidth = 200, // 너비(mm) (a4에 맞춤)
    padding = 5; //상하좌우 여백(mm)

function createPdf() { //이미지를 pdf로 만들기
  //document.getElementById("loading").style.display = "block"; // 로딩 이미지 보이기

  var lists = document.querySelectorAll(".pdf_page"),
      deferreds = [],
      doc = new jsPDF("p", "mm", "a4"),
      listsLeng = lists.length;

  for (var i = 0 ; i < listsLeng; i ++){
	  var deferred = $.Deferred();
	  deferreds.push(deferred.promise());
	  generateCanvas(i, doc , deferred , lists[i]);
  }
  
  $.when.apply($, deferreds).then(function(){
	var sorted = renderedImg.sort(function(a,b){return a.num < b.num ? -1 : 1;}),
		curHeight = padding,
		sortedLeng = sorted.length;
	for (var i = 0; i < sortedLeng; i ++){
		var sortedHeight = sorted[i].height,
		 sortedImage = sorted[i].image;
		if(i == 0){
			padding = 0;
			curHeight = 0;
			sortedHeight += 22;
			console.log(sortedHeight);
		}
		 if(i > 0){
			 curHeight = 5;
			 padding = 5;
			doc.addPage(); // 페이지를 추가함 
		 }
	        curHeight = padding; // 이미지가 들어갈 y축을 초기 여백값으로 초기화
	        doc.addImage(sortedImage, 'PNG', padding , curHeight, contWidth, sortedHeight); //이미지 넣기
	        curHeight += sortedHeight; // y축 = 여백 + 새로 들어간 이미지 높이
		}
		doc.save('FILE.pdf');
		
		curHeight = padding;
		renderedImg = new Array;
		
		$('#pdf_down').css('display','none');
	})
	  
  }
  
  
  

function generateCanvas(i, doc, deferred, curList){ //페이지를 이미지로 만들기
  var pdfWidth = $(curList).outerWidth() * 0.2645, //px -> mm로 변환
      pdfHeight = $(curList).outerHeight() * 0.2645,
      heightCalc = contWidth * pdfHeight / pdfWidth; //비율에 맞게 높이 조절
  html2canvas( curList ).then(
    function (canvas) {
      var img = canvas.toDataURL('image/PNG', 1.0); //이미지 형식 지정
      renderedImg.push({num:i, image:img, height:heightCalc}); //renderedImg 배열에 이미지 데이터 저장(뒤죽박죽 방지)     
      deferred.resolve(); //결과 보내기
    }
  );
}


</script>
<!-- js 끝 -->