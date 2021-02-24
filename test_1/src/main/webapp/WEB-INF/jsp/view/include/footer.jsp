<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	

<style>
	/*로그인팝업창*/
    #login_popup {
    	position: fixed;
    	top: 0;
    	left: 0;
    	right: 0;
    	bottom: 0;
    	background-color: rgba(0,0,0,0.6);
    	z-index: 99999;
    	display: none;
    	overflow:auto;
    }
    
    #login_popup .login_popup_area {
    	position: absolute;
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	height: auto;
    	overflow:hidden;
    	background-color: #d96850;
    	-webkit-box-shadow : 0px 0px 15px rgba(0,0,0,0.4);
    	box-shadow: 0px 0px 15px rgba(0,0,0,0.4);
    	padding: 0 40px;
    	padding-bottom: 40px;
    	border-radius: 20px;
    }
    
    #login_popup .login_popup_area .login_popup_title {
    	text-align: center;
    	background: linear-gradient( to top, #2d1511, #936046);
    	padding: 20px 30px;
    	border-radius: 0 0 9px 9px;
    	margin-bottom: 30px;
    	position: relative;
    	width: 450px;
    	height: auto;
    }
    
    #login_popup .login_popup_area .login_popup_title > h2 {
    	color: #fff;
    	font-weight: 500;
    	font-size: 1.6rem !important;
    }
    
    #login_popup .login_popup_area .login_form_wrap > ul {
    	padding: 0;
    	margin-bottom: 40px;
    }
    
    #login_popup .login_popup_area .login_form_wrap > ul > li {
    	margin-bottom: 20px;
    	overflow: hidden;
    }
    
    #login_popup .login_popup_area .login_form_wrap > ul > li:last-of-type {
    	margin-bottom: 0;
    }
    
    #login_popup .login_popup_area .login_form_wrap > ul > li .list_title {
    	width: 100px;
    	float: left;
    }
    
    #login_popup .login_popup_area .login_form_wrap > ul > li .list_title > h2 {
    	font-size: 1.1rem !important;
    	color: #fff;
    	font-weight: 500;
    	line-height: 45px;
    	margin: 0;
    }
    
    #login_popup .login_popup_area .login_form_wrap > ul > li .input_box {
    	width: calc(100% - 100px);
    	float: left;
    }
    
    #login_popup .login_popup_area .login_form_wrap > ul > li .input_box > input {
    	width: 100%;
	    height: 45px;
	    font-size: 0.9rem !important;
	    border: 1px solid #999;
	    font-family: inherit;
	    padding: .5em .5em;
	    border-radius: 0;
	    color: #666;
    }
    
    #login_popup .login_popup_area .login_form_wrap > ul > li .input_box > input:placeholder {
    	font-size: 0.9rem !important;
    	color: #666;
    }
    
    #login_popup .login_popup_area .login_btn_area {
    	width: 100%;
    	height: auto;
    	position: relative;
    }
    
    #login_popup .login_popup_area .login_btn_area > a {
    	width: calc((100% - 21px) / 2);
    	margin-right: 20px;
    	display: block;
    	float: left;
    	text-align: center;
    	background-color: #9c9d9f;
    	padding: 8px 0;
    	border-radius: 5px;
    }
    
    #login_popup .login_popup_area .login_btn_area > a:last-of-type {
    	margin-right: 0;
    	background-color: #eab486;
    }
    a#pw_check_check{
    	width:100% !important;
    }
    #check_ul{
    	padding:0px;
    	margin-top:110px;
    }
    #check_ul li{
    	margin:10px 0 10px 0;
    }
    #check_ul li label{
    	color:white;
    }
    
    #pw_check_btn{
		width: calc((100%) / 1);
    	margin-right: 20px;
		margin-bottom:20px;
		margin-top:20px;
    	display: block;
    	float: left;
    	text-align: center;
    	background-color: #ccc;
    	padding: 8px 0;
    	border-radius: 5px;
	}
    
    
    .check_label{
    width:130px;
    }
    
    #check_ul li input{
    	width: 71.1%;
    	height: 45px;
    	font-size: 0.9rem !important;
    	border: 1px solid #999;
    	font-family: inherit;
    	padding: .5em .5em;
    	border-radius: 0;
    	color: #666;
    }
    .material-icons{
	display:none;
	}
    @media all and (max-width: 1601px) {}
    @media all and (max-width: 1441px) {}
    @media all and (max-width: 1281px) {}
    @media all and (max-width: 1025px) {}
    @media all and (max-width: 801px) {
    	.material-icons{
			display:block;
			position:fixed;
			top:95%;
			left:48%;
			z-index:9999;
			color:white;
		}
    }
    @media all and (max-width: 671px) {
    	#login_popup {
    		padding: 0 20px;
    	}
    	
    	#login_popup .login_popup_area .login_popup_title {
    		width: auto;
    	}
    	
    	#login_popup .login_popup_area {
    		width: 430px;
    	}
    	#check_ul li input{
    	width: 100%;
    	height: 45px;
    	font-size: 0.9rem !important;
    	border: 1px solid #999;
    	font-family: inherit;
    	padding: .5em .5em;
    	border-radius: 0;
    	color: #666;
    }
    }
    @media all and (max-width: 481px) {
    	#login_popup .login_popup_area {
    		width: 350px;
    	}
    }
    @media all and (max-width: 376px) {
    	#login_popup .login_popup_area {
    		width: 280px;
    	}
    	
    	#login_popup .login_popup_area .login_popup_title > h2 {
    		font-size: 1.2rem !important;
    	}
    	
    	#login_popup .login_popup_area .login_form_wrap > ul > li .input_box {
    		width: 100%;
    	}

	#login_popup .login_popup_area .login_btn_area > a {
    	width: calc((100% - 21px) / 2);
    	margin-right: 20px;
    	display: block;
    	float: left;
    	text-align: center;
    	background-color: #9c9d9f;
    	padding: 8px 0;
    	border-radius: 5px;
    }
	#pw_check_btn{
		width: calc((100%) / 1);
    	margin-right: 20px;
		margin-bottom:20px;
		margin-top:20px;
    	display: block;
    	float: left;
    	text-align: center;
    	background-color: #ccc;
    	padding: 8px 0;
    	border-radius: 5px;
	}
	#check_ul li input{
    	width: 100%;
	}

	.list_title{
		display:none;
	}

	.check_label{
		display:none;
	}
    }
    @media all and (max-width: 321px) {}
    
    /*로그인팝업창 end*/
