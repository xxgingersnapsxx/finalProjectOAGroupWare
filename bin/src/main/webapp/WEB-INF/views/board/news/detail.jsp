<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/board/notice_detail.css">
</head>

<title>게시글 상세보기</title>
<body>

	<c:if test="${from eq 'remove'}">
		<script>
   		alert("삭제되었습니다.");
		window.opener.location.reload();
		window.close();
	</script>
	</c:if>
	<!-- Content Wrapper. Contains page content -->
		<div id="yo" class="pop-container" style="min-width: 800px;">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row md-2">
						<div class="col-sm-6">
							<p>ㅇ회사소식 상세보기</p>
						</div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
				<div class="row justify-content-center">
					<div class="col-md-12" style="max-width: 960px;">
						<form role="form">
						<div class="card-outline">
							<div class="card-header">
								<div class="card-tools">
									<c:if test="${loginUser.empno eq news.empno }">
										<button type="button" id="modifyBtn" class="btn btn-regist"
											onclick="modify_go();">수정</button>
										<button type="button" id="removeBtn" class="btn btn-remove"
											onclick="remove_go();">삭제</button>
									</c:if>
									<button type="button" class="btn btn-cancle" id="cancelBtn"
										onclick="CloseWindow();">닫기</button>
								</div>
							</div>
							<div class="card-body">
								<div class="form-group col-sm-12">
									<table class="table">
										<tr class="first-tr">
											<td class="table-th">작성자</td>
											<td>${news.emp_nm}</td>
											<td class="table-th">등록일</td>
											<td><fmt:formatDate value="${news.rgsde}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
										<tr>
											<td class="table-th">제목</td>
											<td colspan="3">${news.sj}</td>
										</tr>
										<tr class="table-content">
											<td class="table-th">내용</td>
											<td colspan="3">${news.cn}</td>
										</tr>
										<tr class="last-tr">
											<td class="table-th">첨부파일</td>
											<td colspan="3">
												<div class="row">
													<c:forEach items="${news.atchList }" var="atch">
														<div class="col-md-4 col-sm-4 col-xs-12"
															style="cursor: pointer;"
															onclick="location.href='<%=request.getContextPath()%>/board/news/getFile.do?file_no=${atch.file_no }';">
															<div class="info-box">
																<span class="info-box-icon bg-yellow"> <i
																	class="fa fa-copy"></i>
																</span>
																<div class="info-box-content">
																	<span class="info-box-text"> <fmt:formatDate
																			value="${news.rgsde }" pattern="yyyy-MM-dd" />
																	</span> <span class="info-box-number">${atch.file_nm }</span>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>

											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						</form>
						<!-- end card -->
						<!-- top 버튼 -->
						<div class="top-button">
							<a href="detail.do?bbsctt_no=${news.bbsctt_no} ">top</a>
						</div>
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row  -->
			</section>
			<!-- /.content -->
		</div>
	<!-- /.content-wrapper -->

	<!-- Modal -->
	<div id="modifyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" style="display: none;"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn"
						onclick="replyModify_go();">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn"
						onclick="replyRemove_go();">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<form role="form">
		<input type="hidden" name="bbsctt_no" value="${news.bbsctt_no}" />
	</form>


	<script>
	
	

	function modify_go(){
		var formObj = $("form[role='form']");
		//alert("click modify btn");
		formObj.attr({
			'action':'modifyForm.do',
			'method':'post'
		});
		formObj.submit();
	}
	function remove_go(){
		var formObj = $("form[role='form']");
		//alert("click remove btn");
		var answer = confirm("정말 삭제하시겠습니까?");
		if(answer){		
			formObj.attr("action", "remove.do");
			formObj.attr("method", "post");
			formObj.submit();
		}
	}
 	
	
</script>

</body>










