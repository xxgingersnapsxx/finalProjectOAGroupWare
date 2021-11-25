<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="jobSendList" value="${dataMap.jobSendList }" />

<%session.setAttribute("path", request.getContextPath() + "/work/send"); %>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/board/notice.css">
</head>
<title>완료 업무</title>
<body>

	<c:if test="${from eq 'regist'}">
		<script>   
         alert('지시 업무 글 등록이 성공했습니다');
         window.opener.location.reload();
         window.close();
      </script>
	</c:if>
	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
					<p class="menu-header">지시 업무</p>
					<p class="menu-header">></p>
					<p class="menu-header this">지시 업무</p>
				</div>

			</div>
		</div>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="gw-card">
			<div class="card-header with-border">
				<button type="button" class="btn btn-basic" id="registBtn"
					onclick="OpenWindow('send/registForm.do','지시업무 등록',900,800);">게시글등록</button>
				<div id="keyword" class="card-tools" style="width: 540px;">
					<div class="input-group row">
 						<select class="form-control col-md-3" name="perPageNum" id="perPageNum">
					  		<option value="10" ${cri.perPageNum==10 ? 'selected':'' } >정렬개수</option>
					  		<option value="20" ${cri.perPageNum==20 ? 'selected':'' }>20개씩</option>
					  		<option value="30" ${cri.perPageNum==30 ? 'selected':'' }>30개씩</option>
					  		<option value="50" ${cri.perPageNum==50 ? 'selected':'' }>50개씩</option>
					  		
					  	</select>	 	
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>																			
						</select>	
						
						
						
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1,'send');">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>			
				</div>
			</div>
			<div class="card-body">
				<table class="table text-center">
					<tr style="font-size: 0.95em;">
						<th style="width:10%;">번 호</th>
						<th style="width:40%;">제 목</th>
						<th style="width:8%;">첨부파일</th>
						<th style="width:12%;">담당자</th>
						<th style="width:15%;">등록일</th>
						<th style="width:15%;">업무기한</th>
					</tr>
					<c:if test="${empty jobSendList }">
						<tr>
							<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${jobSendList}" var="job">
						<tr style='font-size: 0.85em;'>
							<td>${fn:substring(job.job_no,4,1000000000)}</td>
							<td id="boardTitle" onclick="javascript:OpenWindow('send/detail.do?job_no=${job.job_no}','상세보기',900,800);">
							<span class="col-sm-12">${job.sj}</span>
							</td>
							<td>
								<c:if test="${!empty job.atchList}">
									<i class="nav-icon fas fa-file"></i>
								</c:if>
							</td>
							<td data-target="send-writer">${job.emp_nm}</td>
							<td><fmt:formatDate value="${job.regist_de}"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${job.end_de}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="card-footer">
				<nav aria-label="pds list Navigation">
					<ul class="pagination justify-content-center m-0">
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>	
					</ul>
				</nav>
			</div>

		</div>

	</section>
	<!-- /.content -->

</body>
</html>