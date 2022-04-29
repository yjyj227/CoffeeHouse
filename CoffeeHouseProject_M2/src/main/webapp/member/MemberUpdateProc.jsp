<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chhewon.MemberDAO"%>
<%
	//request.setCharacterEncoding("utf-8");
%>

<%
	//String mem_id=request.getParameter("mem_id");
	//System.out.println("MemberUpdateProc.jsp의 mem_id=>"+mem_id);
	//-----------------------------------------------------------
	//MemberDAO memMgr=new MemberDAO();
	//boolean check=memMgr.memberUpdate(mem); //회원수정 메서드 호출
	//System.out.println("MemberUpdateProc.jsp의 회원수정유무(check)=>"+check);
	
%>
<html>
<head>
</head>
<body>
<c:set var="check" value="${requestScope.check}" />
<c:choose>
	<c:when test="${check==true}">
	<script>
		alert("회원정보 수정이 완료되었습니다.");
		location.href="Main.do";
	</script>
	</c:when>
	<c:otherwise>
	<script>
		alert("다시 시도해주십시오.");
		history.back();
	</script>
	</c:otherwise>
</c:choose>
</body>
</html>