<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- tab style -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway+Dots&display=swap" rel="stylesheet">
<script>
  $(function() {
    $(".column").sortable({
      // 드래그 앤 드롭 단위 css 선택자
      connectWith: ".column",
      // 움직이는 css 선택자
      handle: ".card-header",
      // 이동하려는 location에 추가 되는 클래스 (드래그할 경우 뒤에 생기는 노란 배경)
      placeholder: "card-placeholder"
    });
    // 해당 클래스 하위의 텍스트 드래그를 막는다.
    $( ".column .card" ).disableSelection();
  });
</script>
<style>
/* 마우스 포인터을 손가락으로 변경 */
.card:not(.no-move) .card-header{
  cursor: pointer;
}
/* 이동 타켓 */
.card-placeholder {
   border: 2px dotted grey; 
   margin: 0 1em 1em 0; 
   height: 50px; 
   margin-left:auto; 
   margin-right:auto; 
/*  노란색으로 표신되는 것이 주요 포인트  */
   background-color: #FCF4C9;
}
p {
  color:grey;
  font-size: 13px;
  font-weight: bold;
}
.card-title {
  font-size: 12px;
  font-weight: bold;
}
.font-basic{
  font-size: 14px;
  font-weight: bold;
}
.widget-body {
  width: 65px;
  height: 85px;
  background: #E4E9E8;
  border-radius: 8px;
  text-align: center;
  cursor: pointer;
  color: black;
  padding-top: 15px;
  margin: 0 auto;
  margin-top: 10px;
}
.widget-body p {
  font-family: 'Gowun Dodum', sans-serif;
  color: black;
  margin-top: 10px;
  font-size: 13px;
}
.widget-body:hover, .widget-body:focus, .widget-body:active{
  background: #C4C7CD;
  color: #007bff;
}
.widget-body i {
  color: black;
}

