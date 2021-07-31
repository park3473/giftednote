<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/head.jsp" %>
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
    input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {-webkit-appearance: none;margin: 0;}
	.swal2-container{
		z-index:9999 !important;
	}
	.swal2-styled.swal2-confirm{
		height:auto !important;
	}
</style>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../include/header.jsp" %>

        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../include/menu_sub.jsp" %>
        </section>
    </header>

    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <h2>모집</h2>
                        </div>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/check.do">신규 참자가 지원 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/new_inquiry.do">지원서 조회 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">

                        <!-- 온라인지원서 주의사항 -->
                        <div class="program_wrap memre_wrap">
                            <div class="program" style="width:100%;">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>신입생 지원 모집 안내</p>
                                </div>

                                <ul class="txt nanumbarungothic">
                                    <li class="pro_list_03">
                                        <p>신규 참가자 모집 안내는 매년 4월초 공지 될 예정입니다.</p>
                                    </li>
                                    <li class="pro_list_03">
                                        <p>영재키움 프로젝트에 신규로 참가하기 위해서는 아래 '온라인 지원서'에 정보를 입력해야 합니다.</p>
                                    </li>
                                    <li class="pro_list_03">
                                        <p>※ 주의사항</p>
                                        <span>
                                            온라인 지원서 자료입력은 유형에 따라 작성자가 다릅니다. 아래 유형 설명을 참고하여 작성하여 주시고, 상세한 것은 "신규 참가자 모집안내"를 확인하여 주시기 바랍니다.
                                        </span>
                                    </li>
                                    <li class="pro_list_03">
                                        <div class="memre_down">
                                            <button type="button" id="fileDownBtn4" class="yellow_btn mr-2" style="margin-left: 0;" onclick="btn_alert()">모집요강 보기</button>
                                            <label class="relate_c">모집요강을 확인하여 1) 서명이 필요한 서류,  2) 지원 자격,  3) 증빙서류를 준비해주세요.</label>
                                        </div>
                                        <div class="memre_down">
                                  		    <button type="button" id="fileDownBtn3" class="yellow_btn" style="margin-left: 0;" onclick="btn_alert()">지원서류 다운로드</button>
                                            <label class="relate_c">서류을 다운로드하여 작성 후 스캔 또는 촬영하여 파일로 준비해 주세요.</label>    
                                        </div>
                                        <div class="memre_down">  
	                                        <button type="button" class="yellow_btn" style="border:1px solid #33b1d0; background-color:#33b1d0" onclick="javascript:wrap_insert()">지원하러가기</button>
                                            <label class="relate_c">아래에 유형별 지원 방법을 확인 후 지원해주세요.</label>
                                        </div>
                                        <div class="memre_down">  
	                                        <img src="${pageContext.request.contextPath }/resources/img/sub/QRcode.png" alt="${pageContext.request.contextPath }/MobileInsert.do">
                                            <label class="relate_c">스마트폰으로 작성시 접속할 지원 페이지 주소. <br><a href="http://giftedup/Mobile.do">http://giftedup/Mobile.do</a></label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="program_wrap memre_wrap">
                            <div class="program" style="width:100%;">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>'온라인 지원서' 작성 방법</p>
                                </div>

                                <ul class="txt nanumbarungothic memre_txt_01">
                                    <li class="pro_list_03">
                                        <p>※ 아래 3가지 유형 중 해당되는 유형에 따라 온라인 지원서를 작성해주시고, 지원서류를 첨부하여 주시기 바랍니다.</p>
                                    </li>
                                </ul>
                                <div class="sub_page">
                                    <table class="txt select_table">
                                        <caption class="blind">'온라인 지원서' 작성방법</caption>
                                        <thead>
                                            <tr>
                                                <th style="width: 10%;">유형</th>
                                                <th style="width: 30%;">내용</th>
                                                <th style="width: 9%;">작성자</th>
                                                <th>온라인 지원서 작성 및 지원서류 제출 방법</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>유형1</td>
                                                <td class="align_lt">멘토교사와 학생이 모두 처음 신청하는 경우로 사전에 결정(매칭)된 경우</td>
                                                <td>멘토교사</td>
                                                <td class="align_lt" style="background-color: #f7f7f7;">
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 온라인 지원서 작성시 멘토교사, 학생 정보 모두 입력</p>
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 멘토교사가 담당 학생에 대한 지원서류와 증빙서류를 취합하여 제출</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>유형2</td>
                                                <td class="align_lt">멘토교사가 사전에 매칭되지 않아서, 신규로 학생만 지원하는 경우</td>
                                                <td>학생</td>
                                                <td class="align_lt" style="background-color: #f7f7f7;">
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 학생이 학생 관련 지원서류와 증빙서류를 제출(학생관련 자료만 제출)</p>
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> KAIST에서 멘토교사 매칭 예정</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>유형3</td>
                                                <td class="align_lt">① 기존 참여 교사였으나 학생 진학 등의 이유로 매칭되지 않은 경우<br>② 기존 참여 학생(멘티)의 멘토를 희망하는 교사<br>③ 신규교사</td>
                                                <td>멘토교사</td>
                                                <td class="align_lt" style="background-color: #f7f7f7;">
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> 멘토교사 정보 입력</p>
                                                    <p><span><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span> KAIST에서 멘티 학생 매칭 예정</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- 온라인지원서 주의사항 end -->

                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <!--보드 검색_버튼 end-->

                                <div class="program_wrap">
                                    <div class="program" style="width:100%;">
                                        <div class="title">
                                            <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                            <p>지원서류 및 증빙서류 목록</p>
                                        </div>
                                        <div class="sub_page">
                                            <table class="txt select_table memre_table">
                                                <caption class="blind">'온라인 지원서' 작성방법</caption>
                                                <thead>
                                                    <tr>
                                                        <th rowspan="2" style="width: 10%;">순번</th>
                                                        <th rowspan="2" style="width: 30%;">목록</th>
                                                        <th rowspan="2" style="width: 9%;">부수</th>
                                                        <th rowspan="2">제출자</th>
                                                        <th colspan="3">유형별 제출 목록</th>
                                                    </tr>
                                                    <tr>
                                                        <th>유형1</th>
                                                        <th>유형2</th>
                                                        <th>유형3</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td rowspan="2">서식1</td>
                                                        <td rowspan="2">개인정보 수집·이용 및 제공에 대한 안내 및 동의서</td>
                                                        <td rowspan="2">1부</td>
                                                        <td>학생</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-times color_b""></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>멘토교사</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>서식2</td>
                                                        <td>보호자 서약서</td>
                                                        <td>1부</td>
                                                        <td>보호자</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>서식3</td>
                                                        <td>지원자 서약서</td>
                                                        <td>1부</td>
                                                        <td>학생</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>서식4</td>
                                                        <td>학교장 확인서</td>
                                                        <td>1부</td>
                                                        <td>담임교사</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                    </tr>
                                                    <tr>
                                                        <td>증빙서류</td>
                                                        <td>지원자격에 대한 해당 증빙서류(참고 2에서 확인)</td>
                                                        <td>1부</td>
                                                        <td>관공서 및 확교에서 발급</td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-check-circle"></i></td>
                                                        <td><i class="las la-times color_b"></i></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                </nav>
            </div>
        </div>
        </div>
    </section>


    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <%@ include file="../include/footerJs.jsp" %>
