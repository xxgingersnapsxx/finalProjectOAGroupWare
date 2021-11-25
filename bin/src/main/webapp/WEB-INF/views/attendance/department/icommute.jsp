<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="icomlist" value="${dataMap.icomlist }" /> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/attendance/icommute.css">
<title></title>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-3">
					<p class="menu-header">
						<span id=attcolor>${loginUser.nm}</span>님의 부서별 개인 출퇴근 현황
					</p>
				</div>
			</div>
		</div>
	</section>
	<div class="dd">
	</div>
	<div class="card-body">
				<table class="table text-center">
					<tr style="font-size:0.95em;">
						<th style="width:10%;">이 름</th>
						<th style="width:45%;">직 급</th>
						<th style="width:8%;">ㅇㅇ</th>
						<th style="width:15%;">ㅇㅇ</th>
						<th>ㅇㅇ</th>
						<th style="width:10%;">ㅋㅋ</th>
					</tr>	
					<c:forEach items="${icomlist }" var="icom">
						<tr style='font-size:0.85em;'>
							<td>
							 ${icom.nm }
							</td>
							<td>
							 ${icom.clsf_code }
							</td>
						<%-- 	<td>
								<c:if test="${!empty mngt.atchList }">
									<i class="nav-icon fas fa-file"></i>
								</c:if>
							</td>
							<td data-target="mngt-emp_nm">${mngt.emp_nm }</td>
							<td>
								<fmt:formatDate value="${mngt.rgsde }" pattern="yyyy-MM-dd"/>
							</td>
							<td>${mngt.rdcnt }</td>
						</tr> --%>
					</c:forEach>	
				</table>
			</div>
              
              
</body>
</html>