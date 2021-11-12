<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = "images\\";
%>
<%-- id 검색결과 --%>
<section class="tiles">
<c:forEach items="${requestScope.searchMemberList}" var="memberList">
	<article onclick="">
		<img id="profile_img" src="<%=path%>${memberList.profileImgPath}" alt="Cinque Terre" onerror="this.src='images/basic_profile.png';" >
		<a href="MemberDetailFormController.do?memberid=${memberList.memberId}" style="text-decoration:none">
			<font size="15px">${memberList.memberId}</font>
		</a>
		<hr>
	</article>
</c:forEach>
</section>

<%-- 포스트검색결과 --%>
<section class="tiles">

<c:forEach items="${requestScope.searchPostList}" var="postList" >
	<div>
	<article>
		<a href="PostDetailController.do?postId=${postList.postId}">
			<span class="image">
				<img src="images/${postList.orgImg}" alt=""/>
			</span>
		</a><br>
		<p id="main_font">${postList.postContent}</p>
	</article>
	</div>
</c:forEach>
</section>