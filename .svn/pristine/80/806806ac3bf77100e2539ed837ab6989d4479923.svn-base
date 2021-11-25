<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<title>임직원등록</title>

<body>

	<!-- Content Wrapper. Contains page content -->
<div>
  	 <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>임직원등록</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="#">
				        	<i class="fa fa-dashboard">조직도</i>
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	임직원등록
			        </li>		        
	    	 		 </ol>
	  			</div>
	  		</div>
	  	</div>
  	</section>
	<!-- Main content -->
	<section class="content register-page">
		<div class="register-box">
			<div class="login-logo">
    			<a href="<%=request.getContextPath()%>/organogram/registForm.do"><b>임직원 등록</b></a>
  			</div>
			<!-- form start -->
			<div class="card">				
				<div class="register-card-body">
					<form role="form" class="form-horizontal" action="regist.do" method="post">						
						<input type="hidden" name="face_photo" />
						<div class="input-group mb-3">
							<div class="mailbox-attachments clearfix" style="text-align: center;">
								<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto;"></div>
								<div class="mailbox-attachment-info">
									<div class="input-group input-group-sm">
										<label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">파일선택</label>
										<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled/>
										<span class="input-group-append-sm">											
											<button type="button" class="btn btn-info btn-sm btn-append" onclick="upload_go();">업로드</button>											
										</span>
									</div>
								</div>
							</div>
							<br />
						  </div>	
						  <div class="form-group row">
							 <label for="id" class="col-sm-3" style="font-size:0.9em;" >
							 	<span style="color:red;font-weight:bold;">*</span>사원번호</label>	
							<div class="col-sm-9 input-group input-group-sm">
								<input name="empno" 
									onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
								type="text" class="form-control" id="id" placeholder="숫자만 입력하세요 ">
								<span class="input-group-append-sm">	
									<button type="button" onclick="idCheck_go();"  class="btn btn-info btn-sm btn-append">중복확인</button>
								</span>								
							</div>								
						</div>
						<div class="form-group row">
							<label for="nm" class="col-sm-3" style="font-size:0.9em;">
								<span style="color:red;font-weight:bold;">*</span>이름</label>
							<div class="col-sm-9 input-group-sm">								
								<input class="form-control" name="nm" type="text" class="form-control" id="nm" />
							</div>
							
						</div>
						<div class="form-group row">
							<label for="cttpc" class="col-sm-3 control-label">전화번호</label>
							<div class="col-sm-9">	
								<div class="input-group-sm">
									<select style="width:75px;" name="cttpc" id="cttpc" class="form-control float-left">
										<option value="">-선택-</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="017">017</option>
										<option value="018">018</option>
									</select>							
									<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-&nbsp;</label>										
									<input style="width:68px;" name="cttpc" type="text" class="form-control float-left" />
									<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-</label>
									<input style="width:68px;" name="cttpc" type="text" class="form-control float-right" />						
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="fxnum" class="col-sm-3 control-label">팩스번호</label>
							<div class="col-sm-9">	
								<div class="input-group-sm">
									<select style="width:75px;" name="fxnum" id="fxnum" class="form-control float-left">
										<option value="">-선택-</option>
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="044">044</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="064">064</option>
									</select>							
									<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-&nbsp;</label>										
									<input style="width:68px;" name="fxnum" type="text" class="form-control float-left" />
									<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-</label>
									<input style="width:68px;" name="fxnum" type="text" class="form-control float-right" />						
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="dept_code" class="col-sm-3" style="font-size:0.9em;" >부서</label>
							<div class="col-sm-9">
								<select name="dept_code" class="form-control" style="font-size:0.9em;">
									<option value="B001">경리부</option>
									<option value="B002">사업부</option>
									<option value="B003">시설관리부</option>
									<option value="B004">인사부</option>
									<option value="B005">홍보부</option>
									<option value="B006">부서없음</option>
								</select>
							</div>
						</div>					
						<div class="form-group row">
							<label for="clsf_code" class="col-sm-3" style="font-size:0.9em;" >직급</label>
							<div class="col-sm-9">
								<select name="clsf_code" class="form-control" style="font-size:0.9em;">
									<option value="C001">사원</option>
									<option value="C002">대리</option>
									<option value="C003">기사</option>
									<option value="C004">계장</option>
									<option value="C005">과장</option>
									<option value="C006">차장</option>
									<option value="C007">팀장</option>
									<option value="C008">부장</option>
									<option value="C009">이사</option>
									<option value="C010">이사장</option>
									<option value="C011">사장</option>
									<option value="C012">회장</option>
								</select>
							</div>
						</div>					
						<div class="form-group row">
							<label for="rspofc_code" class="col-sm-3" style="font-size:0.9em;" >직책</label>
							<div class="col-sm-9">
								<select name="rspofc_code" class="form-control" style="font-size:0.9em;">
									<option value="D001">경리부사원</option>
									<option value="D002">경리부팀장</option>
									<option value="D003">경리부부장</option>
									<option value="D004">사업부사원</option>
									<option value="D005">사업부팀장</option>
									<option value="D006">사업부부장</option>
									<option value="D007">시설관리부사원</option>
									<option value="D008">시설관리부팀장</option>
									<option value="D009">시설관리부부장</option>
									<option value="D010">인사부사원</option>
									<option value="D011">인사부팀장</option>
									<option value="D012">인사부부장</option>
									<option value="D014">홍보부사원</option>
									<option value="D015">홍보부팀장</option>
									<option value="D016">홍보부부장</option>
									<option value="D017">임원</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="encpn" class="col-sm-3" style="font-size:0.9em;">입사일</label>
							<div class="col-sm-9 input-group-sm">
								<input name="encpn" type="date">
							</div>
						</div>
						<div class="form-group row">
							<label for="ip_adres" class="col-sm-3" style="font-size:0.9em;">아이피주소</label>
							<div class="col-sm-9 input-group-sm">
								<input name="ip_adres" type="text" class="form-control" id="ip_adres">
							</div>
						</div>
						<div class="form-group row">
							<label for="email_adres" class="col-sm-3" style="font-size:0.9em;">이메일</label>
							<div class="col-sm-9 input-group-sm">
								<input name="email_adres" type="email" class="form-control" id="email"
										placeholder="example@naver.com">
							</div>
						</div>
						<div class="card-footer">
							<div class="row">								
								<div class="col-sm-6">
									<button type="button" id="registBtn" onclick="regist_go(); return false;" class="btn btn-info">가입하기</button>
							 	</div>
							 	
							 	<div class="col-sm-6">
									<button type="button" id="cancelBtn" onclick="CloseWindow();"
										class="btn btn-default float-right">&nbsp;&nbsp;&nbsp;취 &nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</button>
								</div>
							
							</div>
						</div>
					</form>					
				</div><!-- register-card-body -->
			</div>
		</div>
	</section>		<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<form role="imageForm" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" onchange="picture_go();"
			style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>



<jsp:include page="./js/regist_js.jsp" />

</body>