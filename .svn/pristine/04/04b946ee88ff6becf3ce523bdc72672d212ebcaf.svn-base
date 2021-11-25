<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="schList" value="${schList.schList }" /> 


<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- 부트스트랩 -->
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>

<style>
@charset "UTF-8";

html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}


#calendar-container {
	position: relative;
	z-index: 1;
	/* margin-left: 200px; */
}

#calendar td.fc-day-sun {
	color: red;
}

#calendar td.fc-day-sat {
	color: blue;
}

#calendar {
	max-width: 1100px;
	margin: 20px auto;
}
</style>

<script>
document.addEventListener('DOMContentLoaded',function() {
			var Calendar = FullCalendar.Calendar;
			var Draggable = FullCalendar.Draggable;
			var calendarEl = document.getElementById('calendar');
			var checkbox = document.getElementById('drop-remove');
			// initialize the calendar
			// -----------------------------------------------------------------
			var calendar = new Calendar(
					calendarEl,
					{
						headerToolbar : {
							left : 'prev,next today',
							center : 'title',
							right : 'addEventButton ,dayGridMonth,timeGridWeek,timeGridDay,listWeek' //addEventButton추가해야 일정버튼나옴
						},
						businessHours : true,
						customButtons : {
							addEventButton : {
								text : '일정 추가',
								click : function() {
									window.open('<%=request.getContextPath()%>/schedule/registForm.do',
											'일정등록', 800, 400);
								}
							}
						},
						//클릭이벤트
						eventClick : function(info) {
						//	alert(info.event.id);
							window.open('<%=request.getContextPath()%>/schedule/detail.do?schdul_no='+info.event.id,
									'상세보기',900,800);
						},
						
						//이벤트 드랍
						 eventDrop: function(info) {
							 //업데이트??
							console.log(info.event.id);
							console.log(info.event.title);
							console.log(info.event.content);
							console.log(info.event.start);
							console.log(info.event.end);
						 },
						  eventResize: function(info) {
							  //업데이트 ㅠ
							console.log(info.event.id);
							console.log(info.event.title);
							console.log(info.event.content);
							console.log(info.event.start);
							console.log(info.event.end);
						  },
						//공휴일
						googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE", // Google API KEY
						eventSources : [
						// 대한민국의 공휴일
						{
							googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
							className : "koHolidays",
							color : "#cc0000",
							textColor : "#FFFFFF"
						} ],
						//일정 등록
						events : [
							
						<c:if test="${!empty schList }">
							
							<c:forEach var="list" items="${schList }" varStatus="vs">
								<c:if test="${vs.count >1 }">,</c:if>
								
								{
									id : '${list.schdul_no }',
									title : '${list.schdul_sj }',
									start : '${list.bgnde }',
									end : '${list.endde }',
									content : '${list.schdul_cn }',
									writer : '${list.empno }',
									backgroundColor : '${list.bg_color}',
									allDay : true
								}
								
							</c:forEach>
						</c:if>
							],
						locale : 'ko', //언어 한글로 바꾸기
						selectable : true, // 클릭했을때 색변환 드래그
						editable : true,
						droppable : true, // this allows things to be dropped onto the calendar
					});

			calendar.render();
		});
</script>
<script>


</script>
</head>
<body>
	<c:if test="${from eq 'regist'}" >
		<script>
    	alert("일정 등록이 성공했습니다."); 
    	window.opener.location.reload();	
    	window.close();
    	</script>
    </c:if>
    
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>

</body>
<script>
/* var test='';
console.log(test); */
</script>
</html>