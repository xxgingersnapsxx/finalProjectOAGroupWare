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
	
	/* 모달 */
	#my_modal {
		display: none;
		width: 300px;
		padding: 20px 60px;
		background-color: #fefefe;
		border: 1px solid #888;
		border-radius: 3px;
	}
	#my_modal .modal_close_btn {
		position: absolute;
		top: 10px;
		right: 10px;
	}
</style>
<body>
	<div class="pop-container" style="min-width:800px;">
		<section class="content-header">
			<div class="container-fluid">
				<!-- 상단바 -->
				<div class="row md-2">
					<p class="menu-header" style="display: inline; margin-right: 509px">
						회원 정보 상세
					</p>
					<button type="button" class="btn btn-basic" id="editBtn" style="margin-right: 10px;">수 정</button>
					<button type="button" class="btn btn-cancle" id="cancelBtn" onclick="CloseWindow();">닫 기</button>
				</div><!-- ./row md-2 -->
				<!-- ./상단바 -->
			</div><!-- ./container-fluid -->
		</section><!-- ./content-header -->
		<div class="profile-contents">
			<table style="margin-left: auto; margin-right: auto; width: 600px; line-height: 40px;">
				<tr style="height: 320px;"><td colspan="2" style="text-align: center"><img  class="myProfile" src="https://bit.ly/3pCT0g0" alt="profile img" style="height: 280px; width: 180px"></td></tr>
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
					<td>${loginUser.cttpc }</td>
				</tr>			
				<tr>
					<td>이메일 주소</td>
					<td>${loginUser.email_adres }</td>
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
			</table>
		</div><!-- ./profile-contents -->
	</div><!-- ./pop-container -->
	<br>
	<br>
	<form role="form">
		<input type="hidden" name="bbsctt_no" value="${notice.bbsctt_no}" />
	</form>
	<div id="my_modal">
		<header>
			<h2>비밀번호 확인</h2>
		</header>
		<form action="<%=request.getContextPath() %>/common/login.do" method="POST">
			<div class="input-box">
				<input id="password" type="password" name="pw"
					placeholder="비밀번호"> <label for="password"></label>
			</div>
			<input type="submit" value="확인">
		</form>
		<a class="modal_close_btn">닫기</a>
	</div>
<script>
	// 창 전환 스크립트
/* 	function modify_go(){
		var formObj = $("form[role='form']");
		//alert("click modify btn");
		formObj.attr({
			'action':'myPageDetailsModify.do',
			'method':'post'
		});
		formObj.submit();
	} */
	
	/*모달 스크립트*/
	function modal(id) {
 		var zIndex = 9999;
		var modal = $('#' + id);
		// 만지지마 화면 중앙에 비치하는거임

		// 모달 div 뒤에 희끄무레한 레이어
		var bg = $('<div>').css({
			position : 'fixed',
			zIndex : zIndex,
			left : '0px',
			top : '0px',
			width : '100%',
			height : '100%',
			overflow : 'auto',
			// 레이어 색갈은 여기서 바꾸면 됨
			backgroundColor : 'rgba(0,0,0,0.4)'
		}).appendTo('body');

		modal
			.css(
				{
				position : 'fixed',
				boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
				// 시꺼먼 레이어 보다 한칸 위에 보이기
				zIndex : zIndex + 1,
	
				// div center 정렬
				top : '50%',
				left : '50%',
				transform : 'translate(-50%, -50%)',
				msTransform : 'translate(-50%, -50%)',
				webkitTransform : 'translate(-50%, -50%)'
				}).show()
		} 

		$('#editBtn').on('click', function() {
			// 모달창 띄우기
		    alert('message');
			// modal('my_modal');
		}
		}
	});
</script>
</body>
</html>