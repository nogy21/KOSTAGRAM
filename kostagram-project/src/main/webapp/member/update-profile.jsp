<%@page import="org.kostagram.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="main">
    <div class="inner">
        <form action="ProfileUpdateController.do" method="post" enctype="multipart/form-data">
            <!--
                테스트용 로그인 정보 할당 
            -->
            <%
            MemberVO mvo = new MemberVO();
            mvo.setMemberId("test");
            mvo.setIntroduce("테스트 자기소개");
            session.setAttribute("loginVO", mvo);
            %>
            <img alt="" src="">
            <input type="text" placeholder="${sessionScope.loginVO.memberId}" readonly="readonly">
            파일: <input type="file" name="file"><br>
            <textarea rows="8" cols="50" name="introduce">${sessionScope.loginVO.introduce}</textarea>
            <button type="reset">취소</button><br>
            <button>업로드</button><br>
        </form>
    </div><!-- inner -->
</div><!-- main -->