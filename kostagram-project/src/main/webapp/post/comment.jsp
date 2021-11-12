<%@page import="org.kostagram.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.kostagram.model.CommentVO"%>
<%@page import="org.kostagram.model.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 
1. 해당 포스트 번호와 일치하는 댓글이 존재하면 리스트로 반환
2. 리스트의 댓글 중 작성자는 자신의 댓글 삭제 가능
3. 리스트 아래에 댓글 작성 폼 제공
4. 초기 로딩, 댓글 삭제, 댓글 등록 시 댓글 리스트를 새롭게 가져와서 보여줌
 -->
<hr>
<!-- 댓글 리스트 출력 -->
<div id="comment-list">
</div>

<!-- 댓글 삭제 -->
<div id="comment_delete">
    <script>
        function deleteComment(){
            let rst = confirm("해당 댓글을 삭제하시겠습니까?");
            if (rst) {
                var cmtPostId = "${requestScope.postVO.postId}";
                document.getElementById("hid-postId").setAttribute("value",cmtPostId);
                document.getElementById("CommentDeleteForm").submit();
            }
        }
    </script>
    <form action="CommentDeleteController.do" method="post" id="CommentDeleteForm" name="CommentDeleteForm">
        <input type="hidden" name="deleteCommentForm" value="" id="hid">
        <input type="hidden" name="delCmtPostId" value="" id="hid-postId">
    </form>
</div>

<!-- 댓글 작성 폼 -->
<div>
    <textarea rows="1" cols="50" name="writeComment" class="form-control" id="writeComment" placeholder="댓글 달기..."></textarea><br>
    <div class="btn-rapper" style="text-align: right">
        <button type="button" class="btn btn-outline-dark" id="writeComment-btn" onclick="writeCommentFn()">작성</button>
    </div>
</div>
<hr>

<script>
    // 초기 페이지 로딩시 댓글 불러오기
    getCommentList();
	// 댓글 등록
	function writeCommentFn(){
	    // 댓글창이 공백일 경우
	    if ($.trim($("#writeComment").val()) == "") {
	        alert("댓글을 입력해주세요");
	        $("#writeComment").focus();
	        return;
	    }
	    // Ajax 
        var params = "postId=" + ${requestScope.postVO.postId} + "&commentContent=" + $("#writeComment").val();
	    $.ajax({
	        type: "POST",
	        url: "CommentWriteController.do",
	        data: params,
	        success : function() {
	            $("#writeComment").val("");
	            getCommentList();
	        },
	        error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
        });
	}
    function getCommentList(){
	    $.ajax({
	        type: "GET",
	        url: "CommentGetListController.do",
	        data: "postId=${requestScope.postVO.postId}",
	        dataType: "json",
	        success : function(cmtList){
	            var html = "";
	            var mid = '${sessionScope.loginVO.memberId}';
	            var hid = $('#hid');
	            if(cmtList.length > 0){
	                for(i=0; i<cmtList.length; i++){
	                    html += "<div><table class='table table-sm'><tbody><tr><td><img src='images//'"+cmtList[i].memberVO.profileImgPath+" alt=''/>";
	                    html += cmtList[i].memberVO.memberId + "</td></tr></tbody>";
	                    html += "<tr><td>" + cmtList[i].commentContent;
                        if(cmtList[i].memberVO.memberId==mid) {
                            html += "<div align=right><a href='javascript:deleteComment()'>삭제</a>&nbsp;</div>";
                            hid.attr('value',cmtList[i].commentId);
                        }
	                    html += "</td></tr></table></div><br>";
	                }
	            } else {
	                html += "<div>";
	                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
	                html += "</table></div>";
	                html += "</div>";
	            }
	            $("#comment-list").html(html);
	        }, error:function(request,status,error){
 	            //alert("fail");
 	            console.log("에러를 확인하세요.");
	        }
	    });
    }
</script>