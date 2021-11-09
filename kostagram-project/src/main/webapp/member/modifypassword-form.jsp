<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String password = "1234";
	session.setAttribute("loginVO", password);
%>
<div class="inner">
	<div class="container">
		<table class="table table-borderless">
			<thead>
				<tr>
					<th>비밀번호 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
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
						<button type="button" onclick="modifypassword()">확인</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
	 var url = "PasswordModifyController.do";
	function modifypassword() {
		var password = document.getElementById("password").value;	
		if (password!=${loginVO}) {
			alert("기존 비밀번호와 일치하지 않습니다");
			return;
		}else if(newpasswordcheck()==false){
			alert("비밀번호가 불일치합니다.");
		}else{
			confirm("비밀번호를 수정하시겠습니까?");
			location.href=url;
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