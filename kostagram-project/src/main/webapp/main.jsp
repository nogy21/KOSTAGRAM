<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Main -->
<div class="container">
	<div class="row">
		<div class="col-sm-2">
			<div class="menu_sticky">
				<h2>팔로우 추천</h2>
				<nav class="navbar bg-light">
					<ul class="navbar-nav">
						<li class="nav-item">
					   		<a class="nav-link" href="#">여기에는</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">무엇을</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">해야하죠</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="col-sm-8">
			<c:forEach items="${requestScope.postList }" var="post">
					<article onclick="">
						<table>
							<tr>
								<td>
									<img id="profile_img" src="images/profiletest.png" alt="Cinque Terre" onerror="this.src='images/basic_profile.png'">
								</td>
							</tr>
							<tr>
								<td>
									<font id="profile_name">${post.memberId }</font>
								</td>
							</tr>
						</table>
						<span class="image">
						<a href="PostDetailController.do?postId=${post.postId}"> 
							<img src="images/${post.orgImg }" alt="" />
						</a>
						</span><br>
						<p id="main_font">${post.postDate } | 좋아요 ♡ 3개</p>
						<p id="main_font">${post.postContent }</p>
					</article>
			</c:forEach>
		</div>
		<div class="col-sm-2">
			<div class="menu_sticky">
			</div>
		</div>
	</div>
</div>