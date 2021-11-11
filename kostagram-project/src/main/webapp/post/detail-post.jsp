<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</script>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner" style="bgcolor:'white'">
				<h1>Generic Page</h1>
				<span class="image main"><img src="images/${requestScope.postVO.orgImg }" alt="" /></span>
				<p>${requestScope.postVO.postContent }</p>
			</div>
		</div>
	</div>
	
	
	<form id="like_form"> <table id="list">
	 <!-- <input type="hidden" name="command" value="like_it"> -->
	 <!-- 좋아요누를게시물 -->
	  <input type="hidden" name="post" value="${requestScope.postVO.postId}">
	   <tr>
	   <button type="button" value="좋아요" onclick="likeAjax()">좋아요</button>
	   <img id="heart" src="images/empty_heart.png">
	   <p id="countLikes"></p>
	   </tr>
	   </table> </form>

	  