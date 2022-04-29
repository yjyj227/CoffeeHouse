<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.Timestamp, chboard.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="article" class="chboard.BoardDTO" />
<jsp:setProperty name="article" property="*" />
<%
	String pageNum=request.getParameter("pageNum");

	BoardDAO dbPro=new BoardDAO();
	int check=dbPro.updateArticle(article);
	if (check==1) {
%>
<meta http-equiv="Refresh" content="0;url=NoticeList.jsp?pageNum=<%=pageNum%>">
<%}else {%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
<%}%>