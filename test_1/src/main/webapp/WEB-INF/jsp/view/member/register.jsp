<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script src="${pageContext.request.contextPath}/resources/sweetalert/jquery-1.12.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->
<!--공통상단-->
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/register.css" type="text/css">
<!--공통상단 끝-->

<style>
    a {
        color: #ffffff !important;
        text-decoration: none !important;
    }
</style>

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
                                    
                                    <li>
                                        <a href="#">마이페이지</a>
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
                                    <li><span><img src="${pageContext.request.contextPath}/resources/img/home_icon.png"></span>메인</li>
                                    <li>로그인</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>회원가입</h2>
                                    </div>
                                    <!-- 공통타이틀 -->

                                    <!-- 양식 리스트 -->
                                    <div class="form_list_con">
                                        <!--메인버튼 끝-->
                                        <div>
                                        	<img src="${pageContext.request.contextPath }/resources/img/logo.png">
                                        </div>
										<div class="form_list_login">
											<form action="${pageContext.request.contextPath}/user/member/register.do" method="post" id="member_login_form" name="member_login_form" >
												<div >
													<ul class="form_list_bt">
														<li>
															<input type="text" id="ID" name="EMAIL" placeholder="이메일">
														</li>
														<li>
															<input type="password" id="PASSWORD" name="PASSWORD" placeholder="비밀번호">
														</li>
														<li>
															<input type="text" id="address" name="ADDRESS" placeholder="주소">
														</li>
														<li>
															<input type="text" id="phone" name="PHONE" placeholder="핸드폰 번호">
														</li>
														<li>
															<input type="text" id="name" name="NAME" placeholder="이름">
														</li>
														<li>
															<select  id="level" name="LEVEL" >
																<option value="">
																	직업을 선택하여주세요.
																</option>
																<option value="2">
																	교수 or 조교
																</option>
																<option value="1">
																	학생
																</option>
															</select>
														</li>
														<li>
															<input ID="RE_BT" type="submit" id="REGISTER"  value="회원가입">
														</li>
													</ul>
												</div>
											</form>
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
<%@ include file="../include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
</script>
<!-- js 끝 -->