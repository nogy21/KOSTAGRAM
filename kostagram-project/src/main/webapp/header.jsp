<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<%
	session.setAttribute("loginVO", 1234);
%>
<header id="header">
	<c:choose>
		<c:when test="${sessionScope.loginVO==null}">
			<form>
				<div align="right">
					<button class="btn-test" onclick="LoginFormController.do">로그인</button>
					<button class="btn-test" onclick="RegisterFormController.do">회원가입</button>
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<div align="right">
				<a href ="UpdateMemberFormController">회원정보수정</a>&nbsp;&nbsp;
				<a href =>마이페이지</a>&nbsp;&nbsp;
				<%-- ${loginVO.name }님&nbsp;&nbsp; --%>
				<a href =>로그아웃</a>&nbsp;&nbsp;
				</div>
		</c:otherwise>
	</c:choose>
	<!-- Logo -->
	<a href="MainController.do" class="logo"> <span class="symbol">
			<img src="images/logo3.jpeg" alt="" />
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
