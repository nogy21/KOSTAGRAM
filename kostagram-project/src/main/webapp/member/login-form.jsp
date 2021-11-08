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
				//alert(xhr.responseText);
				document.getElementById("loginCheckMessage").innerHTML=xhr.responseText;
			}
			xhr.open("post", "LoginController.do");
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("memberId="+memberId+"&password="+password);
			/* // Ajax 통신을 위한 객체 생성
			let xhr = new XMLHttpRequest();
			// 콜백함수(서버가 응답하면 동작할 함수)를 익명함수로 등록
			let loginCheck=()=> {
				if(session==null)
				document.getElementById("loginCheckMessage").innerHTML="아이디 또는 비밀번호를 확인하세요";
			}
			// ajax 통신을 위한 정보 할당
			xhr.open("post", "AjaxLoginServlet");
			//ajax post 방식일 때 content type을 지정해야 한다. 
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send(); */
		}
		function loginCheck() {
			if(${sessionScope.loginVO}!=null) {
				location.href="MainController.do";
				return true;
			}
		}
	</script>
		<form method="post" onsubmit="return loginCheck()">
			<input type="text" id="memberId" name="memberId" placeholder="아이디" required="required"><br><br>
			<input type="password" id="password" name="password" placeholder="비밀번호" required="required"><br><br>
			<button type="button" onclick="loginAjax()">로그인</button><br><br>
			<span id="loginCheckMessage"></span>
			회원이 아니신가요? <a href="">회원가입</a>
		</form>
	</div>
</div>