</body>

</html>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	function wrap_insert(){
		Swal.fire({
			  text: "지원 후 지원조회는 지원하고 24시간 이후에 가능합니다.",
			  icon: 'success',
			  showCancelButton: false,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: 'Yes!'
			}).then((result) => {
			  if (result.isConfirmed) {
					location.href="http://geu.myds.me/LimeSurvey/index.php?r=survey/index&sid=526688&newtest=Y&lang=ko"
			  }
			})
	}
	
    $(function() {
        $('#btn-upload').click(function(e) {
            e.preventDefault();
            $('#file').click();
        });
    });

    function changeValue(obj) {
        var fileObj = obj.value;
        var pathHeader, pathMiddle, pathEnd, allFilename, fileName, extName;
        pathHeader = fileObj.lastIndexOf("\\");
        pathMiddle = fileObj.lastIndexOf(".");
        pathEnd = fileObj.length;
        fileName = fileObj.substring(pathHeader + 1, pathMiddle);
        extName = fileObj.substring(pathMiddle + 1, pathEnd);
        allFilename = fileName + "." + extName;

        $('#fileName').val(allFilename);
    }

    function zipCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                $('#ZIPCODE').val(data.zonecode);
                $('#ADDRESS').val(data.roadAddress);
            }
        }).open();
    }
    
    $('#fileDownBtn4')
    .click(
        function(e) {
            var url = 'http://geu.myds.me/web_images/21_giftedup_notice.pdf';
            window.open(url);
        });
	
	$('#fileDownBtn3')
	    .click(
	        function(e) {
	            var url = 'http://geu.myds.me/web_images/21_giftedup_apply_form_v2.hwp';
	            location.href = url;
	        });
    /*
    function test_swal() {
    	swal({
            title:'지원서 저장이 완료가 되었습니다.',
            text:'지원서 내용 조회하기',
            type: "success",
            confirmButtonText: '바로가기',
      		closeOnConfirm: false,
      		showCancelButton : true,
    		},function(isConfirm){
    			if(isConfirm){
    				location.href = "${pageContext.request.contextPath}/index.do";
    			}else{
    				return;
    			}
      		});
    }
     */
</script>
<!--
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
