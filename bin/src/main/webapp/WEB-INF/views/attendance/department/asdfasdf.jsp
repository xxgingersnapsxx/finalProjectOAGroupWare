<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="YYYY" />
</c:set>
<c:set var="sysMonth">
	<fmt:formatDate value="${now}" pattern="MM" />
</c:set>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/board/notice.css">
</head>
<style>
	.row{
		border: 1px solid black;
	}
	.info-boxa{
		background-color:black;
	}
</style>
<body>
	<!-- 사용자정보 -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-3">
					<p class="menu-header">
						<span id=attcolor>${loginUser.nm}</span>님의 <span id=attcolor>${sysYear}</span>년 <span>${sysMonth}</span>월 부서 근태 정보
					</p>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	
	<!-- 정보차트 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<div class="row">
	
		<div class="col-md-4 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<canvas id="deptChart" width="350" height="350"></canvas>
					<script>
					var ctx = document.getElementById("deptChart");
					var deptChart = new Chart(ctx,{	//차트 선언
						type: 'bar',  //차트타입
						data: {	//차트 데이터 object 배열
							labels: ["경리부","사업부","시설관리부","인사부","홍보부"],	//라벨 배열
							datasets: [{//데이터 object 배열
								label: '전사',
								data: [15, 15, 15, 15, 15],	//데이터 넣는 곳
								backgroundColor: [
									'rgba(153, 102, 205, 0.2)',
									'rgba(153, 102, 205, 0.2)',
									'rgba(153, 102, 205, 0.2)',
									'rgba(153, 102, 205, 0.2)',
									'rgba(153, 102, 205, 0.2)'
								],
								borderColor: [
									'rgba(153, 102, 205, 1)',
									'rgba(153, 102, 205, 1)',
									'rgba(153, 102, 205, 1)',
									'rgba(153, 102, 205, 1)',
									'rgba(153, 102, 205, 1)'
								],
								borderWidth: 1
							},
							{	
								label: '부서',
								data: [12, 9, 13, 17, 16],	//데이터 넣는 곳
								backgroundColor: [
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(11, 156, 49, 0.2)',
									'rgba(255, 140, 0, 0.2)'
								],
								borderColor: [
									'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(11, 156, 49, 1)',
									'rgba(255, 140, 0, 1)'
								],
								borderWidth: 1
							}]
						},
						options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
							title:{
								display:true,
								text: '부서별 근태 현황',
								fontSize: 18
							},
							layout:{
								padding:20
							},
							scales:{
								yAxes:[{
									ticks:{
										beginAtZero:true
									}
								}]
							}
						}
					});
						
					</script>
				</div>
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<div class="col-md-4 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<canvas id="deptMonthChart" width="350" height="350"></canvas>
					<script>
					var ctx = document.getElementById("deptMonthChart");
					var deptMonthChart = new Chart(ctx,{	//차트 선언
						type: 'doughnut',  //차트타입
						data: {	//차트 데이터 object 배열
							labels: ["지각","정상근무","조퇴","결근"],	//라벨 배열
							datasets: [{	//데이터 object 배열
								label: '',
								data: [19, 10, 3, 5,],
								backgroundColor: [
									'rgba(11, 156, 49, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(255, 140, 0, 0.2)',
									'rgba(255, 99, 132, 0.2)'
								],
								borderColor: [
									'rgba(11, 156, 49, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(255, 140, 0, 1)',
									'rgba(255, 99, 132, 1)'
								],
								borderWidth: 1
							}]
						},
						options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
							title:{
								display:true,
								text: '월별 부서 근태현황',
								fontSize: 18
							},
							layout:{
								padding:20
							}
						}
					});
						
					</script>
				</div>
			</div>
			<!-- /.info-box -->
		</div>
		<div class="col-md-4 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<canvas id="deptYearChart" width="350" height="350"></canvas>
					<script>
					var ctx = document.getElementById("deptYearChart");
					var deptYearChart = new Chart(ctx,{	//차트 선언
						type: 'bar',  //차트타입
						data: {	//차트 데이터 object 배열
							labels: ["1월","2월","2월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],	//라벨 배열
							datasets: [{//데이터 object 배열
								label: '월별 부서 근태 현황',
								data: [15, 18, 12, 7, 9, 10, 11, 15, 18, 12, 7, 9],	//데이터 넣는 곳
								backgroundColor: [
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)'
								],
								borderColor: [
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)'
								],
								borderWidth: 1
							},
							{	
								label: '전사 근태 현황',
								data: [12, 19, 3, 5, 2, 12, 19, 3, 5, 2, 12, 19],	//데이터 넣는 곳
								backgroundColor: [
									'rgba(255, 99, 132, 0)'
								],
								borderColor: [
									'rgba(255, 99, 132, 1)'
								],
								borderWidth: 1,
								type:'line'
							}]
						},
						options: {	//옵션: 추가하고 싶은 옵션이 있을때 사용
							title:{
								display:true,
								text: '연도 부서 근태현황',
								fontSize: 18
							},
							layout:{
								padding:20
							},
							scales:{
								yAxes:[{
									ticks:{
										beginAtZero:true
									}
								}]
							}
						}
					});
						
					</script>
				</div>
			</div>
			<!-- /.info-box -->
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-6 col-12">
			<div class="gw-card">
		<span id=attcolor>${sysYear}</span>년 <span>${sysMonth}</span>월 부서 휴가 통계 게시판: 휴가일자(ex:10/27~10/28)		 휴가자 		직급  			휴가종류
			<div class="info-boxa">
			<div class="card-body">
				<table class="table text-center" >					
					<tr style="font-size:0.85em;">
						<th style="width:30%;">휴가일자</th>
						<th style="width:20%;">휴가자</th>
						<th style="width:25%;">결재여부</th>
						<th style="width:25%;">휴가종류</th>
					</tr>
					<c:if test="${empty sancList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${sancList}" var="sanc">
						<tr style='font-size:0.85em;'>
							<td>
							<fmt:formatDate value="${sanc.bgnde}" pattern="MM/dd"/>~<fmt:formatDate value="${sanc.endde}" pattern="MM/dd"/>
							</td>
							<td id="sancEmp" onclick="javascript:OpenWindow('emp/detail.do?vcatn_no=${sanc.empno}&from=list','상세보기',900,800);">
								${sanc.empno}
							</td>			
							<td>${sanc.lastsanc_at}</td>
							<td>
							</td>							
							<td>${sanc.vcatn_nm}</td>		
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
			</div>
				
				
				
			</div>
			<!-- /.info-box -->
			</div>
		</div>
		
		<div class="col-md-6 col-12">
		<span id=attcolor>${sysYear}</span>년 <span>${sysMonth}</span>월 근태이상자 게시판 형태: 일자 이름 보고지시(컬럼x) 직급 사유
			<div class="info-boxa">
				
			<div class="card-body">
				<table class="table text-center" >					
					<tr style="font-size:0.85em;">
						<th style="width:30%;">날  짜</th>
						<th style="width:20%;">이  름</th>
						<th style="width:25%;">직  급</th>
						<th style="width:25%;">사  유</th>
					</tr>			
					<c:if test="${empty sancList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${sancList}" var="sanc">
						<tr style='font-size:0.85em;'>
							<td>
							<fmt:formatDate value="${sanc.bgnde}" pattern="MM/dd"/>~<fmt:formatDate value="${sanc.endde}" pattern="MM/dd"/>
							</td>
							<td id="sancEmp" onclick="javascript:OpenWindow('emp/detail.do?vcatn_no=${sanc.empno}&from=list','상세보기',900,800);">
								${sanc.empno}
							</td>			
							<td>${sanc.lastsanc_at}</td>
							<td>
							</td>							
							<td>${sanc.vcatn_nm}</td>		
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
			</div>
				
				
				
			</div>
		
	</div>
</div>

</body>
