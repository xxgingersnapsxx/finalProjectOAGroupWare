//팝업창들 뛰우기
//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
							+"height="+ WinHeight +", top="+ wintop +", left=" 
							+ winleft +", resizable=yes, status=yes"  );
	win.focus() ; 
}

//팝업창 닫기
function CloseWindow(parentURL){
	
	if(parentURL){
		window.opener.parent.location.href=parentURL;
	}else{
		window.opener.location.reload(true);	
	}
	
	window.close();
}


// 목록 검색
function list_go(page,url){
	if(!url) url="list.do";
	
	console.log("url : " + url);
	
	var jobForm=$('#jobForm');
	
	if(!page) page=1;
	
	console.log("page : " + page);
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}


//사용자 사진 출력
function MemberPictureThumb(targetObj, fileName,contextPath){ //(대상, 이미지파일명) 
	
	targetObj.style.backgroundImage="url('"+contextPath+"/organogram/getPicture.do?picture="+fileName+"')";
	targetObj.style.backgroundPosition="center";
	targetObj.style.backgroundRepeat="no-repeat";
	targetObj.style.backgroundSize="cover";
}
	
//spring_security redirect loginForm
function AjaxErrorSecurityRedirectHandler(status) {
	if (status == "302") {
		alert("세션이 만료되었습니다.\n로그인 하세요.");
		location.reload();

	} else {
		alert("시스템장애로 실행이 불가합니다.");
		history.go(-1);
	}

}










