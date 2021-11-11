<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function modifypassword() {
		var password = document.getElementById("password").value;
		if (password != "${sessionScope.loginVO.password}") {
			alert("기존 비밀번호와 일치하지 않습니다");
			return false;
		} else if (newpasswordcheck() == false) {
			alert("비밀번호가 불일치합니다.");
			return false;
		} else {
			if (confirm("비밀번호를 수정하시겠습니까?") == true) {
				return true;
			} else
				return false;
		}
	}
	function newpasswordcheck() {
		var newpassword = document.getElementById("newpassword").value;
		var confirmpassword = document.getElementById("confirmpassword").value;
		if (newpassword == confirmpassword) {
			document.getElementById("checkResult").innerHTML = "비밀번호 일치"
			return true;
		} else {
			document.getElementById("checkResult").innerHTML = "비밀번호 불일치"
			return false;
		}
	}
	function passwordChanged() {
        var strength = document.getElementById('strength');
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[a-zA-Z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{8,})(((?=.*[a-zA-Z])(?=.*[0-9]))|((?=.*[a-zA-Z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        var pwd = document.getElementById("newpassword");
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
<form action="PasswordModifyController.do" method="post"
	onsubmit="return modifypassword()">
	<section class="input-section-wrap">
		<h3>${sessionScope.loginVO.memberId }님비밀번호 수정</h3>
		<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginVO.memberId }">
		<div class="input-wrap">
			<input type="password" id="password" required="required" placeholder="이전비밀번호">
		</div><br>
		<div class="input-wrap">
			<input type="password" name="newpassword" id="newpassword" required="required" placeholder="새로운비밀번호" onkeyup="return passwordChanged()"><br>
		</div><br>
		 <span id="strength">Type Password</span><br>
		<div class="input-wrap">
			<input type="password" name="confirmpassword" id="confirmpassword" required="required" placeholder="새로운비밀번호확인" onkeyup="newpasswordcheck()">
		</div><br>
		<span id="checkResult"></span>
		<div class="button-wrap">
			<button type="submit">확인</button>
		</div>
	</section>
</form>