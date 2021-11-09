<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Main -->
<div id="main">
	<div class="inner">
	
	<script type="text/javascript">
		function loginAjax() {
			let memberId = document.getElementById("memberId").value;
			let password = document.getElementById("password").value;
			if (memberId == "") {
				alert("아이디를 입력하세요");
			} else if(password == "") {
				alert("비밀번호를 입력하세요");
			}
			let xhr=new XMLHttpRequest();
			xhr.onload=function() { // 서버로부터 응답받았을 때 동작할 익명함수를 등록
				if(xhr.responseText=="성공") {
					console.log(xhr.responseText);
					location.href="MainController.do";
				} else {
					console.log(xhr.responseText);
					document.getElementById("loginCheckMessage").innerHTML=xhr.responseText;
				}
			}
			xhr.open("post", "LoginController.do");
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("memberId="+memberId+"&password="+password);
		}
	</script>
	
		<form method="post">
			<input type="text" id="memberId" name="memberId" placeholder="아이디" required="required"><br><br>
			<input type="password" id="password" name="password" placeholder="비밀번호" required="required"><br><br>
			<button type="button" onclick="loginAjax()">로그인</button><br><br>
			<span id="loginCheckMessage"></span>
			회원이 아니신가요? <a href="">회원가입</a>
		</form>
		
	</div>
</div>