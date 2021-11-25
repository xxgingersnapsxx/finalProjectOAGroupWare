<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="MM" />
</c:set>

<%-- <c:set var="dclz" value="${dclzList.dclz }" /> --%>

<%session.setAttribute("path", request.getContextPath() + "/attendance/individual"); %>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/attendance/individual.css">
</head>
<style>
</style>
<body>
	<!-- 사용자정보 -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-3">
					<p class="menu-header">
						<span class=attcolor>${loginUser.nm}</span>님의 <span class=attcolor>${sysYear}</span>월
						근태 정보
					</p>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<!-- 단순정보차트 -->
	<div class="row">
		<p class="col-md-3 col-sm-6 col-12" id="textname">근태현황</p>
		<p class="col-md-3 col-sm-6 col-12" id="textname">근무현황</p>
		<p class="col-md-3 col-sm-6 col-12" id="textname">출/퇴근 현황</p>
		<p class="col-md-3 col-sm-6 col-12" id="textname">근태 통계</p>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<span class="info-box-text">지각 &nbsp;&nbsp; 결근 &nbsp;&nbsp;조기퇴근 &nbsp;&nbsp; 퇴근</span> 
<!-- 						<span class="info-box-number"> -->
						<c:forEach items="${dclzCount}" var="dclz">
						  		asdasdasdasd
						</c:forEach>
<!-- 						</span> -->
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<!-- /.col -->
		<div class="col-md-3 col-sm-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<span class="info-box-text">총 근무일수 &nbsp;&nbsp;총 근무시간
						&nbsp;&nbsp;평균 근무시간</span> <span class="info-box-number">7일
						&nbsp;&nbsp; &nbsp;&nbsp; 65시간 &nbsp;&nbsp; &nbsp;&nbsp; 8시간 23분</span>
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<!-- /.col -->
		<div class="col-md-3 col-sm-6 col-12">
			<div class="info-box">

				<!-- 타이머 -->
				<div class="info-box-content">
					<div id="countdown">
						<!-- 히든걸려있음 -->
						<div class="day">
							<span class="days" id="day"></span>
						</div>
						<!-- 여기서 부터 보임 -->
						<span class="hours" id="hour"></span>
						<div class="text">&nbsp;시&nbsp;</div>

						<span class="minutes" id="minute"></span>
						<div class="text">&nbsp;분&nbsp;</div>

						<span class="seconds" id="second"></span>
						<div class="text">&nbsp;초&nbsp;</div>
						<br> <span id="timer"></span>
					</div>
					<!-- 타이머끝 -->
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<div class="col-md-3 col-sm-6 col-12">
			<div class="info-box">

				<div class="info-box-content">
					<span class="info-box-text">Uploads</span> <span
						class="info-box-number">13,648</span>
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
	</div>
	<!-- 차트정보 -->
		<div class="col-md-12 col-sm-12 col-12">
			<!-- 차트 -->
			<div class="card atte">
				<div class="card-header">
					<h3 class="card-title">올해 나의 근태 통계</h3>
				</div>
				<div class="card-body">
					<div class="chartjs-size-monitor">
						<div class="chartjs-size-monitor-expand">
							<div class=""></div>
						</div>
						<div class="chartjs-size-monitor-shrink">
							<div class=""></div>
						</div>
					</div>
					<canvas id="donutChart"
						style="height: 230px; min-height: 230px; display: block; width: 764px;"
						width="764" height="230" class="chartjs-render-monitor"></canvas>
				</div>
				<!-- /.card-body -->
			</div>
		</div>
	</div>
	<section class="content">		
		<div class="gw-card">
			<div class="card-header with-border">
				<div id="keyword" class="card-tools" style="width:540px;">
					<div class="input-group row">					
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>선택</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>							
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>작성자+제목+내용</option>
							<!-- 페이징 다시짜야할것 -->
						</select>					
						<input  class="form-control search-bar" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" onclick="list_go(1);" 
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>						
			</div>
			<div class="card-body">
				<table class="table text-center" >					
					<tr style="font-size:0.95em;">
						<th style="width:10%;">일 자</th>
						<th style="width:20%;">출근 시간</th>
						<th style="width:20%;">퇴근 시간</th>
						<th style="width:10%;">총 근무 시간</th>
						<th style="width:10%;">승인 이력</th>
						<th style="width:10%;">출근 상태</th>
					</tr>			
					<c:if test="${empty noticeList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${noticeList}" var="notice">
						<tr style='font-size:0.85em;'>
							<td>${notice.bbsctt_no}</td>
							<td id="boardTitle" onclick="javascript:OpenWindow('notice/detail.do?bbsctt_no=${notice.bbsctt_no}&from=list','상세보기',900,800);">
								<span class="col-sm-12">${notice.sj}</span>
							</td>			
							<td data-target="notice-emp_nm">${notice.emp_nm}</td>
							<td>
								<fmt:formatDate value="${notice.rgsde}" pattern="yyyy-MM-dd"/>
							</td>							
							<td>${notice.rdcnt}</td>		
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
			</div>
		</div>
    </section>



	<div class="atte"></div>
	<div class="atte"></div>

	<script>
		var deadline = new Date("oct 27, 2021 18:00:00").getTime();
		var x = setInterval(function() {
			var now = new Date().getTime();
			var rt = now - deadline;
			var t = Math.abs(rt);
			var days = Math.floor(t / (1000 * 60 * 60 * 24));
			var hours = Math.floor((t % (1000 * 60 * 60 * 24))
					/ (1000 * 60 * 60));
			var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
			var seconds = Math.floor((t % (1000 * 60)) / 1000);
			document.getElementById("day").innerHTML = days;
			document.getElementById("hour").innerHTML = hours;
			document.getElementById("minute").innerHTML = minutes;
			document.getElementById("second").innerHTML = seconds;
			console.log(rt)
			if (rt == 0) {
				document.getElementById("timer").innerHTML = "퇴근";
			}
			if (rt < 0) {
				document.getElementById("timer").innerHTML = "근무중";
			}
			if (rt > 0) {
				document.getElementById("timer").innerHTML = "추가근무중";
			}
		}, 1000);
	</script>
</body>