.fix {
  padding:4px 0; 
  border-top: 5px solid #293648;
  border-bottom: 5px solid #293648;
  border-radius: 5px;
  text-align: center;
  background: #C7B492;
}
.card-outline-sm {
  background: #293648;
  height: 105px;
  text-align: center;
  border-radius: 8px;
} 
.col-sm-4 {
  padding: 0 5px;
}
p.main_img_p {
  font-family: 'Raleway Dots', cursive;
  color: ivory;
  font-size: 25px;
}
p.up {
  position: absolute;
  top: 30px;
  left: 350px;
}
p.down {
  position: absolute;
  top: 70px;
  left: 430px;
}
#icon-div {
  height: auto;
  margin: 0 auto;
}
.fa-user-circle-o {
  color: white;
}
#profil {
  width: 300px;
  height:330px; 
  margin:0 auto;
  padding-top: 55px;
}
.profil-info {
  padding-top: 20px;
}
.profil-info p#info-name {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 20px;
  color: black;
}
.btn-tool {
  padding: 4px;
}
#info-ip {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 14px;
  font-weight: bold;
  color: #3B3F3D;
  background: powderblue;
  border-radius: 6px;
  padding: 2px 8px;
}
#ip_adres {
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 14px;
  font-weight: bold;
  color: #3B3F3D;
}
.commute-div {
  margin: 10px 20px;
}
.info-commute {
  font-weight: bold;
  font-size: 12px;
  color: white;
  background: #41875A;
  border-radius: 6px;
  padding: 4px 8px;
  float: left;
}
</style>
</head>
<body style="background:#f4f6f9;">
<div class="wrapper">

  	<div class="container-fluid">
	<div class="row" style="background:ivory; margin-bottom: 10px;">
      <div class="col-md-3">
      <div class="container-fluid" style="padding: 0; padding-top:5px;">

		  <div>
            <div class="card card-outline fix">

              <div id="profil" class="card-body">
                <div id="icon-div">
	              	<i class="fa fa-address-card-o fa-5x" aria-hidden="true"></i>
                </div>
                
                <div class="profil-info">
	              	<p id="info-name">${loginUser.nm }</p>
	              	<span id="info-ip">IP</span>&nbsp;<span id="ip_adres">${loginUser.ip_adres}</span>
	              	<hr/>
	              	<div class="commute-div"><span class="info-commute">출근</span>&nbsp;<span></span></div>
	              	<div class="commute-div"><span class="info-commute">퇴근</span>&nbsp;<span></span></div>
                </div>
                
              </div>
              <!-- /.card-body -->
              
            </div>
            <!-- /.card -->
          </div>
      </div><!-- /.container-fluid -->
	</div>
	
	
    <div class="col-md-6" style="margin-top:8px;">
      <div class="container-fluid">
        <img src="<%=request.getContextPath() %>/resources/css/common/img/main_img.jpg" style="width:100%;">
        <p class="main_img_p up">Office Anywhere,</p>
        <p class="main_img_p down">Work Anything</p>
	  </div>
	</div>
	
	
    <div class="col-md-3">
		  <div class="container-fluid" style="padding: 0; padding-top:5px;">
	
			<div>
	            <div class="card card-outline fix">

	              <div class="card-body" style="height:330px;">
	              <div class="row" style="margin-top:25px;">
						  <div class="col-sm-4">
					        <div class="container-fluid" style="padding: 0;">
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="#">
						         <i class="fa fa-id-card-o fa-2x" aria-hidden="true"></i><br>
						         <p>개인근태</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="#">
						         <i class="fa fa-check fa-2x" aria-hidden="true"></i><br>
						         <p>출퇴근</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
					       </div>
						  </div><!-- ./col-sm-4 -->
						  <div class="col-sm-4">
					        <div class="container-fluid" style="padding: 0;">
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="#">
						         <i class="fa fa-pencil fa-2x" aria-hidden="true"></i><br>
						         <p>기안작성</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
						       <div class="card card-outline-sm">
						         <div class="widget-body">
								 <a href="#">
						         <i class="fa fa-retweet fa-2x" aria-hidden="true"></i><br>
						         <p>반려문서함</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
					       </div>
						  </div><!-- ./col-sm-4 -->
						  <div class="col-sm-4">
					        <div class="container-fluid" style="padding: 0;">
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="#">
						         <i class="fa fa-newspaper-o fa-2x" aria-hidden="true"></i><br>
						         <p>회사소식</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
						       <div class="card card-outline-sm">
						         <div class="widget-body">
						         <a href="#">
						         <i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true"></i><br>
						         <p>대기업무함</p>
						         </a>
						         </div><!-- /.card-body -->
						       </div>
						       <!-- /.card -->
					       </div>
						  </div><!-- ./col-sm-4 -->
						</div>
	              </div>
	              <!-- /.card-body -->
	              
	            </div>
	            <!-- /.card -->
	         </div>
	      </div><!-- /.container-fluid -->  	
	</div>	
	</div>
		
	</div>
	<!-- 메인 홈 위젯 시작 -->  
  	<div class="container-fluid">
      <div class="row" style="background:#f4f6f9;">
      <!-- 세로 리스트 박스 -->
        <div class="col-3 column">

	      <div class="container-fluid" style="padding: 0;">
	
		  <div>
            <div class="card card-outline">
              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
                <p class="card-title" style="color:#004680; padding-top:4px;">일정 D-DAY</p>

                <div class="card-tools">
				  <button type="button" class="btn btn-tool" data-card-widget="card-refresh" data-source="widgets.html" data-source-selector="#card-refresh-content" data-load-on-init="false">
                    <i class="fas fa-sync-alt"></i>
                  </button>
                  <button type="button" class="btn btn-tool">
                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
                  </button>
                </div>
                <!-- /.card-tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body" style="height:250px;">
                The body of the card
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
	      </div>
	      </div><!-- /.container-fluid -->
	      <div class="container-fluid" style="padding: 0;">
			<div>
	            <div class="card card-outline">
	              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
	                <p class="card-title" style="color:#004680; padding-top:4px;">자주 찾는 주소록</p>
	
	                <div class="card-tools">
					  <button type="button" class="btn btn-tool" data-card-widget="card-refresh" data-source="widgets.html" data-source-selector="#card-refresh-content" data-load-on-init="false">
	                    <i class="fas fa-sync-alt"></i>
	                  </button>
	                  <button type="button" class="btn btn-tool">
	                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
	                  </button>
	                </div>
	                <!-- /.card-tools -->
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body" style="height:150px;">
	                The body of the card <br/><br/><br/>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	        </div>
	      </div><!-- /.container-fluid -->
        </div>
        
        
        
        <div class="col-6 column">   
	      <!-- 메인 가운데 제일 큰 화면 -->
	        <div class="container-fluid" style="padding: 0;">
	
			<div>
	            <div class="card card-outline">
	              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
	                <h3 class="card-title" style="color:#004680; padding-top:4px;">일정관리</h3>
	
	                <div class="card-tools">
					  <button type="button" class="btn btn-tool" data-card-widget="card-refresh" data-source="widgets.html" data-source-selector="#card-refresh-content" data-load-on-init="false">
	                    <i class="fas fa-sync-alt"></i>
	                  </button>
	                  <button type="button" class="btn btn-tool">
	                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
	                  </button>
	                </div>
	                <!-- /.card-tools -->
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body" style="height:455px;">
	                The body of the card
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	          </div>
	        </div><!-- /.container-fluid -->
         </div>


         <div class="col-3 column">
	
	        <div class="container-fluid" style="padding: 0;">
	
			  <div>
	            <div class="card card-outline">
	              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
	                <h3 class="card-title" style="color:#004680; padding-top:4px;">공지사항</h3>
	
	                <div class="card-tools">
					  <button type="button" class="btn btn-tool" data-card-widget="card-refresh" data-source="widgets.html" data-source-selector="#card-refresh-content" data-load-on-init="false">
	                    <i class="fas fa-sync-alt"></i>
	                  </button>
	                  <button type="button" class="btn btn-tool">
	                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
	                  </button>
	                </div>
	                <!-- /.card-tools -->
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body" style="height:250px;">
	                The body of the card
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	          </div>
	        </div><!-- /.container-fluid -->
	        <div class="container-fluid" style="padding: 0;">
	
			  <div>
	            <div class="card card-outline">
	              <div class="card-header" style="padding:4px 15px; border-top: 5px solid #004680;">
	                <h3 class="card-title" style="color:#004680; padding-top:4px;">개인 문서함</h3>
	
	                <div class="card-tools">
					  <button type="button" class="btn btn-tool" data-card-widget="card-refresh" data-source="widgets.html" data-source-selector="#card-refresh-content" data-load-on-init="false">
	                    <i class="fas fa-sync-alt"></i>
	                  </button>
					  <button type="button" class="btn btn-tool">
	                    <i class="fa fa-external-link-square" aria-hidden="true"></i>
	                  </button>
	                </div>
	                <!-- /.card-tools -->
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body" style="height:150px;">
	                The body of the card
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	          </div>
	        </div><!-- /.container-fluid -->
	        <div class="container-fluid" style="padding: 0;">
	        </div><!-- /.container-fluid -->      
         </div>
             
      </div>
    </div>	
</div>  <!-- ./wrapper -->


</body>
</html>