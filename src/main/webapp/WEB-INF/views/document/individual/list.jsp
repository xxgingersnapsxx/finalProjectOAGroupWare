<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>	    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="dbxList" value="${dataMap.dbxList }" />
<%
session.setAttribute("path", request.getContextPath() + "/document/individual");
%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet"/>

<style>
.p_title {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 15px;
  font-weight: bold;
  margin-left: 5px;
}
p {
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 13px;
	font-weight: bold;
}
td {
  font-family: 'Gowun Dodum', sans-serif;
  font-weight: bold;
  font-size: 13px;
}
th {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 15px;
  font-weight: bold;
}
select>option, button{
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}
.form-control{
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 13px;
  font-weight: bold;
}
</style>

<style>
#removeBtn {
  border: 2px solid lightgrey;
  font-size: 12px;
  padding: 3px 5px;
}
.table td {
  vertical-align: middle;
}
</style>

</head>

<title>개인문서함</title>


<body>
<c:if test="${from eq 'regist'}">
      <script>  
         alert('문서 등록을 완료했습니다.');
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
	  				<p class="menu-header">문서함</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">개인문서함</p>  				
	  			</div>

	  		</div>
	  	</div>
	</section>
	 
	 <!-- Main content -->
    <section class="content">		
		<div class="gw-card">
			<div class="card-header with-border">
				<button type="button" class="btn btn-basic" id="registBtn" onclick="OpenWindow('individual/registForm.do','개인문서등록',920,830);">등록</button>
				<div id="keyword" class="card-tools" style="width:540px;">
					<div class="input-group row">
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>							
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>작성자+제목+내용</option>
						</select>					
						<input  class="form-control search-bar" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-basic" type="button" onclick="list_go3(1,'individual');" 
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
						<th style="width:10%;">번 호</th>
						<th style="width:45%;">제 목</th>
						<th style="width:8%;">첨부파일</th>
						<th style="width:15%;">작성자</th>
						<th>등록일</th>
						<th style="width:10%;">삭제</th>
					</tr>			
					<c:if test="${empty dbxList }" >
						<tr>
							<td colspan="6">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${dbxList}" var="dbx">
						<tr style='font-size:0.85em;'>
							<td>${fn:substring(dbx.dbx_no,4,1000000000) }</td>
							<td id="boardTitle" onclick="javascript:OpenWindow('individual/detail.do?dbx_no=${dbx.dbx_no}','상세보기',900,800);">
								<span class="col-sm-12">${dbx.sj}</span>
							</td>
							<td>
								<c:if test="${!empty dbx.atchList}">
									<i class="nav-icon fas fa-file"></i>
								</c:if>
							</td>
							<td data-target="dbx-emp_nm">${dbx.emp_nm}</td>
							<td>
								<fmt:formatDate value="${dbx.rgsde}" pattern="yyyy-MM-dd"/>
							</td>							
							<td>
							<button type="button" id="removeBtn" class="btn btn-remove" 
						    		onclick="remove_go('${dbx.dbx_no}');">삭제</button>
							</td>		
						</tr>
					</c:forEach>
				</table>				
			</div>
			
			<br/>
			
			<div class="card-footer">
				<nav aria-label="pds list Navigation">
					<ul class="pagination justify-content-center m-0">
						<%@ include file="/WEB-INF/views/common/basic-pagination.jsp" %>	
					</ul>
				</nav>
			</div>
		
		</div>
		
    </section>
    <!-- /.content -->
    <form role="form">
		<input id="form-input" type="hidden" name="dbx_no" />
	</form>
	
<script>
function remove_go(value){
	var formObj = $("form[role='form']");
	//alert("click remove btn");
	var answer = confirm("정말 삭제하시겠습니까?");
	if(answer){		
		$("#form-input").attr("value", value);
		formObj.attr("action", "individual/remove.do");
		formObj.attr("method", "post");
		formObj.submit();
	}
}
</script>
<script>
function list_go3(page,url){
	if(!url) url="notice.do";
	
	console.log("url : " + url);
	
	var jobForm=$('#basicForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}
</script>
</body>
</html>