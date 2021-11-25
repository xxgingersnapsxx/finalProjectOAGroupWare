<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<c:set var="cri" value="${pageMaker.cri }" />


<%
session.setAttribute("path", request.getContextPath() + "/board/management");
%>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/approval/approvalRequest.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
 $(document).ready(function(){
	 
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
 
  /* 탭 강제 클릭 이벤트 */
	 $('ul.tabs li.current').trigger("click");
});
</script>

<style>
.card-body {
  margin-top: 10px;
}
.tab-link {
  border: 1px solid lightgrey;
}
.tab-link>a {
  position: relative;
  left: -3px;
}
</style>

</head>


<body style="overflow-x: hidden">

   	
	 <!-- Main content -->
	
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">결재함</p>
	  				<p class="menu-header">></p>
	  				<p class="menu-header this">기안문서함</p>  				
	  			</div>

	  		</div>
	  	</div>
	</section>
	
	 <!-- Main content -->
    <section class="content">		
		<div class="gw-card">
			<div class="card-header with-border">
			
				<div id="keyword" class="card-tools" style="width:540px;">
					<div class="input-group row">
						<select class="form-control col-md-3" name="perPageNum" id="perPageNum">
					  		<option value="10" >정렬개수</option>
					  		<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
					  		<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
					  		<option value="100" ${cri.perPageNum == 100 ? 'selected':''}>100개씩</option>
					  	</select>				
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>							
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>작성자+제목+내용</option>
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
			 <div class="container col-sm-12" style="float: left; width:100%; padding:0;">
	  <ul class="tabs" style="text-align:center; padding:0;">
	    <li class="tab-link current" data-tab="tab-1"><a href="#tabs-1"><i class="fa fa-list" aria-hidden="true"></i> LIST</a></li>
	    <li class="tab-link" data-tab="tab-4"><a href="#tabs-4"> <i class="fa fa-th" aria-hidden="true"></i> Grid</a></li>
	  </ul>
	  <div id="main-container" style="padding: 0; width:100%; height:933px;"><!-- height 바꾸지 말것 -->
	  
	  <!-- 리스트 -->
	  <div id="tab-1" class="tab-content current" style="padding: 0px; overflow-x: hidden; overflow-y: hidden;">
    	<iframe name="ifr-1" src="./requestList" scrolling="no" frameborder="0" style="width:100%;height:88vh;"></iframe>
	  </div>

	  <!-- 그리드 -->
	  <div id="tab-4" class="tab-content current" style="padding: 0 4px; overflow-x: hidden; overflow-y: hidden;">
	    	<iframe name="ifr-4" src="./requestGrid" scrolling="no" frameborder="0" style="width:100%;height:88vh;"></iframe>
	  </div>
	  </div>
	</div>

		
		</div>
			<div class="card-footer">		
				<jsp:include page="/WEB-INF/views/common/pagination.jsp">
					<jsp:param value="path" name="/board/management"/>
				</jsp:include>
			</div>
		</div>	
    </section>
    <!-- /.content -->

<!-- jQuery -->
<%-- <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script> --%>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/demo.js"></script>

</body>







