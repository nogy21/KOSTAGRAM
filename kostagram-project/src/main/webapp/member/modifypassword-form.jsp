<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="inner">
	<div class="container">
	<form action="PasswordModifyController.do" method="post" onsubmit="return modifypassword()">
		<table class="table table-borderless">
			<thead>
				<tr>
					<th>${sessionScope.loginVO.memberId }님 비밀번호 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginVO.memberId }">
						<input type="password" id="password" required="required" placeholder="이전비밀번호">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="newpassword" id="newpassword" required="required" placeholder="새로운비밀번호" onkeyup="newpasswordcheck()">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="confirmpassword" id="confirmpassword" required="required" placeholder="새로운비밀번호확인" onkeyup="newpasswordcheck()">
					</td>
				</tr>
				<tr>
					<td>
						<span id="checkResult"></span>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">확인</button>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
</div>
<script type="text/javascript">
	function modifypassword() {
		var password = document.getElementById("password").value;	
		if (password!="${sessionScope.loginVO.password}") {
			alert("기존 비밀번호와 일치하지 않습니다");
			return false;
		}else if(newpasswordcheck()==false){
			alert("비밀번호가 불일치합니다.");
			return false;
		}else{
			if(confirm("비밀번호를 수정하시겠습니까?")==true){
				return true;
			}else
				return false;
		}
	}
	function newpasswordcheck(){
		var newpassword = document.getElementById("newpassword").value;
		var confirmpassword = document.getElementById("confirmpassword").value;
		if(newpassword==confirmpassword){
			document.getElementById("checkResult").innerHTML="비밀번호 일치"
			return true;
		}else{
			document.getElementById("checkResult").innerHTML="비밀번호 불일치"
			return false;
		}
	}
</script>