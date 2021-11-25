<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/schedule/schedule_detail.css">
</head>

<title>일정 상세보기</title>

<body>
   <c:if test="${from eq 'modify' }" >
      <script>
         alert("수정되었습니다.");
         window.opener.location.reload();
      </script>
   </c:if>
   
   
   <c:if test="${from eq 'remove' }" >
      <script>
         alert("삭제되었습니다.");
         window.opener.location.reload();
         window.close();
      </script>
   </c:if>
   
    <!-- Content Header (Page header) -->
    <div class="pop-container" style="min-width:800px;">
   <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<p>일정 상세보기</p>  				
	  			</div>
	  		</div>
	  	</div>
	</section>       
          
                
    
  <!-- Main content -->
    <section class="content container-fluid">
      <div class="row">
         <div class="col-md-12">
            <div class="card card-outline card-primary">
               <div class="card-header">
               	<div class="card-tools">
               	
                     <button type="button" id="modifyBtn" class="btn btn-regist"   onclick="submit_go('modifyForm.do','${sch.schdul_no }');">수정</button>                  
                      <button type="button" id="removeBtn" class="btn btn-remove"  onclick="submit_go('remove.do','${sch.schdul_no }');">삭제</button>
                  	 <button type="button" id="cancelBtn" class="btn btn-cancle"   onclick="CloseWindow();">닫기 </button>
               </div>
              </div>
               <div class="card-body">
                  <div class="form-group col-sm-12">
                     <label for="schdul_sj">일정명</label>
                     <input type="text" class="form-control" id="schdul_sj " 
                        value="${sch.schdul_sj }" readonly />                     
                  </div>   
<!--                   <div class="col-sm-12 row"> -->
<!--                      <div class="form-group col-sm-4" > -->
<!--                         <label for="nm">이름</label> -->
<!--                         <input type="text" class="form-control" id="nm "  -->
<%--                             value="${sch.nm }" readonly /> --%>
<!--                      </div>       -->
                     
                     <div class="form-group col-sm-4" >
                        <label for="bgnde">시작일</label>
                        <input type="text" class="form-control" id="bgnde" 
                           value="${sch.bgnde }" readonly />
                     </div>   
                     <div class="form-group col-sm-4" >
                        <label for="endde">종료일</label>
                        <input type="text" class="form-control" id="endde" 
                           value="${sch.endde }" readonly />
                     </div>   
                    
                  <div class="form-group col-sm-12">
                     <label for="schdul_cn">내 용</label>
                     <div>${sch.schdul_cn }</div>
                  </div>
                  <div class="form-group col-sm-12">
                     <label for="schdul_code">일정분류</label>
                     <div>${sch.schdul_code }</div>
                  </div>
                  <div class="form-group col-sm-12">
                     <label for="cnrs_at">공유</label>
                     <div>${sch.cnrs_at }</div>
                  </div>
                     </div>     
               </div>
               <div class="card-footer">
                  
               </div>                           
            </div><!-- end card -->            
         </div><!-- end col-md-12 -->
      </div><!-- end row  -->      
      
    </section>
    </div>
<script>
    function submit_go(url,schdul_no){
      //alert(url);
     location.href=url+"?schdul_no="+schdul_no;
   }
 
 </script>
</body>

















