<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Main -->
<script type="text/javascript">
	function checkId() {
		let memberId = document.getElementById("memberId").value;
		//아이디 공란인 경우 가입하기 불가, alert창 활성화
		if (memberId == "") {
			alert("아이디를 입력하세요!");
			return;
		}
		//아이디 중복확인 Ajax 구현
		let xhr = new XMLHttpRequest();
		xhr.onload = function() {
			document.getElementById("idCheckNotice").innerHTML = xhr.responseText;
			document.getElementById("flag").value = document
					.getElementById("memberId").value;

			if (xhr.responseText.equals("아이디 중복되어 사용불가합니다")) {
				document.getElementById("memberId").value = "";
				document.getElementById("memberId").focus();
			} else if (xhr.responseText.equals("아이디 사용가능합니다!")) {
				document.getElementById("password").focus();
			}
		}
		//post방식에서 get방식으로 변경
		//xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		//xhr.send("id=" + memberId);
		xhr.open("get", "IdCheckController.do?memberId=" + memberId);
		xhr.send();
	}

	// 아이디 중복확인하지 않은 상태에서 가입하기를 누르면 아이디 중복확인하세요 alert 후 전송시키지 않는다 
	function checkForm() {
		if (document.getElementById("memberId").value != document
				.getElementById("flag").value) {
			alert("아이디 중복확인하세요");
			return false;
		}
		if (document.getElementById("password").value != document
				.getElementById("confirmPwd").value) {
			alert("패스워드가 일치하지 않습니다!");
			return false;
		}
	}

	//비밀번호 일치 여부 확인 메서드 
	function passwordMatch() {
		var match = document.getElementById('passMatch');
		var pswd = document.getElementById("confirmPwd");
		var pwd = document.getElementById("password");
		if (pswd.value.length == 0) { //')' token error duplicate, syntax error 발생지점
			match.innerHTML = 'Type Password';
		} else if (pwd.value == pswd.value) {
			match.innerHTML = '<span style="color:green">password Matched!</span>';
		} else {
			match.innerHTML = '<span style="color:red">discord with password</span>';
		}
	}

	//비밀번호 보안강도 표시 메서드
	function passwordChanged() {
		var strength = document.getElementById('strength');
		var strongRegex = new RegExp(
				"^(?=.{8,})(?=.*[a-zA-Z])(?=.*[0-9])(?=.*\\W).*$", "g");
		var mediumRegex = new RegExp(
				"^(?=.{8,})(((?=.*[a-zA-Z])(?=.*[0-9]))|((?=.*[a-zA-Z])(?=.*[0-9]))).*$",
				"g");
		var enoughRegex = new RegExp("(?=.{6,}).*", "g");
		var pwd = document.getElementById("password");
		if (pwd.value.length == 0) {
			strength.innerHTML = 'Type Password';
		} else if (false == enoughRegex.test(pwd.value)) {
			strength.innerHTML = 'More Characters';
		} else if (strongRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:green">Strong!</span>';
		} else if (mediumRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:orange">Medium!</span>';
		} else {
			strength.innerHTML = '<span style="color:red">Weak!</span>';
		}
	}
</script>

<form action="RegisterController.do" method="post" onsubmit="return checkForm()">
	<section class="input-section-wrap">
		<h3>회원가입</h3>
		<%-- 아이디 중복확인 여부를 저장하는 hidden --%>
		<input type="hidden" id="flag" value="">
		<div class="input-wrap">
			<input type="text" name="memberId" id="memberId" required="required" placeholder="아이디">
			<button type="button" onclick="checkId()">중복확인</button>
		</div><br>
		<span id="idCheckNotice"></span><br>
		<div class="input-wrap">
			<input type="password" name="password" id="password" required="required" placeholder="비밀번호" onkeyup="return passwordChanged()"><br>
			<br> <span id="strength">Type Password</span>
		</div><br><br>
		<div class="input-wrap">
			<input type="password" name="confirmPwd" id="confirmPwd" name="confirmPswd" required="required" placeholder="비밀번호확인" onkeyup="return passwordMatch()"><br>
		<br><span id="passMatch">Type Password</span><br><br>
		</div><br><br>
		<div class="input-wrap">
			<input type="text" name="email" required="required" placeholder="이메일">
		</div><br><br>
		<div class="input-wrap">
			<input type="text" name="name" required="required" placeholder="이름">
		</div><br><br>
		<div class="button-wrap">
			<button type="submit">가입하기</button>
		</div>
	</section>
</form>











