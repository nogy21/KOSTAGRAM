<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function checkpassword(){
		var password = document.getElementById('password').value;
		if(password=="${sessionScope.loginVO.password}"){
				return true;
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} 
	}
</script>
<div class="inner">
	<div class="container">
	<form action="PasswordModifyFormController.do" method="post" onsubmit="return checkpassword()">
		<table class="table table-borderless">
			<thead>
				<tr>
					<th>비밀번호 확인</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginVO.memberId}">
						<input type="password" id="password" required="required" placeholder="비밀번호">
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