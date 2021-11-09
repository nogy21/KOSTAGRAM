<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var url = 'PasswordModifyFormController.do';
	function checkpassword(){
		var password = document.getElementById('password').value;
		if(password==${sessionScope.loginVO.password}){
				location.href=url;
			}else{
				alert("비밀번호가 일치하지 않습니다.")
			} 
	}
</script>
<div class="inner">
	<div class="container">
		<table class="table table-borderless">
			<thead>
				<tr>
					<th>비밀번호 확인</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="password" id="password" required="required" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" onclick="checkpassword()">확인</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>