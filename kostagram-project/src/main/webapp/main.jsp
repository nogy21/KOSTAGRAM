<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = "images\\";
%>
<body>
	<section class="tiles" onclick="location.href='PostDetailController.do?postId=${post.postId}'">
		<c:forEach items="${requestScope.postList }" var="post">
			<article onclick="">
				<img id="profile_img" src="<%=path%>${post.memberVO.profileImgPath}" alt="Cinque Terre">
				<a href="MemberDetailFormController.do?memberid=${post.memberVO.memberId }" style="text-decoration:none">
				<font size="15px">${post.memberVO.memberId }</font>
				</a>
				<hr> 
				<span class="image">
				<a href="PostDetailController.do?postId=${post.postId}">
				 <img src="images/${post.orgImg }" alt="" />
				 </a>
				</span> <br>
				<p id="main_font">${post.postDate }</p>
				<p id="main_font">${post.postContent }</p>
				<hr>
			</article>
		</c:forEach>
	</section>
</body>