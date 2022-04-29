<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chhewon.MemberDAO"%>
<%
	//소스를 변경해도 바로 반영이 안 되는 이유->서버에서 기본적으로 전의 페이지를 불러오기 때문
	response.setHeader("Cache-Control", "no-cache"); //요청시 메모리에 저장X
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0); //보관기간 0->보관하지 마라
%>
<%
	//script.js(idCheck(id))->IdCheck.jsp?mem_id='nup'
	String mem_id=request.getParameter("mem_id");
	System.out.println("IdCheck.jsp의 mem_id=>"+mem_id);
	MemberDAO memMgr=new MemberDAO();
	boolean check=memMgr.checkId(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 체크</title>
</head>
<body>
<br>
<center>
<b><%=mem_id %></b>
<%
	if (check) { //이미 아이디가 존재
		out.println("는 이미 존재하는 아이디입니다.<p>");
	}else { //false->존재하는 아이디가 아님
		out.println("는 사용 가능한 아이디입니다.<p>");
	}
%>
<a href="#" onclick="self.close()">닫기</a><!-- self(열려있는 창을 가리킴) -->
</center>
</body>
</html>