<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/notice.css">
<!-- myPageDetail.css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mypage/myPageDetail.css">
</head>
<style>
	tbody > tr> td:nth-child(1){
		text-align: left;
	}
	
	tbody > tr > td:nth-child(2){
		text-align: center;
	}
</style>
<body>
	<div class="pop-container" style="min-width:800px;">
		<section class="content-header">
			<div class="container-fluid">
				<!-- 상단바 -->
				<div class="row md-2">
					<p class="menu-header" style="display: inline; margin-right: 479px">
						ㅇ 회원 정보 상세
					</p>
					<button type="button" class="btn btn-basic" id="editBtn" style="margin-right: 10px;">저 장</button>
					<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();">닫 기</button>
				</div><!-- ./row md-2 -->
				<!-- ./상단바 -->
			</div><!-- ./container-fluid -->
		</section><!-- ./content-header -->
		<div class="profile-contents">
<!-- 			<table style="margin-left: auto; margin-right: auto; width: 600px; line-height: 40px;"> -->
			<table style="margin-left: auto; margin-right: auto; width: 600px;  border-top: 2em solid;  border-bottom: 2em solid;  border-color: transparent; ">
				<tr style="height: 320px;"><td colspan="2" style="text-align: center"><img  class="myProfile" src="https://bit.ly/3pCT0g0" alt="profile img" style="height: 280px; width: 180px"></td></tr>
				<tr>
					<td colspan="2" style="text-align: center;"><button value="사진 업로드"></button></td>
				</tr>			
				<tr>
					<td>사  번</td>
					<td>${loginUser.empno }</td>
				</tr>			
				<tr>
					<td>이  름</td>
					<td>${loginUser.nm }</td>
				</tr>			
				<tr>
					<td>부서코드</td>
					<td></td>
				</tr>			
				<tr>
					<td>직급코드</td>
					<td>${loginUser.clsf_code }</td>
				</tr>			
				<tr>
					<td>직책코드</td>
					<td>${loginUser.rspofc_code }</td>
				</tr>			
				<tr>
					<td>입사일</td>
					<td><fmt:formatDate value="${loginUser.encpn}" pattern="yyyy-MM-dd"/></td>
				</tr>			
				<tr>
					<td>퇴사일</td>
					<td><fmt:formatDate value="${loginUser.retire_de}" pattern="yyyy-MM-dd"/></td>
				</tr>			
				<tr>
					<td>연락처</td>
					<td><input type="text" value="${loginUser.cttpc }"></td>
				</tr>			
				<tr>
					<td>이메일 주소</td>
					<td><input type="text" value="${loginUser.email_adres }"></td>
				</tr>			
				<tr>
					<td>팩스 번호</td>
					<td>${loginUser.fxnum }</td>
				</tr>			
				<tr>
					<td>결재 서명</td>
					<td>${loginUser.sanctn_sign }</td>
				</tr>			
				<tr>
					<td>활성 여부</td>
					<td>${loginUser.actvty_at }</td>
				</tr>			
				<tr>
					<td>IP 주소</td>
					<td>${loginUser.ip_adres }</td>
				</tr>			
				<tr>
					<td>권한 코드</td>
					<td>${loginUser.author_code}</td>
				</tr>			
				<tr>
					<td>새 비밀번호</td>
					<td><input type="password"></td>
				</tr>			
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password"></td>
				</tr>			
			</table>
		</div><!-- ./profile-contents -->
	</div><!-- ./pop-container -->
	<br>
	<br>
</body>
</html>