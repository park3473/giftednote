<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 공통 탑 -->
                    <div class="sc_top">
                        <div class="sc_top_size">
                            <div class="top_home">
                                <div class="home_title">
                                    <h2>카이스트 연구노트</h2>
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