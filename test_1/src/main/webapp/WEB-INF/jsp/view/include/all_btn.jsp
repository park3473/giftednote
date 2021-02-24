<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
	a { color:#ffffff !important; text-decoration:none !important; }
	
	#sub_btn_mo {
		width: 100%;
		height: 100%;
		position: relative;
		padding: 0 20px;
	}
	
	#sub_btn_mo .btn_mo_wrap {
		text-align: center;
	}
	
	#sub_btn_mo .btn_mo_area {
		width: 100%;
		height: auto;
		position: relative;
		overflow: hidden;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con{
		padding: 0;
		margin: 0;
		position: relative;
		overflow: hidden;
	}
	
	#sub_btn_mo .btn_mo_area .btn_first_con {
		margin-bottom: 30px;
	}
	
	#sub_btn_mo .btn_mo_area .btn_first_con > li {
		width: calc((100% - 90px) / 4);
		margin-right: 30px;
		float: left;
		padding: 15px;
		border-radius: 5px;
	}
	
	#sub_btn_mo .btn_mo_area .btn_first_con > li:last-of-type {
		margin-right: 0;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_01 {
		background-color: #9c9d9f;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_02 {
		background-color: #c33a2b;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_03 {
		background-color: #c0b07d;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_04 {
		background-color: #7384c3;
	}	
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_05 {
		background-color: #eab486;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_06 {
		background-color: #d96850;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_06 {
		background-color: #d96850;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_07 {
		width: 100%;
		background-color: #73c3b4;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_07 > .btn_img {
		display: inline-block;
		width: auto;
		margin-bottom: 0;
	}
	
	#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_07 > h2 {
		display: inline-block;
		width: auto;
	}
	
	#sub_btn_mo .btn_mo_area .btn_first_con > li > .btn_img {
		width: 100%;
		margin-bottom: 15px;
	}
	
	#sub_btn_mo .btn_mo_area .btn_first_con > li > .btn_img > img {
		width: auto;
		max-width: 100%;
	}
	
	#sub_btn_mo .btn_mo_area .btn_first_con > li > h2 {
		color: #fff;
		font-size: 1rem !important;
		font-weight: 600;
		margin-bottom: 10px;
	}
	
	#sub_btn_mo .btn_mo_area .btn_second_con > li {
		width: calc((100% - 30px) / 2);
		margin-right: 30px;
		float: left;
		padding: 15px;
		border-radius: 5px;
	}
	
	#sub_btn_mo .btn_mo_area .btn_second_con > li:last-of-type {
		margin-right: 0;
	}
	
	#sub_btn_mo .btn_mo_area .btn_second_con > li > h2 {
		margin: 0;
		color: #fff;
		font-size: 1.1rem !important;
		font-weight: 600;
	}
	
	#sub_btn_mo .btn_mo_area .btn_third_con > div{
		padding-right:0px;
		padding-left:0px;
	}
	@media all and (max-width: 1601px) {}
	@media all and (max-width: 1441px) {}
	@media all and (max-width: 1281px) {
		#sub_btn_mo .btn_mo_area .btn_mo_con .btn_box_04 {
			margin-right: 0;
			margin-bottom: 30px;
		}
	}
	@media all and (max-width: 1025px) {}
	@media all and (max-width: 801px) {
		#sub_btn_mo .btn_mo_area .btn_first_con {
			margin-bottom: 15px;
		}
		
		#sub_btn_mo .btn_mo_area .btn_first_con > li {
			width: calc((100% - 45px) / 4);
			margin-right: 15px;
		}
		
		#sub_btn_mo .btn_mo_area .btn_second_con > li {
			width: calc((100% - 15px) / 2);
			margin-right: 15px;
		}
		
	}
	@media all and (max-width: 671px) {
		#sub_btn_mo .btn_mo_area .btn_first_con {
			margin-bottom: 0;
		}
	
		#sub_btn_mo .btn_mo_area .btn_first_con > li {
			width: calc((100% - 15px) / 2);
			margin-bottom: 15px;
		}
		
		#sub_btn_mo .btn_mo_area .btn_first_con > li:nth-of-type(2n) {
			margin-right: 0;
			margin-bottom: 0;
		}
	}
	@media all and (max-width: 481px) {}
	@media all and (max-width: 371px) {}
	@media all and (max-width: 321px) {}
	
	
