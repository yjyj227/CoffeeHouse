<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chhewon.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mem" class="chhewon.MemberDTO" />
<jsp:setProperty name="mem" property="*" />
<%
	MemberDAO memMgr=new MemberDAO();
	boolean check=memMgr.memberInsert(mem);
%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 완료</title>
<link href="css/other.css?ver=1" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="script.js?ver=1">
</SCRIPT>
</head>
<body>
	<%if (check) {//회원가입 성공했다면%>
	<script>
		alert("회원가입이 완료되었습니다. 로그인 후 이용해주세요.");
		location.href="Login.jsp";
	</script>
	<%}else {//회원가입 실패했다면%>
	<script>
		alert("다시 시도해주십시오.");
		document.location="Register.jsp";
	</script>
	<%}%>
</body>
</html>