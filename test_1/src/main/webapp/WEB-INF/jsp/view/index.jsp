<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script src="${pageContext.request.contextPath}/resources/sweetalert/jquery-1.12.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->

<c:if test="${ssion_langage == 'kr'}">자가진단</c:if>
<c:if test="${ssion_langage != 'kr'}">자가진단(영어)</c:if>

<!--공통상단-->
<%@ include file="./include/header.jsp" %>
<!--공통상단 끝-->

<style>
    a {
        color: #ffffff !important;
        text-decoration: none !important;
    }

    .video_wrap {
        position: fixed;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
    }

    @media all and (max-width: 801px) {
        .video_wrap {
            display: none;
        }
    }

</style>

<!-- 
<a href="${pageContext.request.contextPath}/langage.do?langage=kr">한국어</a>
<a href="${pageContext.request.contextPath}/langage.do?langage=us">영어</a> 
테스트  : <spring:message code="index.test"/> 
<c:if test="${ssion_langage == 'kr'}">
한국어

</c:if>
<c:if test="${ssion_langage == 'us'}">
영어
</c:if>
-->


<!-- 비디오 화면 -->
<div class="video_wrap">
    <video autoplay loop muted>
        <source src="${pageContext.request.contextPath}/resources/img/movie/all_bg.mp4">
    </video>
</div>
<!-- 비디오 화면 end-->

<div class="language-nav">
    <span class="col-sm-5 language-nav-kr">
        <a href="${pageContext.request.contextPath}/langage.do?langage=kr">
            <span><img src="${pageContext.request.contextPath}/resources/img/kr.png"></span>
            KOR
        </a>
    </span>
    <span class="col-sm-2" style="background:none; border:none;"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></span>
    <span class="col-sm-5 language-nav-us">
        <a href="${pageContext.request.contextPath}/langage.do?langage=us">
            <span><img src="${pageContext.request.contextPath}/resources/img/en.png"></span>
            ENG
        </a>
    </span>
</div>

<!--메인텍스트-->
<div class="container text-center">
    <div class="nfa_img main_txt">
        <c:if test="${ssion_langage == 'kr'}">
            <img src="${pageContext.request.contextPath}/resources/img/main_txt.png">
        </c:if>
        <c:if test="${ssion_langage == 'us'}">
            <img src="${pageContext.request.contextPath}/resources/img/main_txt_us.png">
        </c:if>
    </div>
</div>
<!--메인텍스트 끝-->



<!--메인버튼-->


<div class="main_btn">
    <div class="container text-center">

        <div class="row">
            <div class="col-sm-6 b_pad_30">
                <div class="main_btn_01" onclick="location.href='${pageContext.request.contextPath}/program/guide_a.do'">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/img/btn_ico_01.png">
                    </div>
                    <div class="font_noto txt_20 gray_00 t_pad_10">
                        <spring:message code="index.diagnostic_guide" />
                    </div>
                </div>
            </div>
            <div class="col-sm-6 b_pad_30">
                <div class="main_btn_02" onclick="javascript:contest_play()">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/img/btn_ico_02.png">
                    </div>
                    <div class="font_noto txt_20 gray_00 t_pad_10">
                        <spring:message code="index.self_diagnosis" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">

            <div class="col-sm-6 b_pad_30">
                <div class="main_btn_03" onclick="location.href='${pageContext.request.contextPath}/program/self_statistics.do'">
                    <div>
                        <c:if test="${ssion_langage == 'kr'}"><img src="${pageContext.request.contextPath}/resources/img/btn_ico_03.png"></c:if>
                        <c:if test="${ssion_langage != 'kr'}"><img src="${pageContext.request.contextPath}/resources/img/btn_ico_03.png"></c:if>
                    </div>
                    <!--
                    <div class="font_noto txt_20 gray_00 t_pad_10">
                        <c:if test="${ssion_langage == 'kr'}">진단통계</c:if>
                        <c:if test="${ssion_langage != 'kr'}">진단통계(영어)</c:if>
                    </div>
                    -->
                    <div class="font_noto txt_20 gray_00 t_pad_10">
                        <spring:message code="index.self_statistics" />
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="main_btn_07" onclick="location.href='${pageContext.request.contextPath}/program/ceftificates.do?IDX=7'">
                    <div>
                        <c:if test="${ssion_langage == 'kr'}"><img src="${pageContext.request.contextPath}/resources/img/btn_ico_04.png"></c:if>
                        <c:if test="${ssion_langage != 'kr'}"><img src="${pageContext.request.contextPath}/resources/img/btn_ico_04.png"></c:if>
                    </div>
                    <div class="font_noto txt_20 gray_00 t_pad_10">
                        <c:if test="${ssion_langage == 'kr'}">수료 현황</c:if>
                        <c:if test="${ssion_langage != 'kr'}">Certificate Status</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="color:#ffffff; margin:0 auto; text-align:center; font-size:.9rem; margin-top:30px; padding:15px 0; margin-bottom:-15px; opacity: 0.5;}">
    <p style="font-weight:600; margin-bottom: .5rem !important;">SINCE 2020</p>
    <c:if test="${ssion_langage == 'kr'}">2019년도 국민참여 예산 지원으로 소방청에서 개발하여 2020년 1월부터 서비스를 개시하였습니다!</c:if>
    <c:if test="${ssion_langage != 'kr'}">This service, which was developed by the National Fire Agency with the financial support of the national budget organized by the people participated in 2019, has begun in January 2020!</c:if>
    <!-- <p style="font-weight:600; margin-bottom: 0rem !important;">현재 접속자 수 : <span>1</span> / 누적 접속자 수 : <span>1</span></p> -->
</div>
<!--메인버튼 끝-->

<!--공통하단-->
<%@ include file="./include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
alert('${ip_session}');
function contest_play(){
	if('${ssion_user_login}' == 'okok'){
		if('${session_contest}' == 'true'){
				if('${ssion_member_type}' == '1'){
					location.href = "${pageContext.request.contextPath}/program/self_main.do";
				}else{
					if('${session_contest_location}' == '${ssion_user_location}'){
					swal({
		                //title: '직업을 선택 하여 주세요',
		                title: '<spring:message code="self.contest_popup_title"/>',
		                text:'<spring:message code="self.contest_popup_text"/>',
		                type: "warning",
		                confirmButtonText: '<spring:message code="self.contest_popup_confirm"/>',
				  		closeOnConfirm: false,
				  		showCancelButton : true,
				  		CancelButtonColor :"#DD6B55",
				  		  
				  		},function(isConfirm) {
				  			if(isConfirm)
				  			{
				  				location.href = "${pageContext.request.contextPath}/view/contest/view.do";
				  			}else{
				  				location.href = "${pageContext.request.contextPath}/program/self_main.do";
				  			}
				  		});
					}else{
						location.href = "${pageContext.request.contextPath}/program/self_main.do";
					}
				}
		}else{
			location.href = "${pageContext.request.contextPath}/program/self_main.do";
		}
	}else{
		location.href = "${pageContext.request.contextPath}/program/self_registration.do";
	}
	
}
</script>
<!-- js 끝 -->