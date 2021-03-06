<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
<head>
<!-- summernote -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">

<!-- notice_registForm.css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice_registForm.css">
<style>
.btn-basic {
  background: #004680;
  color: white;
  width: 90px;
  padding: 8px;
  border: 2px solid #004680;
  border-radius: 0;
  height: 38px;
  font-size: 14px;
  font-weight: bold;
}
.btn-basic:hover {
  background: white;
}

</style>

</head>
<body>

  <div class="pop-container" style="min-width:800px;">
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<p>ㅇ경조사게시글 등록</p>  				
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-12" style="max-width:960px;">
				<div class="card-outline">
					<div class="card-header">
						<div style="display:inline;">
						    <div style="display:inline;">
							    <span class="sysdate">등록일</span>&nbsp;&nbsp;&nbsp;
							    <span style="color:#556278;"><c:out value="${sysYear}" /></span>
						    </div>
						</div>
						<div class ="card-tools" style="display:inline;">
							<button type="button" class="btn btn-regist" id="registBtn" onclick="regist_go();">등 록</button>
							
							<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
					
					
						<form enctype="multipart/form-data" role="form" method="post" action="regist.do" name="registForm">
							<input type="hidden" id="empno" readonly name="empno" class="form-control" value="${loginUser.empno }">
							<div class="form-group" id="group-1">
								<label for="emp_nm">작성자</label> 
								<input type="text" id="emp_nm" readonly 
									name="emp_nm" class="form-control" value="${loginUser.nm }">
							</div>
							<div class="form-group" id="group-2">
								<label for="sj">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label> 
								<input type="text" id="sj"
									name="sj" class="form-control" placeholder="제목을 입력하세요">
							</div>							
							<div class="form-group" id="group-3">
							  <div style="margin: 0 auto; ">
								<label for="cn" id="label-3">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</label>
								<textarea class="textarea" name="cn" id="cn" rows="20"
									style="display: none;"></textarea>
							  </div>
							</div>
							<div class="form-group">								
								<div style="margin : 0 auto;">
									<div>
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
										&nbsp;&nbsp;<button class="btn btn-basic" onclick="addFile_go();"	type="button" id="addFileBtn">파일첨부</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
						</form>
						
						
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->

  </div>  
<script>
window.onload=function(){
	Summernote_start($('#cn')); 
	$('.fileInput').on('change','input[type="file"]',function(event){
		if(this.files[0].size>1024*1024*40){
			alert("파일용량이 40MB를 초과하였습니다.");
			this.value="";
			$(this).click();
			return false;
		}
	});
	
	$('div.fileInput').on('click','div.inputRow > button',function(event){
		$(this).parent('div.inputRow').remove();
	});
	
	
}
</script>
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>
<script>
function addFile_go(){
//		alert("add file btn");

	if($('input[name="uploadFile"]').length >= 5){ //선택자가 동일한 ㅁ ㅏ크업이있으면 제이쿼리는 배열로 가져온다... 그리고 이건 태그갯수확인
		alert("파일추가는 5개까지만 가능합니다.");
		return
	}


	var input= $('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	var div = $('<div>').addClass("inputRow");
	div.append(input).append("<button style='border:0;'outline:0;' class='badge bg-red' type='button'>X</button>");
	$('.fileInput').append(div);
}	

function regist_go(){
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name+" : "+file.value);
		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}	
	
	if($("input[name='title']").val()==""){ //form.title.value
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}

	document.registForm.submit();	
}
</script>



</body>