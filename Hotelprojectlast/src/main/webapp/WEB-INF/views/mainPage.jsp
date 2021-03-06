<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
  <meta charset="utf-8" />
  <title></title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <link rel="stylesheet" href="resources/css/mainPage.css" />
</head>
<div class="btn">
  <span class="fas fa-bars"></span>
</div>
<nav class="sidebar">
  <div class="text">
    텍스트 입력 </div>
  <ul>
    <li class="active"><a href="#">HOME</a></li>
    <li>
      <a href="#" class="feat-btn">커뮤니티
        <span class="fas fa-caret-down first"></span>
      </a>
      <ul class="feat-show">
        <li><a href="#">공지사항</a></li>
        <li><a href="${pageContext.request.contextPath}/board/list.do">게시판</a></li>
      </ul>
    </li>
    <li>
      <a href="#" class="serv-btn">객실 예약
        <span class="fas fa-caret-down second"></span>
      </a>
      <ul class="serv-show">
        <li><a href="#">App Design</a></li>
        <li><a href="#">Web Design</a></li>
      </ul>
    </li>
    <li><a href="#">gallery</a></li>
    <li><a href="#">호텔 소개</a></li>
    <li><a href="#">오시는 길</a></li>
    <li><a href="#">AdminPage</a></li>
    <div class="loginbtn">
      <div style="float: left; margin-left: 29px;">
        <button type="button" class="btn-pill" onclick="location.href='${pageContext.request.contextPath}/user/loginpage.do'"><span>Login</span></button>
      </div>
      <div style="float: left; margin-left: 28px;">
        <button type="button" class="btn-pill" onclick="location.href='${pageContext.request.contextPath}/user/joinpage.do'"> <span>회원가입</span></button>
      </div>
    </div>
  </ul>
</nav>
<div class="content">

 <p>${login.ID}</p>
 <p>${login.m_num}</p>
 <p>${login.phone}</p>
  <section>

</section>
</div>


<script>
  $('.btn').click(function () {
    $(this).toggleClass("click");
    console.log("click")
    $('.sidebar').toggleClass("show");
    $('.content').toggleClass("move");
  });

  $('.feat-btn').click(function () {
    $('nav ul .feat-show').toggleClass("show");
    $('nav ul .first').toggleClass("rotate");
  });
  $('.serv-btn').click(function () {
    $('nav ul .serv-show').toggleClass("show1");
    $('nav ul .second').toggleClass("rotate");
  });
  $('nav ul li').click(function () {
    $(this).addClass("active").siblings().removeClass("active");
  });

</script>

</body>

</html>