<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<header id="header">
<div align="right">
		<button class="btn-test">로그인</button>
		<button class="btn-test">회원가입</button>
	</div>
	<!-- Logo -->
	<a href="MainController.do" class="logo"> <span class="symbol">
			<img src="images/logo3.jpeg" alt="" />
	</span> <span class="title">KOSTAGRAM</span>
	</a><hr>
	<!--  Search -->
<form method="get">
	<div align="center">
		<input type="text" placeholder="Search" size="30" style="height: 40px">
		<button type="button" class="btn-test">검색</button>
	</div>
</form>
</header>
