<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<header id="header">
	<c:choose>
		<c:when test="${sessionScope.loginVO==null}">
				<div align="right">
					<button class="btn-test" onclick="location.href='LoginFormController.do'">로그인</button>
					<button class="btn-test" onclick="location.href='RegisterFormController.do'">회원가입</button>
				</div>
		</c:when>
		<c:otherwise>
			<div align="right">
			<a href =>
				<img src="images/post-update.png" width="55" height="35" alt="글쓰기" />
			</a>&nbsp;&nbsp;
			<a href ="MemberDetailFormController.do?memberid=${sessionScope.loginVO.memberId}">
				<img src="images/myinfo.png" width="40" height="40" alt="마이페이지" />
			</a>&nbsp;&nbsp;
			<a href ="UpdateMemberFormController.do" style="text-decoration:none">
				<img src="images/setting.png" width="50" height="50" alt="회원정보수정" />
			</a>&nbsp;&nbsp;
			<a href ="javascript:logout()" style="text-decoration:none">
				 <img src="images/logout2.png" width="50" height="40" alt="로그아웃" />&nbsp;&nbsp;
			</a>
        		<form action="LogoutController.do" method="post" id="logoutForm"></form>
				</div>
		</c:otherwise>
	</c:choose>
	<!-- Logo -->
	<a href="MainController.do" class="logo"> <span class="symbol">
			<img src="images/logo4.png" alt="" />
	</span> <span class="title">KOSTAGRAM</span>
	</a>
	
	<!--  Search -->
	<script type="text/javascript">
		function searchCheck() {
			if(document.getElementById("searchWord").value=="") {
				alert("검색어를 입력하세요!");
			} else {
				document.getElementById("searchForm").submit();
			}
		}
	</script>
	<form id="searchForm" name="searchForm" action="SearchController.do" method="get">
		<div align="center">
			<input type="text" id="searchWord" name="searchWord" placeholder="Search" size="30" style="height: 40px">
			<button type="button" class="btn-test" onclick="searchCheck()">검색</button>
		</div>
	</form>
	<hr>
</header>
<script>
            function logout(){
                let rst = confirm("로그아웃하시겠습니까?");
                if (rst) {
                    document.getElementById("logoutForm").submit();
                }
            }
        </script>
