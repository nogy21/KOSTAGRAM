<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Main -->
<div id="main">
    <div class="row">
        <div class="col-sm-3">
            <div class="menu_sticky">
                <h2>팔로우 추천</h2>
                <nav class="navbar bg-light">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">여기에는</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">무엇을</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">해야하죠</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="col-sm-6">
            <c:forEach items="${requestScope.postList }" var="post">
                <section class="tiles" onclick="location.href='PostDetailController.do?postId=${post.postId}'">
                    <article onclick="">
                        <table>
                            <tr>
                                <td rowspan="3"><img id="profile_img" src="images/profiletest.png" alt="Cinque Terre" onerror="this.src='images/basic_profile.png'"></td>
                                <td><font id="profile_name">${post.memberId }</font></td>
                            </tr>
                            <tr>
                                
                            </tr>
                        </table>
                        <span class="image"> <img src="images/${post.orgImg }" alt="" />
                        </span> <a href="PostDetailController.do?postId=${post.postId}"> </a><br>
                        <p id="main_font">${post.postDate } | 좋아요 ♡ 3개</p>
                        <p id="main_font">${post.postContent }</p>
                    </article>
                </section>
            </c:forEach>
        </div>
        <div class="col-sm-3">
            <div class="menu_sticky">
                <h2>Menu</h2>
                <nav class="navbar bg-light">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">회원정보수정</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">글쓰기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">아무것도 안하기</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
