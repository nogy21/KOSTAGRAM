<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = "images\\";
%>
<div class="row">
<div class="col-sm-3">
</div>
<div class="col-sm-5">
		<c:forEach items="${requestScope.postList }" var="post">
				<img id="profile_img" src="<%=path%>${post.memberVO.profileImgPath}" alt="Cinque Terre" onerror="this.src='images/basic_profile.png'">
				<a href="MemberDetailFormController.do?memberid=${post.memberVO.memberId }" style="text-decoration:none">
				<font size="15px">${post.memberVO.memberId }</font>
				</a>
				<span class="image">
				<a href="PostDetailController.do?postId=${post.postId}">
				 <img id="content_img" src="images/${post.orgImg }" alt="" />
				 </a>
				</span> <br>
				<p >${post.postDate }</p>
				<p >${post.postContent }</p>
				<hr>
		</c:forEach>
		</div>
		<div align="center">
		<div class="col-sm-4">
		<div class="menu_sticky">
				<h2>인기 유저</h2>
				<nav class="navbar bg-light">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="#">
							
							jiwon_0930</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">
							
							성원</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">
							
							2_zu00</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">
							
							westKite</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">
							
							jenny.es</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">
							
							Dragon94Power</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
