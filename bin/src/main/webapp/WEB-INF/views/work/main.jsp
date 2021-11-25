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
						<span id=attcolor>${loginUser.nm}</span>님의 업무
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
	
		<div class="col-md-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<table class="table text-center" >
						<caption>받은 업무</caption>
						<tr style="font-size:0.85em;">
							<th style="width:9%;">번호</th>
							<th style="width:20%;">제목</th>
							<th style="width:15%;">지시자</th>
							<th style="width:30%;">업무기한</th>
							<th style="width:30%;">업무 진척도</th>
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
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<div class="col-md-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<table class="table text-center" >
						<caption>지시 업무</caption>
						<tr style="font-size:0.85em;">
							<th style="width:9%;">번호</th>
							<th style="width:20%;">제목</th>
							<th style="width:15%;">지시자</th>
							<th style="width:30%;">업무기한</th>
							<th style="width:30%;">업무 진척도</th>
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
			</div>
			<!-- /.info-box -->
		</div>
	</div>
	<div class="row">
	
		<div class="col-md-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<table class="table text-center" >
						<caption>대기 업무</caption>
						<tr style="font-size:0.85em;">
							<th style="width:9%;">번호</th>
							<th style="width:20%;">제목</th>
							<th style="width:15%;">지시자</th>
							<th style="width:30%;">업무기한</th>
							<th style="width:30%;">업무 진척도</th>
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
				<!-- /.info-box-content -->
			</div>
			<!-- /.info-box -->
		</div>
		<div class="col-md-6 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<table class="table text-center" >
						<caption>완료 업무</caption>
						<tr style="font-size:0.85em;">
							<th style="width:9%;">번호</th>
							<th style="width:20%;">제목</th>
							<th style="width:15%;">지시자</th>
							<th style="width:30%;">업무기한</th>
							<th style="width:30%;">업무 진척도</th>
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
			</div>
			<!-- /.info-box -->
		</div>
		
		<div class="col-md-12 col-12">
			<div class="info-box">
				<div class="info-box-content">
					<table class="table text-center" >
						<caption>전체 업무</caption>
						<tr style="font-size:0.85em;">
							<th style="width:9%;">번호</th>
							<th style="width:20%;">제목</th>
							<th style="width:10%;">지시자</th>
							<th style="width:10%;">담당자</th>
							<th style="width:25%;">업무기한</th>
							<th style="width:30%;">업무 진척도</th>
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
			</div>
			<!-- /.info-box -->
		</div>
	</div>
	<div class="card-footer">
		<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
	</div>
				
</body>
