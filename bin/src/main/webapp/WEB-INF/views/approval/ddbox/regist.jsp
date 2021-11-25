<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>

<!-- notice_registForm.css -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/approval/eccstRgForm_registForm.css">

<style>
td {
  font-size: 13px;
}
</style>
</head>

<body>
	${erf.form_style}
  <!-- Content Wrapper. Contains page content -->
  <div class="pop-container" style="min-width:800px;  margin-left: 25px; ">
  	<div>
		<div class="form-box">
			<div class="form-box-header">
				<button type="button" class="form-btn close-btn" onclick="CloseWindow();">닫기</button>
				<button type="button" class="form-btn basic-btn" onclick="">참조자지정</button>
				<button type="button" class="form-btn basic-btn" onclick="">결재선지정</button>
				<button type="button" class="form-btn basic-btn" onclick="tempstorage_go();">임시저장</button>
				<button type="button" class="form-btn request-btn" onclick="">결재요청</button>
			</div>
			
			 <div class="form-box-body">
				<div class="form-box-body-header">
					<button type="button" class="form-btn star" onclick="">참조자 즐겨찾기</button>
					<button type="button" class="form-btn star" onclick="">자주 쓰는 결재선</button>
			    </div>
				
				 <table class="form-table1">
			        <tr id="form-table1-first-tr">
			          <td id="form-table1-first-td">${erf.form_nm}</td> 
			          <td>
			          		<table class="form-table2">
			          		  <tr>
			          		    <td class="form-table2-th" rowspan="4">
			          		    결<br/>재<br/>선
			          		    </td>
			          		  </tr>
			          		  <tr class="form-table2-tr-1">
			          		    <td class="td-border"></td>
			          		    <td class="td-border"></td>
			          		    <td class="td-border"></td>
			          		    <td class="td-border"></td>
			          		    <td></td>
			          		  </tr>
			          		  <tr class="form-table2-tr-2">
			          		    <td class="td-border"></td>
			          		    <td class="td-border"></td>
			          		    <td class="td-border"></td>
			          		    <td class="td-border"></td>
			          		    <td></td>
			          		  </tr>
			          		  <tr class="form-table2-tr-3">
			          		    <td class="td-border"></td>
			          		    <td class="td-border"></td>
			          		    <td class="td-border"></td>
			          		    <td class="td-border"></td>
			          		    <td></td>
			          		  </tr>
			          		</table>
			          </td>
			        </tr>
			      </table>
				  <form enctype="multipart/form-data" role="form" method="post" action="modify.do" name="modifyForm">
				      <input type="hidden" name="sanctn_no" id="sanctn_no" value="" />
				      <table class="form-table3">
				        <tr>
				          <td class="form-table3-th">기안부서</td>
				          <td class="userDept"></td>
				          <td class="form-table3-th">기안자</td>
				          <td class="userName"></td>
				          <td class="form-table3-th">기안일자</td>
				          <td></td>
				        </tr>
				        <tr>
				          <td class="form-table3-th">보존기한</td>
				          <td>5년</td>
				          <td class="form-table3-th">문서번호</td>
				          <td></td>
				          <td class="form-table3-th">보안수준</td>
				          <td></td>
				        </tr>
				        <tr>
				          <td class="form-table3-th">참조자</td>
				          <td colspan="5"></td>
				        </tr>
				        <tr>
				          <td class="form-table3-th">제목</td>
				          <td colspan="5">
				            <input type="text" class="form-box-input" id="form-box-title" name="sj">
				          </td>
				        </tr>
				      </table>
				  	${erf.form_cn}
				</form>
				
				   <div class="form-box-last">
				      	<br/>
				      </div>
				      <br/>
				
						 
			 </div>
				
		</div>  
  	</div>
  	
  </div>



<script>
window.onload=function(){
		var nm = '<c:out value="${loginUser.nm}"/>';
		var empno = '<c:out value="${loginUser.empno}"/>';
		var clsf = '<c:out value="${loginUser.clsf_code}"/>';
		
		$(".userName").text(nm);
		$(".userNum").text(empno);
		$(".userClsf").text(clsf);
}
</script>
</body>

    
    
    