</style>


<div class="t_pad_15"></div>
<div id="login_popup" class="login_popup_wrap" >
        	    <div class="login_popup_area" onkeyup="enter_login();">
            		<div class="login_popup_title">
            			<h2>
            				<c:if test="${ssion_langage == 'kr'}">사용자 확인</c:if>
            				<c:if test="${ssion_langage != 'kr'}">User Check</c:if>
            			</h2>
           			</div>
           			<form class="login_form_wrap" id="loginform" name="loginform">
           				<ul class="login_form_area">
           					<li class="login_list">
           						<div class="list_title">
           							<h2>
           								<c:if test="${ssion_langage == 'kr'}">이름</c:if>
           								<c:if test="${ssion_langage != 'kr'}">Name</c:if>
           							</h2>
           						</div>
           						<div class="input_box">
           							<input type="text" class="login_input" id="NAME" name="NAME" autocomplete="off" placeholder="<c:if test="${ssion_langage == 'kr'}">이름을 입력하세요.</c:if><c:if test="${ssion_langage != 'kr'}">Please enter your name.</c:if>">
           						</div>
           					</li>
           					<li class="login_list">
           						<div class="list_title">
           							<h2>
           								<c:if test="${ssion_langage == 'kr'}">비밀번호</c:if>
       								    <c:if test="${ssion_langage != 'kr'}">Password</c:if>
       							    </h2>
       						    </div>
       						    <div class="input_box">
       							    <input type="password" class="login_input" id="PWD" name="PWD" autocomplete="off" placeholder="<c:if test="${ssion_langage == 'kr'}">비밀번호를 입력하세요.</c:if><c:if test="${ssion_langage != 'kr'}">Please enter your password.</c:if>">
       						    </div>
       					    </li>
       				    </ul>
       				    <div class="login_btn_area">
       				    	<a href="#" id="login_close_btn">
		       					<c:if test="${ssion_langage == 'kr'}">닫기</c:if>
		       					<c:if test="${ssion_langage != 'kr'}">Close</c:if>
		       				</a>
		       				<a href="javascript:login()" id="login_enter_btn">
		       					<c:if test="${ssion_langage == 'kr'}">로그인</c:if>
		       					<c:if test="${ssion_langage != 'kr'}">Login</c:if>
		       				</a>
	       				</div>
       			    </form>
       			    <c:if test="${ssion_langage == 'kr'}">
       			    	<a href="javascript:check1()"  id="pw_check_btn">비밀번호 재설정</a>
       			    </c:if>
       			    <c:if test="${ssion_langage != 'kr'}">
       			    	<a href="javascript:check1()"  id="pw_check_btn">Change password</a>
       			    </c:if>
       			    <form class="check_form_wrap" id="checkform" name="checkform" style="display:none">
       			    	<c:if test="${ssion_langage == 'kr'}">
       			    		<ul id="check_ul">
	       			    		<li><label class="check_label">이름</label><input type="text" class="check_name" id="NAME" name="NAME" placeholder="이름을 입력하세요."></li>
	       			    		<li><label class="check_label">휴대폰</label><input type="text" class="check_phone" id="PHONE" name="PHONE" placeholder="휴대폰 번호를 입력하세요." ></li>
	       			    		<li><label class="check_label">이메일</label><input type="text" class="check_email" id="EAMIL" name="EMAIL" placeholder="이메일을 입력하세요." ></li>
	       			    		<li><label class="check_label">신규 비밀번호</label><input type="text" class="check_pass" id="PWD" name="PWD" placeholder="신규 비밀번호를 입력하세요." ></li>
	       			    		<div class="login_btn_area">
	       			    			<a href="javascript:check()" id="pw_check_check">비밀번호 재설정</a>
	       			    		</div>
       			    		</ul>
       			    	</c:if>
       			    	<c:if test="${ssion_langage != 'kr'}">
       			    		<ul id="check_ul">
	       			    		<li><label class="check_label">Name</label><input type="text" class="check_name" id="NAME" name="NAME" placeholder="Please enter your name."></li>
	       			    		<li><label class="check_label">Phone</label><input type="text" class="check_phone" id="PHONE" name="PHONE" placeholder="Please enter your phone." ></li>
	       			    		<li><label class="check_label">E-mail</label><input type="text" class="check_email" id="EAMIL" name="EMAIL" placeholder="Please enter your e-mail." ></li>
	       			    		<li><label class="check_label">New password</label><input type="text" class="check_pass" id="PWD" name="PWD" placeholder="Please enter your New password." ></li>
	       			    		<div class="login_btn_area">
	       			    			<a href="javascript:check()" id="pw_check_check">Change your password!</a>
	       			    		</div>
       			    		</ul>
       			    	</c:if>
       				</form>
        	    </div>
            </div>
	<span class="material-icons">
	arrow_downward
	</span>
