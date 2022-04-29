<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.Timestamp, chboard.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String mem_id=(String)session.getAttribute("idKey"); //Object이기 때문에 String으로 형변환 해줘야함
	String mem_passwd=(String)session.getAttribute("pwKey");
	System.out.println("noticeWriteProc.jsp의 mem_id=>"+mem_id); //null이라면? ...
%>
<jsp:useBean id="article" class="chboard.BoardDTO" />
<jsp:setProperty name="article" property="*" />
<%
	Timestamp temp=new Timestamp(System.currentTimeMillis()); //컴퓨터시간
	article.setReg_date(temp);
	
	BoardDAO dbPro=new BoardDAO();
	dbPro.insertArticle(article);
	response.sendRedirect("noticeList.jsp");

%>