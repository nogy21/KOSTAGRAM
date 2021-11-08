<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Main -->
<div id="main">
    <div class="inner">
        <h2>회원가입</h2>
        
        <script type="text/javascript">
            function checkId() {
                let memberId = document.getElementById("memberId").value;    
                
                if(memberId == ""){
                    alert("아이디를 입력하세요!");
                    return;
                }
                let xhr = new XMLHttpRequest();
                xhr.onload = function() {
                    document.getElementById("idCheckNotice").innerHTML = xhr.responseText;
                    /*
                    if(result.equals("아이디 중복되어 사용불가합니다")) {
                        document.getElementById("memberId").value = "";
                        document.getElementById("memberId").focus();
                    }else {
                    	document.getElementById("flag").value = document.getElementById("memberId").value;
                    }
                    */
                    document.getElementById("flag").value = document.getElementById("memberId").value;
                }
                xhr.open("get", "IdCheckController.do?memberId=" + memberId);
                xhr.send();
                //xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                //xhr.send("id=" + memberId);
                
            }
            // 아이디 중복확인하지 않은 상태에서 가입하기를 누르면 아이디 중복확인하세요 alert 후 전송시키지 않는다 
            function checkForm(){
                if(document.getElementById("memberId").value!=document.getElementById("flag").value){
                    alert("아이디 중복확인하세요");
                    return false;
                }
                if(xhr.responseText == "아이디 중복되어 사용불가합니다") {
                    document.getElementById("memberId").value = "";
                }
            }
        </script>
        
        <form action="RegisterController.do" method="post" onsubmit="return checkForm()">
			<%-- 아이디 중복확인 여부를 저장하는 hidden --%>
			<input type="hidden" id="flag" value="">
			<input type="text" name="memberId" id="memberId" required="required" placeholder="아이디">
			<button type="button" onclick="checkId()">중복확인</button>
			<span id="idCheckNotice"></span><br><br>
			
			<input type="password" name="password" required="required" placeholder="패스워드"><br><br>
			<input type="text" name="email" required="required" placeholder="이메일"><br><br>
			<input type="text" name="name" required="required" placeholder="이름"><br><br>
			
			<button type="submit">가입하기</button>
        </form>
    </div>
</div>











