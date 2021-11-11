<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<h1>Generic Page</h1>
				<span class="image main"><img src="images/${requestScope.postVO.orgImg }" alt="" /></span>
				<p>${requestScope.postVO.postContent }</p>
				<c:import url="post/comment.jsp"/>
			</div>
		</div>
	
	<%-- Post 작성자 Id와 Login Id 비교하여 같은 경우에 수정,삭제 버튼 생성 --%>
	<c:if test="${requestScope.postVO.memberId==sessionScope.loginVO.memberId}">
		<script type="text/javascript">
			function deletePost() {
				if(confirm("삭제하시겠습니까?"))
					document.getElementById("deleteForm").submit();
			}
			function updatePost() {
				if(confirm("수정하시겠습니까?"))
					document.getElementById("updateForm").submit();
			}
		</script>
		
		<form action="UpdatePostFormController.do" id="updateForm" method="post">
			<input type="hidden" name="postId" value="${postVO.postId}">
		</form>
		<form action="DeletePostController.do" id="deleteForm" method="post">
			<input type="hidden" name="postId" value="${postVO.postId}">
		</form>
		<button type="button" class="btn-test" onclick="updatePost()">수정</button>
		<button type="button" class="btn-test" onclick="deletePost()">삭제</button>
	</c:if>
