<%@page import="org.kostagram.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="ProfileUpdateController.do" method="post" enctype="multipart/form-data">
	<%
	String path = "images\\";
	%>
	<!-- img 태그의 src 속성이 context path로부터 시작함 -->
	<div class="image-container">
		<div align="center">
			<img style="width: 500px;" id="preview-image" src="<%=path%>${sessionScope.loginVO.profileImgPath}"><br>
			<input style="display: block;" type="file" name="file" id="input-image"> <br><br>
			<textarea rows="8" cols="100" name="introduce" placeholder="본인에 대해 소개해주세요">${sessionScope.loginVO.introduce}</textarea>
		</div>
	</div><br>
	<div align="center">
		<button type="reset" class="btn-test">취소</button>
		<button class="btn-test">업로드</button>
	</div>
</form>
<script type="text/javascript">
	function readImage(input) {
    	// 인풋 태그에 파일이 있는 경우
    	if(input.files && input.files[0]) {
       	 // 이미지 파일인지 검사 (생략)
        	// FileReader 인스턴스 생성
        	const reader = new FileReader()
        	// 이미지가 로드가 된 경우
        	reader.onload = e => {
            	const previewImage = document.getElementById("preview-image")
            	previewImage.src = e.target.result
        	}
        	// reader가 이미지 읽도록 하기
        	reader.readAsDataURL(input.files[0])
   	 	}
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})
</script>