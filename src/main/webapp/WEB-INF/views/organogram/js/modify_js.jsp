<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
window.onload=function(){
	MemberPictureThumb(document.querySelector('[data-id="${emp.empno}"]'),'${emp.face_photo}','<%=request.getContextPath()%>');
}
  	
  	function changePicture_go(){
  		//alert("click picture btn");
  		var picture = $('input#inputFile')[0];
   
	   //이미지 확장자 jpg 확인
	   var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	   
	   if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
	      alert("이미지는 jpg/jpeg 형식만 가능합니다.");
	      picture.value="";      
	      return;
	   } 
	   
	   //이미지 파일 용량 체크
	   if(picture.files[0].size>1024*1024*1){
	      alert("사진 용량은 1MB 이하만 가능합니다.");
	      picture.value="";
	      return;
	   };
	   
	   //업로드 확인변수 초기화 (사진변경)
	   
	   document.getElementById('inputFileName').value=picture.files[0].name;//파일가져와서 이름꺼내서 출력해주는놈..
	   
	   
	   if (picture.files && picture.files[0]) {
		      var reader = new FileReader();
		       reader.onload = function (e) {
		           $('div#pictureView')
		              .css({'background-image':'url('+e.target.result+')',
		                 'background-position':'center',
		                 'background-size':'cover',
		                 'background-repeat':'no-repeat'
		                 });
		        }
		      reader.readAsDataURL(picture.files[0]);
		      
		   }
	   
	   //이미지  변경 확인
	   $('input[name="uploadPicture"]').val(picture.files[0].name);
	   
	   
  	}
  	
  	
  	
  	function modify_go(){
  		var form=$('form[role="form"]');
  		form.submit();
  		//alert("click modify btn");
  	}
</script>
  