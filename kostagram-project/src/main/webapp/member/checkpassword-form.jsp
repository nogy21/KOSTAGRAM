<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function checkpassword() {
		var password = document.getElementById('password').value;
		if (password == "${sessionScope.loginVO.password}") {
			return true;
		} else {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	}
</script>
<form action="PasswordModifyFormController.do" method="post"
	onsubmit="return checkpassword()">
	<section class="input-section-wrap">
		<h3>비밀번호 확인</h3>
		<div class="input-wrap">
			<input type="password" id="password" required="required" placeholder="비밀번호">
		</div>
		<div class="button-wrap">
			<button type="submit">확인</button>
		</div>
	</section>
</form>

