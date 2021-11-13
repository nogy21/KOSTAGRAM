<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Generic Page</h1>
<span class="image main"><img src="images/pic13.jpg" alt="" /></span>
<pre><font size="4">${postVO.content}</font></pre>
<c:if test="${requestScope.postVO.memberVO.id==sessionScope.memberVO.id}">
	<td colspan="5" class="text-center"><script type="text/javascript">
		function deletePost() {
			if (confirm("삭제하시겠습니까?"))
				document.getElementById("deleteForm").submit();
		}
		function updatePost() {
			if (confirm("수정하시겠습니까?"))
				document.getElementById("updateForm").submit();
		}
	</script>
	<form action="DeletePostController.do" id="deleteForm" method="post">
		<input type="hidden" name="no" value="${postVO.no}">
	</form>
	<form action="UpdatePostFormController.do" id="updateForm" method="post">
		<input type="hidden" name="no" value="${postVO.no}">
	</form>
	<button type="button" class="button btn-success" onclick="updatePost()">수정</button>
	<button type="button" class="button btn-success" onclick="deletePost()">삭제</button>
</c:if>