</style>

<!--서브버튼 pc-->
<div class="sub_btn_pc">
	<div class="container text-center">

		<div class="nfa_img">
			<div style="margin-top:20px;">
				<div class="language-nav-kr" style="margin-bottom:5px;"><a href="${pageContext.request.contextPath}/langage.do?langage=kr"><span><img style="width:40px;" src="${pageContext.request.contextPath}/resources/img/kr.png"></span>KOR</a></div>
				<div class="language-nav-us"><a href="${pageContext.request.contextPath}/langage.do?langage=us"><span><img style="width:40px;" src="${pageContext.request.contextPath}/resources/img/en.png"></span>ENG</a></div>
			</div>
			
			
			<c:if test="${ssion_user_login == 'okok'}">
				<div class="col t_pad_15">
					<div class="sub_btn_00 sub_btn_04-1" style="border-radius:5px;">
						<p class="font_noto txt_18 gray_00">
							<c:if test="${ssion_langage == 'kr'}">로그아웃</c:if>
							<c:if test="${ssion_langage != 'kr'}">LOGOUT</c:if>
						</p>
					</div>
				</div>
				<c:if test="${ssion_user_level == '1'}">
				<div class="col t_pad_15">
					<div class="sub_btn_00 sub_btn_04" onclick="location.href='${pageContext.request.contextPath}/admin/contest_setting/active.do'" style="border-radius:5px;">
						<p class="font_noto txt_18 gray_00">
							<c:if test="${ssion_langage == 'kr'}">관리자</c:if>
							<c:if test="${ssion_langage != 'kr'}">ADMIN</c:if>
						</p>
					</div>
				</div>
				</c:if>
				<div class="col t_pad_15">
					<div class="sub_btn_00 sub_btn_04-2" style="border-radius:5px;">
						<p class="font_noto txt_18 gray_00">
							<c:if test="${ssion_langage == 'kr'}"><span>${ssion_user_name} </span>님<br>환영합니다.</c:if>
							<c:if test="${ssion_langage != 'kr'}">Welcome<br><span>${ssion_user_name}.</span></c:if>
						</p>
					</div>
				</div>				
			</c:if>
			<c:if test="${ssion_user_login != 'okok'}">
				<div class="col t_pad_15">
					<div class="sub_btn_00 sub_btn_04-1" style="border-radius:5px;">
						<p class="font_noto txt_18 gray_00">
							<c:if test="${ssion_langage == 'kr'}">사용자 확인</c:if>
							<c:if test="${ssion_langage != 'kr'}">USER CHECK</c:if>
						</p>
					</div>
				</div>
			</c:if>		
						
			

			
			<div class="col t_pad_15 b_pad_15">
				<div class="sub_btn_00 sub_btn_04" onclick="location.href='${pageContext.request.contextPath}/index.do'" style="border-radius:5px;">
					<p class="font_noto txt_18 gray_00">
						<c:if test="${ssion_langage == 'kr'}">처음으로</c:if>
						<c:if test="${ssion_langage != 'kr'}">HOME</c:if>
					</p>
				</div>
			</div>
			
			<c:if test="${session_contest == 'true'}">
				<c:if test="${session_contest_location == ssion_user_location }">
					<div class="col b_pad_15">
						<div class="sub_btn_00 sub_btn_08"
							onclick="javascript:login_pl2()">
							<div>
								<img src="${pageContext.request.contextPath}/resources/img/btn_ico_04.png">
							</div>
							<p class="font_noto txt_18 gray_00 t_pad_10">
								<c:if test="${ssion_langage == 'kr'}">경진 대회</c:if>
								<c:if test="${ssion_langage != 'kr'}">Competitive Contest</c:if>
							</p>
						</div>
					</div>
				</c:if>
			</c:if>
			
			<div class="col b_pad_15">
				<div class="sub_btn_00 sub_btn_01"
					onclick="location.href='${pageContext.request.contextPath}/program/guide_a.do'">
					<div>
						<img src="${pageContext.request.contextPath}/resources/img/btn_ico_01.png">
					</div>
					<p class="font_noto txt_18 gray_00 t_pad_10">
						<c:if test="${ssion_langage == 'kr'}">이용안내</c:if>
						<c:if test="${ssion_langage != 'kr'}">Information Use</c:if>
					</p>
				</div>
			</div>
			<div class="col b_pad_15">
				<div class="sub_btn_00 sub_btn_02"
					onclick="javascript:contest_play()">
					<div>
						<img src="${pageContext.request.contextPath}/resources/img/btn_ico_02.png">
					</div>
					<p class="font_noto txt_18 gray_00 t_pad_10">
						<c:if test="${ssion_langage == 'kr'}">자가진단</c:if>
						<c:if test="${ssion_langage != 'kr'}">Self-Diagnosis</c:if>
					</p>
				</div>
			</div>

			<div class="col b_pad_15">
				<div class="sub_btn_00 sub_btn_03"
					onclick="location.href='${pageContext.request.contextPath}/program/self_statistics.do'">
					<div>
						<img src="${pageContext.request.contextPath}/resources/img/btn_ico_03.png">
					</div>
					<p class="font_noto txt_18 gray_00 t_pad_10">
						<c:if test="${ssion_langage == 'kr'}">진단통계</c:if>
						<c:if test="${ssion_langage != 'kr'}">Diagnostic Statistics</c:if>
					</p>
				</div>
			</div>

			<div class="col b_pad_15">
				<div class="sub_btn_00 sub_btn_07"
					onclick="javascript:login_pl1()">
					<div>
						<img src="${pageContext.request.contextPath}/resources/img/btn_ico_04.png">
					</div>
					<p class="font_noto txt_18 gray_00 t_pad_10">
						<c:if test="${ssion_langage == 'kr'}">수료 현황</c:if>
						<c:if test="${ssion_langage != 'kr'}">Certificate Status</c:if>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!--서브버튼 pc-->


