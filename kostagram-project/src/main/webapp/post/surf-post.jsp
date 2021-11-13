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
				<span class="image"> 
					<a href="PostDetailController.do?postId=${post.postId}">
						<img id="content_img" src="images/${post.orgImg }" alt="" />
					</a><br>
				</span> 
		
			</article>
		</c:forEach>
	</section>
</body>