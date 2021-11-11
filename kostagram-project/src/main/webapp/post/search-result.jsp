<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = "images\\";
%>
<%-- id 검색결과 --%>
<section class="tiles" onclick="MemberDetailFormController.do?memberid=${memberList.memberId}'">
<c:forEach items="${requestScope.searchMemberList}" var="memberList">
	<article onclick="">
		<img id="profile_img" src="<%=path%>${memberList.profileImgPath}" alt="Cinque Terre">
		<a href="MemberDetailFormController.do?memberid=${memberList.memberId}" style="text-decoration:none">
			<font size="15px">${memberList.memberId}</font>
		</a>
		<hr>
	</article>
</c:forEach>
</section>

<%-- 포스트검색결과 --%>
<section class="tiles" onclick="location.href='PostDetailController.do?postId=${postList.postId}'">
<c:forEach items="${requestScope.searchPostList}" var="postList">
	<article>
		<font size="15px">${postList.postContent}</font>
		<a href="PostDetailController.do?postId=${postList.postId}">
			<span class="image">
				<img src="images/${postList.orgImg}" alt="" />
				${postList.postId}
			</span>
		</a><br>
	</article>
</c:forEach>
</section>