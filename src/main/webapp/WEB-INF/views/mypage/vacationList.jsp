<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="row">
		<div class="col-md-12 col-12">
		    <section class="content">		
				<div class="gw-card">
					<div class="card-header with-border">
						<div id="keyword" class="card-tools" style="width: 540px;">
							<div class="input-group row">
								<input type="hidden" name="perPageNum" id="perPageNum" value="10">
								<c:forEach items="${codeList}" var="code">
								</c:forEach>
								<select class="form-control col-md-12" name="vcatn_code" id="vcatn_code">
									<option value="a" ${cri.vcatn_code eq 'a' ? 'selected':'' }>연차</option>
									<option value="b" ${cri.vcatn_code eq 'b' ? 'selected':'' }>오전 반차</option>
									<option value="c" ${cri.vcatn_code eq 'c' ? 'selected':'' }>오후 반차</option>
									<option value="d" ${cri.vcatn_code eq 'd' ? 'selected':'' }>병가</option>
									<option value="ab" ${cri.vcatn_code eq 'ab' ? 'selected':'' }>연차+오전반차</option>
									<option value="ac" ${cri.vcatn_code eq 'ac' ? 'selected':'' }>연차+오후반차</option>
									<option value="ad" ${cri.vcatn_code eq 'ad' ? 'selected':'' }>연차+병가</option>
									<option value="bc" ${cri.vcatn_code eq 'bc' ? 'selected':'' }>오전반차+오후반차</option>
									<option value="bd" ${cri.vcatn_code eq 'bd' ? 'selected':'' }>오전반차+병가</option>
									<option value="cd" ${cri.vcatn_code eq 'cd' ? 'selected':'' }>오후반차+병가</option>
									<option value="abc" ${cri.vcatn_code eq 'abc' ? 'selected':'' }>연차+오전반차+오후반차</option>
									<option value="bcd" ${cri.vcatn_code eq 'bcd' ? 'selected':'' }>오전반차+오후반차+병가</option>
									<option value="abcd" ${cri.vcatn_code eq 'abcd' ? 'selected':'' }>연차+오전반차+오후반차+병가</option>
								</select>
								<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
								<span class="input-group-append">
									<button class="btn btn-basic" type="button" id="searchBtn" data-card-widget="search" onclick="list_go4(1,'vacation');">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>			
						</div>
					</div>
					<div class="card-body" style="height: 250px">
						<table class="table text-center" >					
							<tr style="font-size:0.95em;">
								<th style="width:15%;">휴가</th>
								<th style="width:45%;">제 목</th>
								<th style="width:10%;">시작일</th>
								<th style="width:10%;">종료일</th>
								<th style="width:10%;">결재상태</th>
								<th style="width:10%;">사용일수</th>
							</tr>			
							<c:if test="${empty vacList }" >
								<tr>
									<td colspan="12">
										<strong>해당 내용이 없습니다.</strong>
									</td>
								</tr>
							</c:if>	
							<c:forEach items="${vacList}" var="vac" end="4">
									<tr style='font-size:0.85em;'>
									<td>
										${vac.vcatn_code}
									</td>
									<td>
										<%-- ${esc.sj} --%>
										<span>eccst.sj</span>
									</td>
									<td>
										<%-- ${esc.bgnde} --%>
										<span>eccst.bgnde</span>
									</td>
									<td>
										<%-- ${esc.endde} --%>
										<span>eccst.endde</span>
									</td>
									<td>
										<%-- ${esc.sttus_code} --%>
										<span>eccst.sttus_code</span>
									</td>
									<td>
										<fmt:parseNumber var="j" type="number" value="${vac.use_vcatn_daycnt}" />
										<c:set var="i" value="${j}"/>
										<c:choose>
											<c:when test="${i lt 1}">
												${vac.use_vcatn_daycnt}
											</c:when>
											<c:when test="${i ge 1}">
												${i}
											</c:when>
											<c:when test="${i eq 0}">
												0
											</c:when>
										</c:choose>
										
									</td>
								</tr>
							</c:forEach>
						</table>				
					</div>
					
					<div class="card-footer">
						<nav aria-label="pds list Navigation">
							<ul class="pagination justify-content-center m-0">
								<%@ include file="/WEB-INF/views/common/basic-pagination.jsp" %>	
							</ul>
						</nav>
					</div>
					
					
				
				</div>
			
		    </section>
	    </div>
    </div>
</body>
</html>