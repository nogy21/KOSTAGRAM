<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function checkInput(){
		var email = document.getElementById("email").value;
		var name = document.getElementById("name").value;
		
		if(email==""&&name==""){
			alert("변경하실 정보를 최소 1개 입력해주세요.");
			return false;
		}else{
			if(confirm("정보를 수정하시겠습니까?") == true){
				return true;
			}else{
				return false;
			}
		}
	}
</script>

<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<div class="container">
				  <form action="UpdateMemberController.do" method="post" onsubmit="return checkInput()">
				    <table class="table table-borderless">
				      <tbody>
				        <tr>
				          <td>이메일</td>
				          <td>
				          	<input type="text" name="email" id="email">
				          	<input type="hidden" name="memberId" value="${sessionScope.loginVO.memberId }">
				          </td>
				        </tr>
				        <tr>
				          <td>이름</td>
				          <td><input type="text" name="name" id="name"></td>
				        </tr>
				      </tbody>
				    </table>
				    <button type="submit">정보수정</button>
				  </form>
				</div>
			</div>
		</div>
	</div>