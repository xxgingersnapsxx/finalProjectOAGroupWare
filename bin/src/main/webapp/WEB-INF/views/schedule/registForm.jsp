<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>

<html>
<head>
<!-- 부트스트랩 -->
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css'
	rel='stylesheet' />
<link
	href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet' />

<!-- Date Range Picker  -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>


<meta charset="UTF-8">
<title></title>
</head>
<body>

	<div class="card card-primary">
		<div class="card-header">
			<h3 class="card-title">일정 등록</h3>
		</div>
		<!-- /.card-header -->
		<!-- form start -->
		<form method="post" action="<%=request.getContextPath()%>/schedule/regist.do" name="registForm">
			<div class="card-body">
				<div class="form-group">
					<label for="schdul_sj">일정명</label> <input type="text"
						class="form-control" name="schdul_sj" id="schdul_sj"
						placeholder="일정명">
				</div>
				<div class="form-group">
					<label for="bgnde">시작 날짜</label> <i
						class="fa fa-calendar bigger-110"></i> <input type="text"
						class="form-control" name="bgnde" id="bgnde">
				</div>
				<div class="form-group">
					<label for="endde">종료 날짜</label> <input type="text"
						class="form-control" name="endde" id="endde">
				</div>
				<div class="form-group">
					<label>일정 색상</label> <select class="form-control" name="bg_color"
						id="bg_color">
						<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
						<option value="#D25565" style="color: #D25565;">빨간색</option>
						<option value="#9775fa" style="color: #9775fa;">보라색</option>
						<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
						<option value="#f06595" style="color: #f06595;">핑크색</option>
						<option value="#63e6be" style="color: #63e6be;">연두색</option>
						<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
						<option value="#4d638c" style="color: #4d638c;">남색</option>
						<option value="#495057" style="color: #495057;">검정색</option>
					</select>
				</div>
				<div class="form-group">
					<label>일정 분류</label> <select class="form-control" name="schdul_code"
						id="schdul_code">
						<option value="개인" >개인</option>
						<option value="부서" >부서</option>
						<option value="전사" >전사</option>
						
					</select>
				</div>
				<div class="form-group">
					<label>공유</label> <select class="form-control" name="cnrs_at"
						id="cnrs_at">
						<option value="1" >ㅇ</option>
						<option value="2" >ㅂ</option>
						
					</select>
				</div>
				
				<!--   <input type="hidden" id="mber_sn" name="mber_sn" value="1">  -->
				 <input type="hidden" id="empno" name="empno"
					value="${loginUser.empno }">
				<%--  <input type="hidden" id="nm" name="nm"
					value="${loginUser.nm }"> --%>
					
				<div class="form-group">
					<label for="schdul_cn">설명</label>
					<textarea class="form-control" id="schdul_cn" name="schdul_cn"></textarea>
				</div>

			</div>
			<!-- /.card-body -->
			<div class="card-footer">
				<button type="button" class="btn btn-primary" id="registBtn"
					onclick="regist_go();">일정 등록</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn" id="cancelBtn"
					onclick="CloseWindow();">취 소</button>
			</div>
		</form>
	</div>


	<script>
		//날짜 선택
		$(function() {
			$('input[name="bgnde"]').daterangepicker(
					{
						timePicker : true,
						//timePicker24Hour:true,
						singleDatePicker : true,
						timePickerIncrement : 10,
						//autoUpdateInput: false,
						startDate : moment().startOf('hour'),
						endDate : moment().startOf('hour').add(32, 'hour'),
						locale : {
							format : 'YYYY-MM-DD', // 일시 노출 포맷
							//format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
							applyLabel : "확인", // 확인 버튼 텍스트
							cancelLabel : "취소", // 취소 버튼 텍스트
							daysOfWeek : [ "일", "월", "화", "수", "목", "금", "토" ],
							monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
									"7월", "8월", "9월", "10월", "11월", "12월" ]
						}
					});

			$('input[name="endde"]').daterangepicker(
					{
						timePicker : true,
						timePicker24Hour : true,
						singleDatePicker : true,
						timePickerIncrement : 10,
						//autoUpdateInput: false,
						startDate : moment().startOf('hour'),
						endDate : moment().startOf('hour').add(32, 'hour'),
						locale : {
							format : 'YYYY-MM-DD', // 일시 노출 포맷
							//format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
							applyLabel : "확인", // 확인 버튼 텍스트
							cancelLabel : "취소", // 취소 버튼 텍스트
							daysOfWeek : [ "일", "월", "화", "수", "목", "금", "토" ],
							monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
									"7월", "8월", "9월", "10월", "11월", "12월" ]
						}
					});

		});

		function regist_go() {
	 	 var m = moment($("input[name='endde']").val());
			var endDate = m.add('days', 1).format();
			var realEndDate = endDate.substr(0, 10);
			//endDate.format('YYYY-MM-DD');
			console.log(m);
			console.log(endDate);
			console.log(realEndDate);
			if ($("input[name='schdul_sj']").val() == "") {
				alert("일정명은 필수입니다.");
				$("input[name='schdul_sj']").focus();

				return;
			}
			if ($("input[name='bgnde']").val() > $("input[name='endde']").val()) {
				alert('끝나는 날짜가 앞설 수 없습니다.');
				return;
			}
			document.registForm.endde.value = realEndDate;
			console.log(document.registForm.endde.value);  

			document.registForm.submit();
		}
	</script>
</body>
</html>