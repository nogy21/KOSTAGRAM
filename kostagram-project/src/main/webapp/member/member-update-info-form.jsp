<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function checkInput() {
		var email = document.getElementById("email").value;
		var name = document.getElementById("name").value;

		if (email == "" && name == "") {
			alert("변경하실 정보를 최소 1개 입력해주세요.");
			return false;
		} else {
			if ("${sessionScope.loginVO.email }" == email) {
				alert("기존의 이메일과 동일합니다.");
				return false;
			} else if ("${sessionScope.loginVO.name }" == name) {
				alert("기존의 이름과 동일합니다.");
				return false;
			} else {
				if (confirm("정보를 수정하시겠습니까?") == true) {
					return true;
				} else {
					return false;
				}
			}

		}
	}
</script>
<!-- Main -->
<div align="center">
	<button type="button" class="btn-test"
		onclick="location.href='UpdateMemberFormController.do'">정보수정</button>
	<button type="button" class="btn-test"
		onclick="location.href='ProfileUpdateFormController.do'">프로필수정</button>
	<button type="button" class="btn-test"
		onclick="location.href='PasswordCheckFormController.do'">비밀번호수정</button>
	<br> <br>
</div>
<form action="UpdateMemberController.do" method="post" onsubmit="return checkInput()">
	<section class="input-section-wrap">
		<div class="input-wrap">
			<input type="email" name="email" id="email" placeholder="${sessionScope.loginVO.email }"> 
			<input type="hidden" name="memberId" value="${sessionScope.loginVO.memberId }">
		</div><br>
		<div class="input-wrap">
			<input type="text" name="name" id="name" placeholder="${sessionScope.loginVO.name }">
		</div>
		<div class="button-wrap">
			<button type="submit">정보수정</button>
		</div>
	</section>
</form>