<!--서브버튼 mo-->
<div id="sub_btn_mo" class="sub_btn_mo nfa_none">
	<div class="btn_mo_wrap">
		<div class="btn_mo_area">
			<ul class="btn_mo_con btn_first_con">
				<li class="btn_box_01" onclick="location.href='${pageContext.request.contextPath}/program/guide_a.do'">
					<div class="btn_img">
						<img src="${pageContext.request.contextPath}/resources/img/btn_ico_01.png">
					</div>
					<h2>
						<c:if test="${ssion_langage == 'kr'}">이용안내</c:if>
						<c:if test="${ssion_langage != 'kr'}">Information Use</c:if>
					</h2>
				</li>
				<li class="btn_box_02" onclick="javascript:contest_play()">
					<div class="btn_img">
						<img src="${pageContext.request.contextPath}/resources/img/btn_ico_02.png">
					</div>
					<h2>
						<c:if test="${ssion_langage == 'kr'}">자가진단</c:if>
						<c:if test="${ssion_langage != 'kr'}">Self-Diagnosis</c:if>
					</h2>
				</li>
				<li class="btn_box_03" onclick="location.href='${pageContext.request.contextPath}/program/self_statistics.do'">
					<div class="btn_img">
						<img src="${pageContext.request.contextPath}/resources/img/btn_ico_03.png">
					</div>
					<h2>
						<c:if test="${ssion_langage == 'kr'}">진단통계</c:if>
						<c:if test="${ssion_langage != 'kr'}">Diagnostic Statistics</c:if>
					</h2>
				</li>
				<li class="btn_box_04" onclick="javascript:login_pl1()">
					<div class="btn_img">
						<img src="${pageContext.request.contextPath}/resources/img/btn_ico_04.png">
					</div>
					<h2>
						<c:if test="${ssion_langage == 'kr'}">수료현황</c:if>
						<c:if test="${ssion_langage != 'kr'}">Certificate Status</c:if>
					</h2>
				</li>
				<c:if test="${session_contest == 'true'}">
					<c:if test="${session_contest_location == ssion_user_location }">
						<li class="btn_box_07" onclick="javascript:login_pl2()">
							<div class="btn_img">
								<img src="${pageContext.request.contextPath}/resources/img/btn_ico_04.png">
							</div>
							<h2>
								<c:if test="${ssion_langage == 'kr'}">경진대회</c:if>
								<c:if test="${ssion_langage != 'kr'}">Competitive Contest</c:if>
							</h2>
						</li>
					</c:if>
				</c:if>
			</ul>
			<ul class="btn_mo_con btn_second_con">
				<li class="btn_box_05" onclick="location.href='${pageContext.request.contextPath}/index.do'">
					<h2>
						<c:if test="${ssion_langage == 'kr'}">처음으로</c:if>
						<c:if test="${ssion_langage != 'kr'}">HOME</c:if>
					</h2>
				</li>
				<c:if test="${ssion_user_login == 'okok'}">
				<li class="btn_box_06 sub_btn_04-1">
					<h2>
						<c:if test="${ssion_langage == 'kr'}">로그아웃</c:if>
						<c:if test="${ssion_langage != 'kr'}">LOGOUT</c:if>
					</h2>
				</li>
				</c:if>
				<c:if test="${ssion_user_login != 'okok'}">
				<li class="btn_box_06">
					<h2>
						<c:if test="${ssion_langage == 'kr'}">사용자 확인</c:if>
						<c:if test="${ssion_langage != 'kr'}">USER CHECK</c:if>
					</h2>
				</li>
				</c:if>
			</ul>
			<ul class="btn_mo_con btn_third_con">
				<c:if test="${ssion_user_login == 'okok'}">
				<c:if test="${ssion_user_level == '1'}">
				<div class="col t_pad_15">
					<div class="sub_btn_00 sub_btn_04" onclick="location.href='${pageContext.request.contextPath}/admin/contest_setting/active.do'" style="border-radius:5px;">
						<p class="font_noto txt_18 gray_00">
							<c:if test="${ssion_langage == 'kr'}">관리자</c:if>
							<c:if test="${ssion_langage != 'kr'}">ADMIN</c:if>
						</p>
					</div>
				</div>
				</c:if>
				</c:if>
			</ul>
		</div>
	</div>
