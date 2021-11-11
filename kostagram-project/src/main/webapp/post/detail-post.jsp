<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%-- Post 작성자 Id와 Login Id 비교하여 같은 경우에 수정,삭제 버튼 생성 --%>
	<c:if test="${requestScope.postVO.memberId==sessionScope.loginVO.memberId}">
		<script type="text/javascript">
			function likeAjax() {
				let memberId = "${sessionScope.loginVO.memberId}";
				let postId= "${requestScope.postVO.postId}";
				
				let xhr= new XMLHttpRequest();		
				
				xhr.onload=function() {
					
					let isLike = xhr.responseText.substring(1,6);
					let countLikes = xhr.responseText.substring(8,xhr.responseText.length-1);
					
					if(isLike=="좋아요추가") {
						document.getElementById("heart").setAttribute("src","images/likes_heart.png");
						document.getElementById("countLikes").innerHTML=countLikes;
					}else if(isLike=="좋아요취소") {
						document.getElementById("heart").setAttribute("src", "images/empty_heart.png");
						document.getElementById("countLikes").innerHTML=countLikes;
					}
				}
				xhr.open("post","LikesController.do");
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xhr.send("memberId="+memberId+"&postId="+postId);
			}		
		
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



