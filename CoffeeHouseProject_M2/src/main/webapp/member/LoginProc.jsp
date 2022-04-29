<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chhewon.MemberDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
<c:set var="loginCheck" value="${requestScope.loginCheck}" />

<c:choose>
	<c:when test="${loginCheck==true}">
		<c:set var="idKey" value="${requestScope.mem_id}" scope="session" />
		<c:set var="pwKey" value="${requestScope.mem_passwd}" scope="session" />
		<meta http-equiv="Refresh" content="0;url=Main.do">
	</c:when>
	<c:otherwise>
		<script>
	    	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	    </script>
	    <meta http-equiv="Refresh" content="0;url=Login.do">
    </c:otherwise>
</c:choose>

<%-- <%
    //Login.jsp->LoginProc.jsp->LoginSuccess.jsp
    String mem_id=request.getParameter("mem_id");
    String mem_passwd=request.getParameter("mem_passwd");
    System.out.println("mem_id=>"+mem_id+", mem_passwd=>"+mem_passwd);
    //->member->MemberDAO객체필요->loginCheck()
    MemberDAO memMgr=new MemberDAO();
    boolean check=memMgr.loginCheck(mem_id, mem_passwd);
    System.out.println("LoginProc.jsp의 check=>"+check);
    %>
    <%
    //check->LoginSuccess.jsp(인증화면), LogError.jsp(에러메시지)
    if (check) { //if(check==true) //인증성공
    	session.setAttribute("idKey", mem_id); //id값을 서버에 저장하기 위해 session처리를 한 것
    	session.setAttribute("pwKey", mem_passwd); //글에 넣기 위해 서버에 저장
    	//response.sendRedirect("LoginSuccess.jsp"); //단순히 페이지 이동(공유X)
    	response.sendRedirect("Main.jsp");
    	//history.go(-2);
    }else { //id==null%>
    <script>
    	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
    	location.href="Login.jsp";
    </script>
    <%}%> --%>