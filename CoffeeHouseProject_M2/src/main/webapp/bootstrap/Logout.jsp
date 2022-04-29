<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션 연결상탵=>바로 종료=>메모리상의 데이터를 삭제
session.invalidate();
%>
<script>
	alert("정상적으로 로그아웃되었습니다.");
	location.href="Main.jsp"; //location.href="경로 포함해서 이동할 페이지명";
</script>