<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chboard.*"%>

<%
	String pageNum=request.getParameter("pageNum"); //hidden
	//추가
	String passwd=request.getParameter("passwd"); //입력O //이제 필요 없을듯
	int num=Integer.parseInt(request.getParameter("num"));
	System.out.println("NoticeDeleteProc.jsp의 num=>"+num+", passwd=>"+passwd+", pageNum=>"+pageNum);
	
	BoardDAO dbPro=new BoardDAO();
	
	int check=dbPro.deleteArticle(num, passwd);
	if (check==1) { //글삭제 성공했다면
%>
<meta http-equiv="Refresh"
	  content="0;url=NoticeList.jsp?pageNum=<%=pageNum%>">

<%}else { %>
	<script>
	  alert("다시 시도해주십시오.");
	  history.go(-1);
	</script>
<%} %>
	  
	  