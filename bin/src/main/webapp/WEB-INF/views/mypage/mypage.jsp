<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar" %>
<c:set var="cri" value="${pageMaker.cri }" />
<style>
.center {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
.myProfile {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 150px;
	height: 150px;
	padding: 30list...jspx
}
td {
	width: 50px;
    text-align: center; 
    vertical-align: middle;
}
</style>
<script>
 	function myPageDetails() {
 		window.open('<%=request.getContextPath()%>/mypage/myPageDetails.do', '마이페이지', 800, 400);
	}  
</script>
<head>
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/board/notice.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>my page</title>
<body>
<div class="wrapper">
	<div class="container-fluid">
	    <div class="row">
	      <div class="col-md-3">
		    <div class="col-md-12" style="background-color: #EFF7FB; height: 250px; margin-top: 25px; text-align: center;">
<!-- 	    		<img  class="profile" src="https://bit.ly/3nyy9rC" alt="profile img"> --><!-- 프로필 이미지 -->
	    		<img  class="myProfile" src="https://bit.ly/3pCT0g0" alt="profile img" style="border-radius: 50%;">
	    		<p class="center" style="display: inline; text-align: center;">${loginUser.nm}</p>
<!-- 	    		<button type="button" class="btn btn-primary" style="display: inline; position: absolute; left: 180px; font-size: 11px; padding: 3px 8px;">사원</button> -->
	    		<small class="badge badge-secondary" style="padding: 5px 8px; background: #419EDD"> ${loginUser.rspofc_code} </small>
	    		<br><br>
				<button type="button" class="btn btn-primary" onclick="myPageDetails()" style="font-size: 11px; padding: 4px 8px; background: gray; border: none;">회원 정보 상세보기</button>
			</div><!-- end profile div --> 
			<br>
			<div style="text-align: center;">
	    		<small class="badge badge-secondary" style="padding: 5px 8px;"> IP </small>&nbsp;${loginUser.ip_adres}<br>
	    		<small class="badge badge-secondary" style="padding: 5px 8px;"> 출근 </small>&nbsp;2021.10.27 10:07<br>
	    		<small class="badge badge-secondary" style="padding: 5px 8px;"> 퇴근 </small>&nbsp;2021.10.27 10:07<br>
			</div>
	      </div><!--end left div -->
	      <div class="col-md-9">
	      	<br>
			<%
				Calendar cal = Calendar.getInstance();
				int month = cal.get(Calendar.MONTH) + 1;
			%>
	      	<p style="color: #2a9df4; font-weight:bold; display: inline;">${loginUser.nm}</p>님의 <p style="color: #2a9df4; font-weight:bold; display: inline;"><%=month%></p>월 근태 정보
	      	<br><br>
		      	<div class="row">
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">근태 현황</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table>
			              		<tr>
			              			<td>
						                <span class="info-box-text">지각</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">결근</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">조기퇴근</span>
						                <span class="info-box-number"><p style="color: #dc143c; font-weight:bold; display: inline;">1</p> 일</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">퇴근 미체크</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
			              			</td>
			              		</tr>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end 근태 현황 -->
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">근무 현황</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table>
			              		<tr>
			              			<td>
						                <span class="info-box-text">총 근무일수</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">총 근무 시간</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
			              			</td>
			              			<td>
						                <span class="info-box-text">평균 근무 시간</span>
						                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
			              			</td>
			              		</tr>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end 근무 현황 -->
		      	</div><!-- end right 1st row -->
		      	<div class="row">
		      		<div class="col-md-12">
				      	<p style="color: gray; font-weight:bold;">휴가 현황</p>
				      	<div class="info-box">
				              <div class="info-box-content">
				              	<table>
				              		<tr>
				              			<td>
							                <span class="info-box-text">발생 연차</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">사용 연차</span>
							                <span class="info-box-number"><p style="color: #dc143c; font-weight:bold; display: inline;">1</p> 일</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">잔여 연차</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">연차</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">반차</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
				              			</td>
				              			<td>
							                <span class="info-box-text">병가</span>
							                <span class="info-box-number"><p style="color: #2a9df4; font-weight:bold; display: inline;">1</p> 일</span>
				              			</td>
				              		</tr>
				              	</table>
				              </div><!-- /.info-box-content -->
				        </div><!-- /.info-box -->
				     </div><!-- /.col-md-12 -->
		      	</div><!-- end right 2nd row -->
		      	<div class="row">
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">발신 업무</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table>
			              		<tr>
			              			<td>글 제목</td>
			              			<td>업무 기한</td>
			              			<td>수신자</td>
			              		</tr>
            					<c:if test="${empty noticeList }" > <!-- TODO : 수정 -->
									<tr>
										<td colspan="5">
						              		<br>
											<strong>발신 업무가 없습니다.</strong>
										</td>
									</tr>
								</c:if>						
								<c:forEach items="${noticeList}" var="notice">
									<tr style='font-size:0.85em;'>
										<td>제목</td>
										<td>
											기안일
										</td>			
										<td>기안자</td>
									</tr>
								</c:forEach>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end 발신 업무 -->
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">수신 업무</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table>
			              		<tr>
			              			<td>글 제목</td>
			              			<td>업무 기한</td>
			              			<td>지시자</td>
			              		</tr>
            					<c:if test="${empty noticeList }" > <!-- TODO : 수정 -->
									<tr>
										<td colspan="5">
						              		<br>
											<strong>수신 업무가 없습니다.</strong>
										</td>
									</tr>
								</c:if>						
								<c:forEach items="${noticeList}" var="notice">
									<tr style='font-size:0.85em;'>
										<td>제목</td>
										<td>
											기안일
										</td>			
										<td>기안자</td>
									</tr>
								</c:forEach>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end 수신 업무 -->
		      	</div><!-- end right 3rd row -->
		      	<div class="row">
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">승인 대기 결재 문서</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table>
			              		<tr>
			              			<td>제 목</td>
			              			<td>기안일</td>
			              			<td>기안자</td>
			              		</tr>
              					<c:if test="${empty noticeList }" > <!-- TODO : 수정 -->
									<tr>
										<td colspan="5">
						              		<br>
											<strong>승인 대기 결재 문서가 없습니다.</strong>
										</td>
									</tr>
								</c:if>						
								<c:forEach items="${noticeList}" var="notice">
									<tr style='font-size:0.85em;'>
										<td>제목</td>
										<td>
											기안일
										</td>			
										<td>기안자</td>
									</tr>
								</c:forEach>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end 승인 대기 결재 문서 -->
		      		<div class="col-md-6">
			      		<p style="color: gray; font-weight:bold;">기안 결재 문서</p>
			      		<div class="info-box">
			              <div class="info-box-content">
			              	<table>
			              		<tr>
			              			<td>제 목</td>
			              			<td>기안일</td>
			              			<td>결재 상태</td>
			              		</tr>
            					<c:if test="${empty noticeList }" > <!-- TODO : 수정 -->
									<tr>
										<td colspan="5">
						              		<br>
											<strong>기안 결재 문서가 없습니다.</strong>
										</td>
									</tr>
								</c:if>						
								<c:forEach items="${noticeList}" var="notice">
									<tr style='font-size:0.85em;'>
										<td>제목</td>
										<td>
											기안일
										</td>			
										<td>기안자</td>
									</tr>
								</c:forEach>
			              	</table>
			              	</table>
			              </div><!-- /.info-box-content -->
			            </div>
		      		</div><!-- end 수신 업무 -->
		      	</div><!-- end right 4th row -->
		      	<div class="row">
		    		<%@ include file="/WEB-INF/views/mypage/vacationList.jsp" %>
		      	</div><!-- end right 5th row -->
	      </div><!--end right div -->
	    </div><!-- end row -->
	</div><!-- content container-fluid end -->
</div><!-- end wrapper -->
</body>
</html>