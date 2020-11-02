<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${JoinChk eq 0 }">
<script language="javascript">

alert("환영합니다!");

window.close();

</script>

</c:if>

<c:if test="${JoinChk eq 1 }">
<script language="javascript">

alert("중복체크를 해주세요.");

window.close();

</script>

</c:if>

</body>
</html>