<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = "images\\";
%>
<%-- id 검색결과 --%>
<div class="row">
<div class="col-sm-4">
</div>
<div class="col-sm-4">
<c:forEach items="${requestScope.searchMemberList}" var="memberList">
	<article onclick="">
		<img id="profile_img" src="<%=path%>${memberList.profileImgPath}" alt="Cinque Terre" onerror="this.src='images/basic_profile.png';" >
		<a href="MemberDetailFormController.do?memberid=${memberList.memberId}" style="text-decoration:none">
			<font size="15px">${memberList.memberId}</font>
		</a>
		<hr>
	</article>
</c:forEach>
</div>
</div>


<%-- 포스트검색결과 --%>

<div class="row">
<div class="col-sm-4">
</div>
<div class="col-sm-4">
<c:forEach items="${requestScope.searchPostList}" var="postList" >
	<div>
	<img id="profile_img" src="<%=path%>${postList.memberVO.profileImgPath}" alt="Cinque Terre" onerror="this.src='images/basic_profile.png'">
				<a href="MemberDetailFormController.do?memberid=${postList.memberVO.memberId }" style="text-decoration:none">
				<font size="15px">${postList.memberVO.memberId }</font>
				</a>
				<hr>
		<a href="PostDetailController.do?postId=${postList.postId}">
			<span class="image">
				<img id="content_img" src="images/${postList.orgImg}" alt=""/>
			</span>
		</a><br>
		<p id="main_font">${postList.postContent}</p>
		<hr>
	</div>
</c:forEach>
</div>
<div class="col-sm-4"></div>
</div>