<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->
<!--공통상단-->
<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/member_view.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/calendar.css" type="text/css">

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
					<%@ include file="../include/top.jsp" %>

                    <!-- 본문 내용-->
                    <div class="sc_section">
                        <div class="sc_section_con">
                            <!--사이트맵-->
                            <div class="sitemap">
                                <ul class="sitemap_box">
                                    <li><span><img src="${pageContext.request.contextPath}/resources//img/home_icon.png"></span>연구노트</li>
                                    <li>노트 일정 관리</li>
                                </ul>
                            </div>
                            <!--사이트맵 end-->

                            <div class="sc_section_size">
                                <!-- 진행중인 회의 -->
                                <div class="meeting_wrap">

                                    <!-- 공통타이틀 -->
                                    <div class="all_title">
                                        <div class="line"><span></span></div>
                                        <h2>노트일정 관리</h2>
                                    </div>
                                    <!-- 공통타이틀 -->
									<div class="container">
									  <div class="my-calendar clearfix">
									    <div class="clicked-date">
									      <div class="cal-day"></div>
									      <div class="cal-date"></div>
									    </div>
									    <div class="calendar-box">
									      <div class="ctr-box clearfix">
									        <button type="button" title="prev" class="btn-cal prev">
									        </button>
									        <span class="cal-month"></span>
									        <span class="cal-year"></span>
									        <button type="button" title="next" class="btn-cal next">
									        </button>
									      </div>
									      <table class="cal-table">
									        <thead>
									          <tr>
									            <th>S</th>
									            <th>M</th>
									            <th>T</th>
									            <th>W</th>
									            <th>T</th>
									            <th>F</th>
									            <th>S</th>
									          </tr>
									        </thead>
									        <tbody class="cal-body"></tbody>
									      </table>
									    </div>
									  </div>
									</div>
									<div>
										<div id="day-test">
											<ul>
												<li>
													<span>일정 시작 날짜</span>
													<input type="text" name="start_tm" id="start_tm">
												</li>
												<li>
													<span>일정 끝 날짜</span>
													<input type="text" name="end_tm" id="end_tm">
												</li>
											</ul>
										</div>
									</div>
									
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

	
	$.datetimepicker.setLocale('ko');
	jQuery('#UPDATE_BIRTH').datetimepicker({
		format : 'Y-m-d',
		lang : "ko",
		timepicker : false
	});
	
	
	
	const init = {
			  monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
			  dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
			  today: new Date(),
			  monForChange: new Date().getMonth(),
			  activeDate: new Date(),
			  getFirstDay: (yy, mm) => new Date(yy, mm, 1),
			  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
			  nextMonth: function () {
			    let d = new Date();
			    d.setDate(1);
			    d.setMonth(++this.monForChange);
			    this.activeDate = d;
			    return d;
			  },
			  prevMonth: function () {
			    let d = new Date();
			    d.setDate(1);
			    d.setMonth(--this.monForChange);
			    this.activeDate = d;
			    return d;
			  },
			  addZero: (num) => (num < 10) ? '0' + num : num,
			  activeDTag: null,
			  getIndex: function (node) {
			    let index = 0;
			    while (node = node.previousElementSibling) {
			      index++;
			    }
			    return index;
			  }
			};

			const $calBody = document.querySelector('.cal-body');
			const $btnNext = document.querySelector('.btn-cal.next');
			const $btnPrev = document.querySelector('.btn-cal.prev');

			/**
			 * @param {number} date
			 * @param {number} dayIn
			*/
			function loadDate (date, dayIn) {
			  document.querySelector('.cal-date').textContent = date;
			  document.querySelector('.cal-day').textContent = init.dayList[dayIn];
			}

			/**
			 * @param {date} fullDate
			 */
			function loadYYMM (fullDate) {
			  let yy = fullDate.getFullYear();
			  let mm = fullDate.getMonth();
			  let firstDay = init.getFirstDay(yy, mm);
			  let lastDay = init.getLastDay(yy, mm);
			  let markToday;  // for marking today date
			  
			  if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
			    markToday = init.today.getDate();
			  }

			  document.querySelector('.cal-month').textContent = init.monList[mm];
			  document.querySelector('.cal-year').textContent = yy;

			  let trtd = '';
			  let startCount;
			  let countDay = 0;
			  for (let i = 0; i < 6; i++) {
			    trtd += '<tr>';
			    for (let j = 0; j < 7; j++) {
			      if (i === 0 && !startCount && j === firstDay.getDay()) {
			        startCount = 1;
			      }
			      if (!startCount) {
			        trtd += '<td><span>'
			      } else {
			        let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
			        trtd += '<td class="day';
			        trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '';
			        trtd += '" date-data = '+fullDate+' date-count = '+(countDay + 1)+''
			        trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
			        trtd += '<span>';
			      }
			      trtd += (startCount) ? ++countDay : '';
			      if (countDay === lastDay.getDate()) { 
			        startCount = 0; 
			      }
			      trtd += '</span></td>';
			    }
			    trtd += '</tr>';
			  }
			  $calBody.innerHTML = trtd;
			}

			/**
			 * @param {string} val
			 */
			function createNewList (val) {
			  let id = new Date().getTime() + '';
			  let yy = init.activeDate.getFullYear();
			  let mm = init.activeDate.getMonth() + 1;
			  let dd = init.activeDate.getDate();
			  const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

			  let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

			  let eventData = {};
			  eventData['date'] = date;
			  eventData['memo'] = val;
			  eventData['complete'] = false;
			  eventData['id'] = id;
			  init.event.push(eventData);
			  $todoList.appendChild(createLi(id, val, date));
			}

			loadYYMM(init.today);
			loadDate(init.today.getDate(), init.today.getDay());

			$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
			$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

			$calBody.addEventListener('click', (e) => {
			  if (e.target.classList.contains('day')) {
			    if (init.activeDTag) {
			      init.activeDTag.classList.remove('day-active');
			    }
			    let day = Number(e.target.textContent);
			    loadDate(day, e.target.cellIndex);
			    //e.target.classList.add('day-active');
			    init.activeDTag = e.target;
			    init.activeDate.setDate(day);
			  }
			});
			
			$('.day').click(function(){
				var check_length = $('.check').length;
				check_length = Number(check_length);
				
				if(check_length == 0){
					$('td').removeClass('start');
					$('td').removeClass('end');
					$('td').removeClass('between');
					$(this).addClass('check');	
				}else if(check_length == 1){
			
					var check1 = $('.check').attr('date-count');
					var check2 = $(this).attr('date-count');
					check1 = Number(check1);
					check2 = Number(check2);
					//console.log('s' + s);
					//console.log('e'+ e);
					
					if(check1 < check2){
						$('.check').addClass('start');
						$('.check').removeClass('check');
						$(this).addClass('end');
						
						for(i = check1+1; i < check2; i ++){
							//console.log(i);
							$('[date-count="'+i+'"]').addClass('between');
						}
						
					}else if(check1 > check2){
						$('.check').addClass('end');
						$('.check').removeClass('check');
						$(this).addClass('start');
						
						for(i = check2+1; i < check1; i ++){
							//console.log(i);
							$('[date-count="'+i+'"]').addClass('between');
						}
					}else if(check1 == check2){
						$('#start_tm').val($(this).attr('date-data'));
						$('#end_tm').val($(this).attr('date-data'));
						return;
					}

					$('#start_tm').val($('.start').attr('date-data'))
					$('#end_tm').val($('.end').attr('date-data'))
					
				}
				
			})
			
	
</script>
<!-- js 끝 -->