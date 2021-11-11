<%@page import="org.kostagram.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function modifyCheck() {
		if(document.getElementById("postContent").value==document.getElementById("updatePostContent").value) {
			alert("수정할 내용이 없습니다.");
		} else {
			document.getElementById("updatePostForm").submit();
		}
	}
	function cancel() {
		if (confirm("취소하시겠습니까?")==true) {
			history.back();
		}
	}
</script>
<div align="center">
<form id="updatePostForm" action="UpdatePostController.do" method="post">
    <%
    String path = "images\\";
    %>
    <!-- img 태그의 src 속성이 context path로부터 시작함 -->
    <img src="<%=path%>${requestScope.postVO.orgImg}" alt=""/><br><br>
    <input type="hidden" name="postId" value="${postVO.postId}">
    <input type="hidden" id="postContent" name="postContent" value="${requestScope.postVO.postContent}">
    <textarea rows="8" cols="50" id="updatePostContent" name="postUpdateContent" placeholder="수정할 내용을 입력하세요">${requestScope.postVO.postContent}</textarea><br>
    <button class="btn-test" type="button" onclick="modifyCheck()">수정</button>
    <button class="btn-test" type="button" onclick="cancel()">취소</button><br>
</form>
</div>
 