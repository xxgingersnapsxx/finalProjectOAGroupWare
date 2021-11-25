<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar" %>
<c:set var="cri" value="${pageMaker.cri }" />
<style>
/* .profile { */
/* 	background-color: #EFF7FB; */
/* } */
</style>
<head>
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>my page</title>
<body>
<div class="wrapper">
	<div class="container-fluid">
	  <div class="row">
		<div class="col-md-4">
			<div class="profile" >
				${loginUser.nm}&nbsp;
				<%-- 		${loginUser.RSPOFC_CODE } --%>
			</div><!-- end profile -->
		</div><!-- end left container -->
		<div class="col-4 column">
			<%
				Calendar cal = Calendar.getInstance();
				int month = cal.get(Calendar.MONTH) + 1;
			%>
			${loginUser.nm}님의 <p style="display:inline; color:blue"><%=month%></p>월 근태 정보
		</div>
		<div class="col-4 column">
			right div
		</div>
	  </div> <!-- ./row -->
		</div><!-- content container-fluid end -->
</div><!-- end wrapper -->

<div class="container show-grid">
    <div class="row">
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
      <div class="col-md-1">.col-md-1</div>
    </div>
    <div class="row">
      <div class="col-md-8">.col-md-8</div>
      <div class="col-md-4">.col-md-4</div>
    </div>
    <div class="row">
      <div class="col-md-4">.col-md-4</div>
      <div class="col-md-4">.col-md-4</div>
      <div class="col-md-4">.col-md-4</div>
    </div>
    <div class="row">
      <div class="col-md-6">.col-md-6</div>
      <div class="col-md-6">.col-md-6</div>
    </div>
</div>


출처: https://jwgye.tistory.com/26 [Cycle & Develop]

출처: https://jwgye.tistory.com/26 [Cycle & Develop]
</body>
</html>