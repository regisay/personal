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

<script type="text/javascript">
function blankcheck(){
	
	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;
	var name = document.getElementById("name").value;
	var phone = document.getElementById("phone").value;
	var email = document.getElementById("email").value;
	
	console.log("function 테스트");
	console.log(id);
	
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
	
	alert(ID+"님 환영합니다!");
	
	
}

function openIdChk(){
	
	var id = document.getElementById("id").value;
	console.log(id);
	
	window.name = "parentForm";
	window.open("${pageContext.request.contextPath}/user/idCheck.do?id="+id,
			"chkForm","width=500, height=300, resizeable= no,");
	
	
}

function JoinChk(){
	
	var id = document.getElementById("id").value;
	console.log(id);
	
	window.name = "parentForm";
	window.open("${pageContext.request.contextPath}/user/JoinChk.do?id="+id,
			"chkForm","width=500, height=300, resizeable= no,");
	

	
	
}

function updatealert(){
	
	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;

	console.log(id);
	console.log(pw);
	
	confirm("수정하시겠습니까?");
	
	if(confirm == true){
		
		return true;
		
	}else {
		
		return false;
		
	}
	

}

function deletealert(){

var id = document.getElementById("id").value;
/* var PW = document.getElementById("PW").value; */
var pw = prompt('비밀번호를 입력해주세요','');

console.log(id);
console.log(pw);

if(pw==${loginChk.pw}){
	
	if(confirm("정말 탈퇴하시겠습니까?") == true){
		
	
	/* location.href="deleteuser.do";
	 */
	
	}else {
		
		alert("마이페이지로 이동합니다.");
		location.href="mypageP.do";
		
	}
	

}else {
	
	alert("잘못된 비밀번호 입니다.");
	location.href="mypageP.do";
	
}

} 





</script>

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
 <h1 align="center">MYPAGE</h1>
 <div class="button-wrap">
 <div id="btn"></div>
 </div>
 <div class="social-icons">
</div>                
    <form action="${pageContext.request.contextPath}/user/updateuser.do" name="join" id="join" onsubmit = 'return blankcheck()' method="post">
	    <input type="text" class="input-field1"  value=${loginChk.id } name="id" id="id" placeholder=${loginChk.id } readonly>
		<input type="password" class="input-field1" value=${loginChk.pw }  name="pw" id="pw" >
		<input type="text" class="input-field1" value=${loginChk.name } name="name" id="name" placeholder=${loginChk.name } readonly>
		<input type="text" class="input-field1" value=${loginChk.email } name="email" id="email" placeholder=${loginChk.email }>
		<input type="text" class="input-field1" value=${loginChk.phone } name="phone" id="phone" placeholder=${loginChk.phone }>
	<input class="submit1" type="submit" onclick='updatealert()' value="개인정보수정">

	</form>
		<form action="${pageContext.request.contextPath}/user/deleteuser.do" method="get">
		<input class="submit1" type="submit" onclick='deletealert()' value="회원탈퇴" >
	</form>
   </div>
    </div>
<script>
        
    function blankcheck(){
	
	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;
	var name = document.getElementById("name").value;
	var phone = document.getElementById("phone").value;
	var email = document.getElementById("email").value;
	
	console.log("function 테스트");
	console.log(id);
	
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
    
	
	
	
	

        </script>

			</section>

			<!-- Footer -->

	</div>

	<!-- Scripts -->

</body>
</html>