</body>
</html>

<script>
	function check1(){
		$('#checkform').css('display','block');
	}

	function check(){
		var formData = $("#checkform").serialize();
		
		var URL = "${pageContext.request.contextPath}/user/member/check.do";
		$.ajax({
			type : "POST",
			url : URL,
			cache : false,
			data : formData,
			success: function(data,text)
			{
				location.href = '${pageContext.request.contextPath}/view/index.do';
				console.log('dbsave');
			},
			error:function(request,status,error){
				if('${ssion_langage}' == 'kr'){
					alert("최초 등록한 핸드폰 번호와 이메일주소가 맞지 않습니다.");	
				}else{
					alert("The first registered phone number and email address do not match.");	
				}
			}
		});
	}
	
	const cookieArray = Array(Array(), Array());
	
	var cookieCnt = 0;
//
	<c:forEach var="item" items="${model.COOKIE.List}" varStatus="status">
	cookieArray[cookieCnt++] = [cookieCnt, "${item.TYPE}", "${item.SCORE}"];
	</c:forEach>
//
	var sex =  '${SSION_MEMBER.SEX}';
	var age = '${SSION_MEMBER.AGE}';
	var name = '${SSION_MEMBER.NAME}';
	
	if(age == '10대 미만')
	{
	    age = "00"	;
	}
	if(sex == '남자')
	{
	    sex = 'm';
	}
	if(sex == '여자')
	{
	    sex = 'w';
	}
	
	var getCookie = function(name) {
		
		

		cookieArray[cookieCnt++] = [cookieCnt, "sex", sex];
		cookieArray[cookieCnt++] = [cookieCnt, "age", age];
		cookieArray[cookieCnt++] = [cookieCnt, "name", name];
		
		for(i = 0; i < cookieCnt; i++)
		{
			if(cookieArray[i][1] == name)	
			{
				console.log("footer : " + i+" / " + cookieArray[i][2]);
				return cookieArray[i][2];
			}
		}
		return 0;
	};

	
	var setCookie = function(name, value, exp) 
	{
		var cookie1 = "";
		if(getCookie(name) < value)
		{
			$('#SCORE').val(value);
			$('#TYPE').val(name+"max");
			var URL = "${pageContext.request.contextPath}/user/member/saveScore.do";
			var formData = $("#updateScoreform").serialize();
			$.ajax({
				type : "POST",
				url : URL,
				cache : false,
				data : formData,
				success: function(result)
				{
					console.log('dbsave1');
				}
			});
		}
		
		$('#SCORE').val(value);
		$('#TYPE').val(name);
		var URL = "${pageContext.request.contextPath}/user/member/saveScore.do";
		var formData = $("#updateScoreform").serialize();
		$.ajax({
			type : "POST",
			url : URL,
			cache : false,
			data : formData,
			success: function(result)
			{
				console.log('dbsave1');
			}
		});
		
	};
	
    $(".sub_btn_04-1").click(function(){
    	<c:if test="${ssion_user_login == 'okok'}">
    		location.href = '${pageContext.request.contextPath}/user/member/logout.do';
    	</c:if>
    	<c:if test="${ssion_user_login != 'okok'}">
    		$("#login_popup").fadeIn(300);
    	</c:if>    	
    	
    });
    
    $(".btn_box_06").click(function(){
    	$("#login_popup").fadeIn(300);
    });
    
    $("#login_close_btn").click(function(){
    	$("#login_popup").fadeOut(300);
    	$('#checkform').css('display','none');
    });
    

    
    
    $(document).ready(function(){
        $("#nameTest").keypress(function (e) {
         if (e.which == 13){
                    nlogin();
         }
     });
 });
    
    function enter_login(){
    	if(window.event.keyCode == 13){
    		if("#")
    		login();
    	}
    }
    
    function login()
    {
		var formData = $("#loginform").serialize();
		
		var URL = "${pageContext.request.contextPath}/user/member/login.do";
		$.ajax({
			type : "POST",
			url : URL,
			cache : false,
			data : formData,
			success: function(result)
			{
				if(result.indexOf("true") > -1)
				{
					location.href = '${pageContext.request.contextPath}/view/index.do';
				}else
				{
		            swal({
		                //title: '직업을 선택 하여 주세요',
		                title: '<spring:message code="self.login_popup"/>',
		                type: "warning",
		                confirmButtonText: "Yes",
		                closeOnConfirm: false
		            });
				}
				
				console.log('dbsave');
			}
		});

    }
    
</script>

	<form name="updateScoreform" id="updateScoreform">
		<input type="hidden" id="MEMBER_IDX" name="MEMBER_IDX" value="${ssion_user_id }"/>
		<input type="hidden" id="SCORE" name="SCORE"/>
		<input type="hidden" id="TYPE" name="TYPE"/>
	</form>