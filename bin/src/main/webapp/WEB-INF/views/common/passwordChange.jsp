<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

#button1:hover {
	background-color: rgba(255, 255, 255, 1);
	color: black;
}
#button2:hover {
	background-color: rgba(255, 255, 255, 1);
	color: black;
}
.div1 {
	width: 100%
}
.div2 {
	margin: 0px auto;
	width: 1280px;
	height: 960px;
	background-image: url('kk.png');
	background-repeat: no-repeat;
	background-size: 100%;
}
.div2 img {
	width: 100%;
}
.pwlogin {
	float: left;
	padding: 120px;
	margin-top: 25%;
	margin-left: 10%;
	background: rgba(240, 240, 240, 0.4);
}
.facelogin {
	float: right;
	padding: 120px;
	margin-top: 25%;
	margin-right: 10%;
	background: rgba(240, 240, 240, 0.4);
}
#button1 {
	background-color: #8aa1a1;
	border: none;
	color: white;
	padding: 15px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	opacity: 0.8;
}
#button2 {
	background-color: #8aa1a1;
	border: none;
	color: white;
	padding: 15px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	opacity: 0.8;
}
/* 모달 */
#my_modal2 {
	display: none;
	width: 300px;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}
#my_modal2 .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
}
/* 비밀번호 로그인폼 */
header{
    display:flex;
    justify-content: center;
}
form{
    padding:10px;
}
.input-box{
    position:relative;
    margin:10px 0;
}
.input-box > input{
    background:transparent;
    border:none;
    border-bottom: solid 1px #ccc;
    padding:20px 0px 5px 0px;
    font-size:14pt;
    width:100%;
}
input::placeholder{
    color:transparent;
}
input:placeholder-shown + label{
    color:#aaa;
    font-size:14pt;
    top:15px;
}
input:focus + label, label{
    color:#8aa1a1;
    font-size:10pt;
    pointer-events: none;
    position: absolute;
    left:0px;
    top:0px;
    transition: all 0.2s ease ;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    -o-transition: all 0.2s ease;
}
input:focus, input:not(:placeholder-shown){
    border-bottom: solid 1px #8aa1a1;
    outline:none;
}
input[type=button]{
    background-color: #8aa1a1;
    border:none;
    color:white;
    border-radius: 5px;
    width:100%;
    height:35px;
    font-size: 14pt;
    margin-top:100px;
}
#forgot{
    text-align: right;
    font-size:12pt;
    color:rgb(164, 164, 164);
    margin:10px 0px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${msg eq 'a'}">
	<script>
		alert("최초 로그인이 확인되었습니다. 비밀번호를 변경하십시오.");
	</script>
</c:if>


<body>
	<div class="div1">
		<div class="div2">
			<div class="pwlogin">
				<button id="button1">비밀번호 로그인</button>
			</div>
			<div class="facelogin">
				<button id="button2">얼굴인식 로그인</button>
			</div>
		</div>
	</div>
	<div id="my_modal2">
		<header>
			<h2>비밀번호 변경</h2>
		</header>
		<form role="form" method="post" name="pwChangeForm" action="pwChange">
			<div class="input-box">
				<input id="password" type="password" name="password" placeholder="새 비밀번호">
				<label for="password">새 비밀번호</label>
			</div>
			<div class="input-box">
				<input id="password2" type="password" name="pw2"
					placeholder="비밀번호 확인"> <label for="password">비밀번호 확인</label>
			</div>
			<input type="button" onclick="pwChange()" value="완료">
			<input type="hidden" id="empno" name="empno" value="${loginUser.empno }">
			<input type="hidden" id="clsf_code" name="clsf_code" value="${loginUser.clsf_code}">
		</form>
	</div>
	
	<!-- 모달 스크립트 -->
	<script>
	
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

		$('#button1').on('click', function() {
			// 모달창 띄우기
			//     alert('message');
			modal('my_modal');
		});
		

		function pwChange(){
			var form = document.pwChangeForm;
			var inputPW=$('input[id="password"]').val();
		    var inputPW2=$('input[id="password2"]').val();
		    
		    
		    if(inputPW==""){
			    alert("비밀번호를 입력하세요.");
			    inputPW.focus();
			    return;
		    }else if(inputPW2==""){
		    	alert("비밀번호 확인을 입력하세요.");
		    	inputPW2.focus();
		    	return;
		    } else if(!inputPW == inputPW2){
		    	alert("입력하신 비밀번호가 다릅니다.");
		    	inputPW2.focus();
		    	return;
		    }
			
			form.submit();
		}
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			alert("최초 로그인이 확인되었습니다. 비밀번호를 변경하십시오.");
		    modal('my_modal2');
		});
	</script>
</body>
	
</html>





