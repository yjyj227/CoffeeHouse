<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chhewon.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<title>회원가입 완료</title>
<link href="css/other.css?ver=1" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="script.js?ver=1">
</SCRIPT>
</head>
<body>

<c:set var="check" value="${requestScope.check}" />
<c:choose>
	<c:when test="${check==true}">
	<script>
		alert("회원가입이 완료되었습니다. 로그인 후 이용해주세요.");
		location.href="Login.do";
	</script>
	</c:when>
	<c:otherwise>
	<script>
		alert("다시 시도해주십시오.");
		document.location="Register.do";
	</script>
	</c:otherwise>
</c:choose>
	
	
</body>
</html>