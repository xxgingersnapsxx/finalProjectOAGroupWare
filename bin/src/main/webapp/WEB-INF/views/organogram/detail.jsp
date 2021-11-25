<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>임직원상세보기</title>

<body>

  <!-- Content Wrapper.123 Contains page content -->
  <div >
  	 <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>상세페이지</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="#">
				        	<i class="fa fa-dashboard">임직원</i>
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	상세보기
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
  	</section>
    <!-- Main content -->
    <section class="content register-page">       
		<div class="register-box">         
	    	<form role="form" class="form-horizontal"  method="post">
	    		<div class="register-card-header" >
	    			<h1 class="text-center">임직원</h1>
	    		</div>
	        	<div class="register-card-body" >
	            	<div class="row"  style="height:200px;">
						<div class="mailbox-attachments clearfix col-md-12" style="text-align: center;">							
							<div id="pictureView" data-id="${emp.empno }" style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto;">
							</div>														
						</div>
					</div>
					<br />
	                <div class="form-group row" >
	                  <label for="empno" class="col-sm-3 control-label text-right">사원번호</label>
	
	                  <div class="col-sm-9">
	                    <input name="empno" type="text" class="form-control" id="empno" value="${emp.empno }" readonly>
	                  </div>
	                </div>	               
	                <div class="form-group row">
	                  <label for="nm" class="col-sm-3 control-label text-right">이  름</label>
	
	                  <div class="col-sm-9">
	                    <input name="nm" type="text" class="form-control" id="nm" value="${emp.nm }" readonly>
	                  </div>
	                </div>
	                 <div class="form-group row">
	                  <label for="cpptc" class="col-sm-3 control-label text-right">전화번호</label>
	                  <div class="col-sm-9">   
	                  	<c:set var="cttpc" value="${emp.cttpc.replace('-','') }" />
	                  	<input name="cttpc" type="text" class="form-control" id="cpptc" value="${cttpc.substring(0,3) }-${cttpc.substring(3,7) }-${cttpc.substring(7) }">	                
	                  </div>                  
	                </div>               
	                 <div class="form-group row">
	                  <label for="fxnum" class="col-sm-3 control-label text-right">팩스번호</label>
	                  <div class="col-sm-9">   
	                  	<c:set var="fxnum" value="${emp.fxnum.replace('-','') }" />
	                  	
	                  	<input name="fxnum" type="text" class="form-control" id="fxnum" value="${fxnum.substring(0,3) }-${fxnum.substring(3,6) }-${fxnum.substring(6) }">	                
	                  </div>                  
	                </div>               
	                 <div class="form-group row">
	                  <label for="dept_code" class="col-sm-3 control-label text-right">부서</label>
	
	                  <div class="col-sm-9">
	                    <input name="dept_code" type="text" class="form-control" id="dept_code" value="${emp.dept_code}"  readonly>
	                  </div>
	                </div>
	                 <div class="form-group row">
	                  <label for="clsf_code" class="col-sm-3 control-label text-right">직급</label>
	
	                  <div class="col-sm-9">
	                    <input name="email" type="text" class="form-control" id="clsf_code" value="${emp.clsf_code}"  readonly>
	                  </div>
	                </div>
	                 <div class="form-group row">
	                  <label for="rspofc_code" class="col-sm-3 control-label text-right">직책</label>
	
	                  <div class="col-sm-9">
	                    <input name="rspofc_code" type="text" class="form-control" id="rspofc_code" value="${emp.rspofc_code}"  readonly>
	                  </div>
	                </div>
	              </div>  
	              </div>  
		          <div class="card-footer" >
		          		<div class="row">
			          		
			          		
			          	<c:if test="${loginUser.author_code eq 'ROLE_MANAGER' or loginUser.author_code eq 'ROLE_ADMIN' }">
			          		<div class="col-sm-3 text-center">
			          			<button type="button" onclick="location.href='modifyForm.do?empno=${emp.empno}';" id="modifyBtn" class="btn btn-warning ">수 정</button>
			          		</div>
		          		
			          		<div class="col-sm-3 text-center">
			          			<button type="button" onclick="location.href='remove.do?empno=${emp.empno}';" id="deleteBtn" class="btn btn-danger" >삭 제</button>
			          		</div>
		          			
			          		<div class="col-sm-3 text-center">
			          			<c:if test="${emp.actvty_at ne 0 }">
			          				<button type="button" onclick="location.href='stop.do?empno=${emp.empno}';" id="stopBtn" class="btn btn-info" >비활성</button>
			          			</c:if>
			          			<c:if test="${emp.actvty_at ne 1 }">
			          				<button type="button" onclick="location.href='active.do?empno=${emp.empno}';" id="stopBtn" class="btn btn-info" >활성</button>
			          			</c:if>
			          		</div>
			           </c:if>	
<%-- 			          		<div class="col-sm-${loginUser.id eq member.id ? 3 : 12 } text-center"> --%>
			          		<div class="col-sm-3 text-center">
			            		<button type="button" id="listBtn" onclick="CloseWindow();" class="btn btn-primary pull-right">닫 기</button>
			            	</div>
			            
		          	    </div>  	
		          </div>
	      	  </form>
      	  </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <script>
  	window.onload=function(){
  		MemberPictureThumb(document.querySelector('[data-id="${emp.empno}"]'),'${emp.face_photo}','<%=request.getContextPath()%>');
  		
  		<c:if test="${param.from eq 'modify'}">
	  		alert("${emp.nm}님의 정보가 수정되었습니다.");
	  		location.href='detail.do?empno=${emp.empno}';
	  		
	  		if(${parentReload}){
	  			if(confirm('로그인 사용자의 정복가 수정되었습니다.\n 현재 화면을 닫고 새로고침 하시겠습니까?')){
	  				window.opener.parent.location.reload(true);
	  				window.close();
	  			}
	  		}
  		</c:if>
  		<c:if test="${param.from eq 'remove'}">
  			alert("${emp.nm}님의 정보가 삭제되었습니다.")
  			<c:if test="${empty loginUser}">
  				window.opener.parent.location.href="<%=request.getContextPath()%>";
  			</c:if>
  			window.close();
  		</c:if>
  	}
  </script>
  
  
 </body>