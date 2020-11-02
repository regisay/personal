<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>    
<!DOCTYPE html>
<html>
    <head>
        <title>로그인</title>
        <link rel="stylesheet" href="/biz/resources/css/join.css" />
    </head>
    <body>
    <script>
    /* 비밀번호 체크  */
    function openIdChk(){
    	
    	var id = document.getElementById("id").value;
    	console.log(id);
    	window.name = "parentForm";
    	window.open("${pageContext.request.contextPath}/user/idCheck.do?id="+id,
    			"chkForm","width=500, height=300, resizeable= no,");
    }
    
    </script>
    
	<% String pw = (String)session.getAttribute("pw"); %>
	<% String pwchk = (String)session.getAttribute("pwchk"); %>
	<section id="contact">
        <div class="wrap">
            <div class="form-wrap">
            	<br>
                <h1 align="center">LOG IN</h1>
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="location.href='${pageContext.request.contextPath}/login/loginpage.do'">LOG IN</button>
                    <button type="button" class="togglebtn" onclick="location.href='${pageContext.request.contextPath}/user/joinpage.do'">REGISTER</button>
                </div>
                <div class="social-icons">
                    <img src="/biz/resources/images/fb.png" alt="facebook">
                    <img src="/biz/resources/images/tw.png" alt="twitter">
                    <img src="/biz/resources/images/gl.png" alt="google">
                </div>
                <form action="${pageContext.request.contextPath}/user/login.do" class="input-group" name="login" id="login" method="POST">
                    <input type="text" class="input-field" placeholder="User name or Email" id="id" name="id">
                    <input type="password" class="input-field" placeholder="Enter Password" id="pw" name="pw">
                    <c:if test = "${pwchk eq null }">
                    <script language="javascript">
					alert("아이디와 비밀번호를 확인해주세요.");
					</script>
                    </c:if>
                    <button class="submit" >Login</button>
                </form>
                
                
            </div>
        </div>
        <script>
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
        </section>
    </body>
</html>