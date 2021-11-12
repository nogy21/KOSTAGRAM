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

	<!-- Wrapper -->

		<!-- Main -->
		<div id="main">
			<div class="inner" style="bgcolor:'white'" id="detail_div">
				<table id="detail_img">
					<tr>
						<td>
							<img id="profile_img" src="images/${requestScope.memberVO.profileImgPath }" alt="Cinque Terre" onerror="this.src='images/basic_profile.png'">
							<font id="profile_name">${requestScope.memberVO.memberId }</font>
						</td>
					</tr>
				</table>
				<span class="image main" id="detail_img">
					<hr>
					<img src="images/${requestScope.postVO.orgImg }" alt="" />
						<br><p>${requestScope.postVO.postDate }</p>
						
						<table id ="like_table">
							<tr>
								<td>
									<c:choose>
										<c:when test="${requestScope.isLiked == false }">
											<a onclick="likeAjax()"><img id="heart" src="images/empty_heart.png"></a>
										</c:when>
										<c:otherwise>
											<a onclick="likeAjax()"><img id="heart" src="images/likes_heart.png"></a>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<font>좋아요</font>
								</td>
								<td>
									<font id="countLikes">${requestScope.likeCount }</font>&nbsp;개
								</td>
							</tr>
						</table>
					<font>${requestScope.postVO.postContent }</font>
				</span>
			</div>
		</div>
	

