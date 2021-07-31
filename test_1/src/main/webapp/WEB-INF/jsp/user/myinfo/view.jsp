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
<!--CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tail.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/myinfo_view.css" type="text/css">
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- fontawasome/lineawasome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawasome/all.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<!--공통상단 끝-->

<style>
    a {
        color: #ffffff;
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
<section id="new_sc" class="sc_wrap">
        <div class="sc_area">
            <div class="sc_con">
                <div class="sc_size">

                    <!-- 공통 탑 -->
                    <div class="sc_top">
                        <div class="sc_top_size">
                            <div class="top_home">
                                <div class="home_btn">
                                    <a href="${pageContext.request.contextPath}/">HOME</a>
                                </div>
                                <div class="home_title">
                                    <h2>연구노트</h2>
                                </div>
                            </div>
                            <div class="gt_menu_cont">
                                <ul class="gt_menu_box">
                                	<c:if test="${session_login == 'ok' }">
                                    <li>
                                        <p>
                                            <span>${session_name }</span>님
                                        </p>
                                    </li>
                                    
                                    <li class="logout_btn">
                                        <a onclick="location.href='/user/member/logout.do'">로그아웃</a>
                                    </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 공통 탑 end-->

                    <!-- 본문 내용-->
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources/img/home_icon.png"></span>회원</li>
                                    <li>내정보</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>내정보</h2>
                                    </div>
                                    <!-- 공통타이틀 -->

                                    <!-- 양식 리스트 -->
                                    <div class="form_list_con">
                                        <!--메인버튼 끝-->
                                        <div id="form_title">
                                        	과학 영재 노트
                                        </div>
										<div class="form_list_login">
											<div>
												<ul id="form_myinfo_ul">
													<li id="form_myinfo_name">
														<c:if test="${model.LEVEL == '1' }">
															<span>학생</span>
														</c:if>
														<c:if test="${model.LEVEL == '2' }">
															<span>멘토</span>
														</c:if>
														<c:if test="${model.LEVEL == '3' }">
															<span>관리자</span>
														</c:if>
														${model.NAME }</li>
													<li>${model.ADDRESS }</li>
													<li><span>Tel.</span>${model.PHONE }</li>
													<li><span>Birth.</span>${model.BIRTH }</li>
												</ul>
											</div>
											<div class="form_logo">
												<ul class="form_logo_ul">
													<li><img src="${pageContext.request.contextPath }/resources/img/logo.png"></li>
													<li><button onclick="javascript:update_modal()">수정하기</button></li>
													<li><button>회원탈퇴</button></li>
												</ul>
											</div>
										</div>
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
<%@ include file="../../include/footer.jsp" %>
<!--공통하단 끝-->

<div id="meeting_form_modal" class="all_modal">
	<div class="all_modal_con">
		<div class="modal_box">

			<div class="modal_title">
				<!-- 공통타이틀 -->
				<div class="all_title">
					<div class="line">
						<span></span>
					</div>
					<h2>개인 정보 수정</h2>
				</div>
				<!-- 공통타이틀 -->

				<!-- 닫기 -->
				<div id="close_btn" class="close_btn">
					<a href="#"> <i class="las la-times"></i>
					</a>
				</div>
			</div>
			<div id="myinfo_update_modal">
				<div>
					<ul>
						<li>
							<p>이름</p>
							<input type="text" id="UPDATE_NAME" name="NAME" value="${model.NAME }">
						</li>
						<li>
							<p>주소</p>
							<input type="text" id="UPDATE_ADDRESS" name="ADDRESS" value="${model.ADDRESS }">
						</li>
						<li>
							<p>번호</p>
							<input type="text" id="UPDATE_PHONE" name="PHONE" value="${model.PHONE }">
						</li>
						<li>
							<p>생년월일</p>
							<input type="text" id="UPDATE_BIRTH" name="BIRTH" value="${model.BIRTH }">
						</li>
						<li>
							<button onclick="javascript:myinfo_update()" id="myinfo_update" >정보 수정</button>
						</li>
						<li>
							<input type="hidden" id="UPDATE_IDX" value="${model.IDX }">
							<input type="hidden" id="UPDATE_EMAIL" value="${model.EMAIL }">
						</li>
					</ul>
				</div>
			</div>
			<div>${PASSWORD}</div>
		</div>
	</div>
</div>

<!-- js 시작 -->
<script type="text/javascript">
	//alert('${ip_session}');
	function bt_pwss() {
		$('#meeting_form_modal').show();

	}
	function login() {
		if ($('#ID').val() == '') {
			alert('아이디를 입력 해주세요');
			return;
		}
		if ($('#PASSWORD').val() == '') {
			alert('패스워드 입력 해주세요');
			return;
		}

		var URL = '${pageContext.request.contextPath}/user/member/login.do'
		var formData = $("#member_login_form").serialize();

		console.log(formData);

		$.ajax({
				type : "POST",
				url : URL,
				cache : false,
				data : formData,
				success : function(result) {
					var s = result.indexOf("true");
					if (s > -1) {
					idchk = true;
					location.href = '${pageContext.request.contextPath}/note/list.do?EMAIL='+ $('#ID').val();
					return;
				} else if (result.indexOf("false:-1") > -1) {
					Swal.fire('이메일 혹은 패스워드를 재확인 해주십시오.');
					return;
				}
			}
		});
	}

	function password_re_search() {
		var EMAIL = $('#password_re_email').val()
		$.ajax({
			type : "POST",
			url : "/user/member/pw_re.do",
			cache : false,
			data : ({
				EMAIL : EMAIL
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data.pw);
				var password = data;
				console.log(password);
				Swal.fire('비밀번호는' + password + '입니다.');
			}
		});
	}

	function login_enter() {
		if (window.event.keyCode == 13) {
			login();
		}
	}
	
	
	function update_modal(){
		$('#meeting_form_modal').show();
	}
	
	$('.close_btn').click(function(){
		$('#meeting_form_modal').hide();
	})
	
	
	function myinfo_update(){
		Swal.fire({
			  title: '개인정보를 수정하시겠습니까?',
			  text: "수정 하시면 다시 되돌릴수 없습니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes!',
			  cancelButtonText: 'No'
			}).then((result) => {
			  if (result.isConfirmed) {
				  var NAME = $('#UPDATE_NAME').val();
				  var PHONE = $('#UPDATE_PHONE').val();
				  var ADDRESS = $('#UPDATE_ADDRESS').val();
				  var BIRTH = $('#UPDATE_BIRTH').val();
				  var IDX = $('#UPDATE_IDX').val();
				  var EMAIL = $('#UPDATE_EMAIL').val();
				  $.ajax({
						type : "POST",
						url : "/user/myinfo/update.do",
						cache : false,
						data : ({
							EMAIL : EMAIL,
							IDX : IDX,
							NAME : NAME,
							ADDRESS : ADDRESS,
							PHONE : PHONE,
							BIRTH : BIRTH
						}),
						dataType : "json",
						success : function(result) {
							if(result = true){
								Swal.fire({
									text : "정보가 수정되었습니다.!",
									confirmButtonText: 'Yes!'
								}).then((result) => {
									if(result.isConfirmed) {
										location.href='${pageContext.request.contextPath}/';
									}
								})	
							}
						}
					});
			  }
			})
	}
	
	$.datetimepicker.setLocale('ko');
	jQuery('#UPDATE_BIRTH').datetimepicker({
		format : 'Y-m-d',
		lang : "ko",
		timepicker : false
	});
</script>
<!-- js 끝 -->