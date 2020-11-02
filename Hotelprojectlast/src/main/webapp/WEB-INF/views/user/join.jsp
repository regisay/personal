<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
<title>HOTEL PROJECT</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ page import="com.hotel.biz.VO.MemberVO" %>
<%@ page import="com.hotel.biz.DAO.JoinDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/biz/resources/css/join.css" />
<style>
#btn{
left:110px;
}
#login{
left:-400px;
}
#register{
left:50px;
}
</style>
</head>
<body>
<% String success = (String)session.getAttribute("success"); %>
<% String fail = (String)session.getAttribute("fail"); %>
<script type="text/javascript">
function blankcheck(){
	
	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;
	var name = document.getElementById("name").value;
	var phone = document.getElementById("phone").value;
	var email = document.getElementById("email").value;
	var success = <%=success%>
	var fail = <%=fail%>
	
	console.log("function 테스트");
	console.log(fail);
	
	if(id == ""){
		
		alert("아이디를 입력해 주세요.");
		document.join.id.focus();
		return false;
		
	}
	if (pw == ""){
		
		alert("비밀번호를 입력해 주세요.");
		document.join.pw.focus();
		return false;
		
	}
	if (name == ""){
		
		alert("이름를 입력해 주세요.");
		document.join.name.focus();
		return false;
		
	}
	if (phone == ""){
		
		alert("전화번호를 입력해 주세요.");
		document.join.phone.focus();
		return false;
		
	}
	if (email == ""){
		
		alert("이메일를 입력해 주세요.");
		document.join.email.focus();
		return false;
		
	}
	
	if(fail =="1"){
		
		alert("사용하실 수 없는 아이디 입니다.");
		document.join.id.focus();
		return false;
		
	}
	
	
	
	
	alert(id+"님 환영합니다!");
	
	
}

function openIdChk(){
	
	
	var id = document.getElementById("id").value;
	console.log(id);
	
	if(id == ""){
		
		alert("아이디를 입력해주세요.");
		document.join.id.focus();
		
	}else {
		
	
	window.name = "parentForm";
	window.open("${pageContext.request.contextPath}/user/idCheck.do?id="+id,
			"chkForm","width=500, height=300, resizeable= no,");
	
	} 
	
}

function JoinChk(){
	
	var id = document.getElementById("id").value;
	console.log(id);
	
	window.name = "parentForm";
	window.open("${pageContext.request.contextPath}/user/JoinChk.do?id="+id,
			"chkForm","width=500, height=300, resizeable= no,");
	

	
	
}
</script>

<c:if test="${JoinChk eq 0 }">
<script language="javascript">

alert("사용할 수 있는 아이디 입니다.");

window.close();



</script>
</c:if>


<c:if test="${JoinChk eq 1 }">
<script language="javascript">

alert("사용할 수 없는 아이디 입니다.");

history.go(-1);

window.close();

</script>

</c:if>



<%@ include file="../include/header.jsp" %>
	<div class="page-wrap" content="width=device-width, initial-scale=1">

		<!-- Nav -->
		<!-- Main -->

			<!-- Banner -->

			<!-- Gallery -->


			<!-- Contact -->
			<section id="contact">
				<!-- Social -->


				<!-- Form -->
		<div class="wrap">
            <div class="form-wrap">
            <br>
                <h1 align="center">REGISTER</h1>
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="location.href='${pageContext.request.contextPath}/user/loginpage.do'">LOG IN</button>
                    <button type="button" class="togglebtn" onclick="location.href='${pageContext.request.contextPath}/user/joinpage.do'">REGISTER</button>
                </div>
                 <div class="social-icons">
                    <img src="/biz/resources/images/fb.png" alt="facebook">
                    <img src="/biz/resources/images/tw.png" alt="twitter">
                    <img src="/biz/resources/images/gl.png" alt="google">
                </div>                
                <form action="${pageContext.request.contextPath}/user/hoteljoin.do" onsubmit = 'return blankcheck()' name="join" id="join" method="post">
                    <input type="text" id="id" name="id" class="input-field1" placeholder="User name or Email" >
                    <button class="submit1" type="button" onclick="openIdChk()">중복확인</button> 
                    <input type="password" class="input-field1" placeholder="Enter Password" id="pw" name="pw">
                    <input name="name" class="input-field1" id="name" type="text" placeholder="Name">
                    <input name="phone" class="input-field1" id="phone" type="text" placeholder="Phone">
                    <input name="email" class="input-field1" id="email" type="text" placeholder="Email"> 
                    <button class="submit1">REGISTER</button>
                </form>
                
                
            </div>
        </div>
   <!--      <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            
            
            
            
            
            
        </script>
 -->
			</section>

			<!-- Footer -->

	</div>

	<!-- Scripts -->

</body>
</html>