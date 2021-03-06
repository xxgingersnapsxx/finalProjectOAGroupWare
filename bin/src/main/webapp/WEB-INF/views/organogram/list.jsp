<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }"/>
<%session.setAttribute("path", request.getContextPath() + "/organogram/main"); %>

<head></head>

<title>조직도</title>

<body>
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<i class="fa fa-file-text-o fa-lg" aria-hidden="true"></i>
	  				<p class="menu-header">조직도</p>
	  			</div>
	  		</div>
	  	</div>
	</section>
	
	   	<section class="content">
   		<div class="card">
   			<div class="card-header with-border">
<%--    			<c:if test="${loginUser.author_code eq 'ROLE_MANAGER' or loginUser.author_code eq 'ROLE_ADMIN' }"> --%>
   				<button type="button" class="btn btn-primary" onclick="OpenWindow('registForm.do','임직원등록',800,1000);" >임직원등록</button>
<%--    			</c:if> --%>
   				<div id="keyword" class="card-tools" style="width:550px;">
   					 <div class="input-group row">
   					 	<!-- search bar -->
   					 	<!-- bbsType -->
   					 	 <select class="form-control col-md-3" name="deptType" id="deptType">
					  		<option value="all" ${cri.deptType eq 'all' ? 'selected':'' } >부서전체</option>
					  		<option value="B001" ${cri.deptType eq 'B001' ? 'selected':'' }>경리부</option>
					  		<option value="B002" ${cri.deptType eq 'B002' ? 'selected':'' }>사업부</option>
					  		<option value="B003" ${cri.deptType eq 'B003' ? 'selected':'' }>시설관리부</option>
					  		<option value="B004" ${cri.deptType eq 'B004' ? 'selected':'' }>인사부</option>
					  		<option value="B005" ${cri.deptType eq 'B005' ? 'selected':'' }>홍보부</option>
					  		<option value="B006" ${cri.deptType eq 'B006' ? 'selected':'' }>부서없음</option>
					  	</select>	 	
   					 	 <!-- sort num -->
					  	<select class="form-control col-md-3" name="perPageNum" id="perPageNum"
					  		onchange="list_go(1);">
					  		<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>정렬개수</option>
					  		<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
					  		<option value="30" ${cri.perPageNum == 30 ? 'selected':''}>30개씩</option>
					  		<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
					  	</select>
					  	
					  	  <!-- search bar -->
					 	<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="np"  ${cri.searchType eq 'np' ? 'selected':''}>검색구분</option>
							<option value="n"  ${cri.searchType eq 'n' ? 'selected':''}>이름</option>
							<option value="p"  ${cri.searchType eq 'p' ? 'selected':''}>전화번호</option>
							<option value="np"  ${cri.searchType eq 'np' ? 'selected':''}>이름+전화번호</option>
						</select>
						<!-- keyword -->
   					 	<input  class="form-control" type="text" name="keyword" 
										placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" 
									id="searchBtn" data-card-widget="search" onclick="list_go3(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					<!-- end : search bar -->		
   					 </div>
   				</div>   			
   			</div>
   			<div class="card-body" style="text-align:center;">
    		  <div class="row">
	             <div class="col-sm-12">	
		    		<table class="table table-bordered">
		    			<tr>
		                	<th>사번</th>
		                	<th>이름</th>
		                	<th>연락처</th>
		                	<th>팩스번호</th>
		                	<th>부서</th> <!-- yyyy-MM-dd  -->
		                	<th>직급</th>
		                	<th>직책</th>
		                	<th>이메일주소</th>
		               	</tr>
		            
		               	<c:forEach items="${empList }" var="emp" >
		               	  <tr  onclick="OpenWindow('detail.do?empno=${emp.empno}','','800','900');" style="cursor:pointer;">
		               		<td>${emp.empno }</td>
		              		<td>${emp.nm }</td>
			              		<c:set var="phone" value="${emp.cttpc.replace('-','') }" />
		              		<td>${phone.substring(0,3) }-${phone.substring(3,7) }-${phone.substring(7) }</td>
			              		<c:set var="fax" value="${emp.fxnum.replace('-','') }" />
		              		<td>${fax.substring(0,3) }-${fax.substring(3,6) }-${fax.substring(6) }</td>
		              		
		              		<td>${emp.dept_code }</td>
		              		<td>${emp.clsf_code }</td>
		              		<td>${emp.rspofc_code }</td>
		              		<td>${emp.email_adres }</td>
		              	  </tr>
		               	</c:forEach>   	
		              
		               	
		            </table>
    		     </div> <!-- col-sm-12 -->
    	       </div> <!-- row -->
    		</div> <!-- card-body -->
    		<div class="card-footer">
    			<%@ include file="/WEB-INF/views/common/treeEmpPagination.jsp" %>
    		</div>
	     </div>
   	</section>
	
	<script>

function list_go3(page,url){
	if(!url) url="main.do";
	
	console.log("url : " + url);
	
	var jobForm=$('#TreeEmpForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='deptType']").val($('select[name="deptType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}
</script>
	
</body>