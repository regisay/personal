<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<script type="text/javascript">
function check(){
	
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
	
		console.log(id);
		console.log(pw);
		
		if(confirm("정말 탈퇴하시겠습니까?")){
			
			console.log("확인");
			
			if(${loginChk.pw }!=pw){
				
				alert("잘못된 비밀번호 입니다.");
				
			} else {
				
				location.href="deleteuser.do?id="+id+'&pw='+pw;
				
			} 
		
		
	} else {
		
		console.log("아니요");
	
	}
	
}

</script>

<h1>회원 탈퇴</h1>

회원 탈퇴 하려면 아이디와 패스워드를 다시 입력하세요.
<br>
<br>
<input type="text" name="id" id="id" >
<input type="password" name="pw" id="pw">
<p><button type="submit" onclick="check()">회원 탈퇴</button></p>
<p><button type="submit" onclick="location.href='mypageP.do'">취소</button></p>


</body>
</html>