</div>
<script>
	function login_pl1(){
		if('${ssion_user_login}' != 'okok'){
			swal({
                
                title: '<spring:message code="self.login_popup"/>',
                type: "warning",
                confirmButtonText: "Yes",
                closeOnConfirm: false
            });
		}else{
			location.href = "${pageContext.request.contextPath}/program/ceftificates.do?IDX=7";
		}
	}
	function login_pl2(){
		if('${ssion_user_login}' != 'okok'){
			swal({
         		
                title: '<spring:message code="self.login_popup"/>',
                type: "warning",
                confirmButtonText: "Yes",
                closeOnConfirm: false
            });
		}else{
			location.href = "${pageContext.request.contextPath}/view/contest/view.do";
		}
	}
	function contest_play(){
		if('${ssion_user_login}' != 'okok'){
			swal({
                
                title: '<spring:message code="self.login_popup"/>',
                type: "warning",
                confirmButtonText: "Yes",
                closeOnConfirm: false
            });
		}else{
			if('${session_contest}' == 'true'){
				if('${ssion_member_type}' == '1'){
					location.href = "${pageContext.request.contextPath}/program/self_main.do";
				}else{
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
				}
			}else{
				location.href = "${pageContext.request.contextPath}/program/self_main.do";
			}
		}
	}
</script>
<!--서브버튼 mo-->