<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<header id="header">
	<c:choose>
		<c:when test="${sessionScope.loginVO==null}">
				<div align="right">
					<button class="btn-test" onclick="location.href='LoginFormController.do'">로그인</button>
					<button class="btn-test" onclick="location.href='RegisterFormController.do'">회원가입</button>
				</div>
		</c:when>
		<c:otherwise>
			<div align="right">
				<a href ="UpdateMemberFormController.do">회원정보수정</a>&nbsp;&nbsp;
				<a href =>마이페이지</a>&nbsp;&nbsp;
				${sessionScope.loginVO.memberId }님&nbsp;&nbsp;
				 <a href="javascript:logout()">로그아웃</a>&nbsp;&nbsp;
        		<form action="LogoutController.do" method="post" id="logoutForm"></form>
				</div>
		</c:otherwise>
	</c:choose>
	<!-- Logo -->
	<a href="MainController.do" class="logo"> <span class="symbol">
			<img src="images/logo4.png" alt="" />
	</span> <span class="title">KOSTAGRAM</span>
	</a>
	<hr>
	<!--  Search -->
	<form method="get">
		<div align="center">
			<input type="text" placeholder="Search" size="30"
				style="height: 40px">
			<button type="button" class="btn-test">검색</button>
		</div>
	</form>
</header>
<script>
            function logout(){
                let rst = confirm("로그아웃하시겠습니까?");
                if (rst) {
                    document.getElementById("logoutForm").submit();
                }
            }
        </script>
