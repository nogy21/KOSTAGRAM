<%@page import="org.kostagram.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="main">
    <div class="inner">
        <form action="ProfileUpdateController.do" method="post" enctype="multipart/form-data">
            <%
            String path = "images\\";
            %>
            <!-- img 태그의 src 속성이 context path로부터 시작함 -->
	        <img src="<%=path%>${sessionScope.loginVO.profileImgPath}" alt="${sessionScope.loginVO.profileImg}"/>
            파일: <input type="file" name="file"><br>
            <textarea rows="8" cols="50" name="introduce" placeholder="본인에 대해 소개해주세요">${sessionScope.loginVO.introduce}</textarea>
            <button type="reset">취소</button><br>
            <button>업로드</button><br>
        </form>
    </div><!-- inner -->
</div><!-- main -->