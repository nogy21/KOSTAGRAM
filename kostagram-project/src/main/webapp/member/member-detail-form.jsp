<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = "images\\";
%>
<header>
	<div class="row">
		<div class="col-sm-2">
			<table style="text-align: left; border: none">
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="col-sm-2">
		<c:forEach items="${requestScope.memberDetail }" var="detail">
				<img id="profile_img2" src="<%=path%>${detail.profileImgPath}" alt="Cinque Terre" onerror="this.src='images/basic_profile.png';">
			</c:forEach>
		</div>
		<div class="col-sm-8">
			<c:forEach items="${requestScope.memberDetail }" var="detail">
					<font size="5px">User ID: ${detail.memberId }</font><br>
				<br>
					<font size="5px">이름: ${detail.name }</font><br>
				<br>
					<font size="5px">E-mail: ${detail.email }</font><br>
				<br>
					<font size="5px">소개글: ${detail.introduce }</font><br>
				<br>
			</c:forEach>
		</div>
	</div>
</header>
<hr>
<body>
	<section class="tiles">
		<c:forEach items="${requestScope.myPost }" var="post">
			<article onclick="">
				<a href="PostDetailController.do?postId=${post.postId}">
					<span class="image"> <img src="images/${post.orgImg }" alt="" /></span>
				</a>
				<br>
				<p id="main_font">${post.postDate }| 좋아요 ♡ 3개</p>
				<p id="main_font">${post.postContent }</p>
			</article>
		</c:forEach>
	</section>
</body>

