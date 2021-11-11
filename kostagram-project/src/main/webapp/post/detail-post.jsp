<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<h1>Generic Page</h1>
				<span class="image main"><img src="images/${requestScope.postVO.orgImg }" alt="" /></span>
				<p>${requestScope.postVO.postContent }</p>
				<c:import url="post/comment.jsp"/>
			</div>
		</div>
	</div>