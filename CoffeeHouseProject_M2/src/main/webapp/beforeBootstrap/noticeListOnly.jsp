<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chboard.*, java.sql.*, java.util.*, java.text.SimpleDateFormat"%>
    <%
	//웹상에서 로그인했는지 안 했는지 확인
	//session.setAttribute("idKey", mem_id); ->LoginProc.jsp를 거쳐서 왔는지?
	String mem_id=(String)session.getAttribute("idKey"); //Object이기 때문에 String으로 형변환 해줘야함
	System.out.println("noticeListOnly.jsp의 mem_id=>"+mem_id); //null이라면? ...
	%>
<!DOCTYPE html>
<%!
	int pageSize=10; //페이지당 보여주는 @@게시물 수@@
	int blockSize=10; //블럭당 보여주는 @@페이지 수@@
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<%
	String pageNum=request.getParameter("pageNum"); //이거 어디서 나온 놈임???
	if (pageNum==null) {
		pageNum="1"; //[4], [22], [6] 이런 것인듯
	}
	int currentPage=Integer.parseInt(pageNum); //
	int startRow=(currentPage-1)*pageSize+1;
	int endRow=currentPage*pageSize;
	
	int count=0; //총 레코드수
	int number=0; //페이지별로 시작하는 맨 처음에 나오는 게시물번호    맨 위 번호라는 소리???
	List<BoardDTO> articleList=null; //화면에 출력할 레코드를 저장할 변수
	
	BoardDAO dbPro=new BoardDAO(); //메서드 호출 위해서
	count=dbPro.getArticleCount(); //총 레코드 수 구하는 메서드 //select count(*) from chnoticeboard
	System.out.println("현재 레코드 수(count)=>"+count);
	if (count > 0) {
		articleList=dbPro.getArticles(startRow, pageSize); //첫번째 레코드 번호, 불러올 개수
		System.out.println("noticeListOnly.jsp의 articleList=>"+articleList);
	}
	
	number=count-(currentPage-1)*pageSize;
	System.out.println("페이지별 number=>"+number);
%>
<html>
<head>
<title>공지사항</title>
<link href="css/other.css?ver=1" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js?ver=1"></script>
</head>
<style>
* {
	vertical-align:center;
}
.noticetable {
	position:relative;
	top:100px;
	float:left;
	left:10%;
	display:inline-block;
	border:3px solid #f5ebe9;
	border-left:none; border-right:none; 
}
td {
	border-bottom:1px solid #f5ebe9; border-left:none; border-right:none; border-top:none;
	line-height:25px;
	padding-left:5px; padding-right:5px;
}
input {
	border:1px solid #6f5d58;
	line-height:20px;
	padding-left:5px;
}
.writebutton {
	position:relative;
	top:300px;
	z-index:1231;
	float:right;
	right:10%;
}
#table {
	position:relative;
}
/* #forPages {
	z-index:100;
	position:relative;
	text-align:center;
	float:left;
	border:1px solid red;
	top:600px;
} */
</style>
<body>

<br><br>

<center id="table">
<b>공지사항</b>
<!-- 데이터 유무 -->
<%if (count == 0) {%>
<table border="1" width="900" cellspacing="0" cellpadding="5" class="noticetable" align="center">
	<tr align="center">
		<td align="center">작성된 글이 없습니다.</td>
	</tr>
</table>
<%}else { %>
<table border="1" width="900" cellspacing="0" cellpadding="5" class="noticetable" align="center">
	<tr height="30">
		<td align="center" width="50">번호</td>
		<td align="center" width="550">제목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조회</td>
	</tr>
	<!-- 실질적으로 레코드를 출력시켜주는 부분 -->
	<%
		for (int i=0; i<articleList.size(); i++) {
			BoardDTO article=articleList.get(i);
	%>
	<tr height="30">
		<td align="center" width="50"><%=number--%></td>
		<td width="550">
		<!-- 답변글인 경우 먼저 답변 임지ㅣ를 부착시키는 코드 필요 -->
		<%
		int wid=0; //공백 계산 위한 변수 선언
		if (article.getRe_level() > 0) {
			wid=7*(article.getRe_level());
		%>
			<img src="img/level.gif" width="<%=wid%>" height="16">
			<img src="img/re.gif">
		<%}else { %>
			<img src="img/level.gif" width="<%=wid%>" height="16">
		<%} %> <!-- num, pageNum 꼭 같이 넘어감 -->
			<a href="content.jsp?num=<%=article.getNum()%>&pagenum=<%=currentPage%>"><%=article.getSubject()%></a>
			<%if (article.getReadcount() >= 20) {%>
			<img src="img/hot.gif" border="0" height="16">
			<%}%>
		</td>
		<td align="center" width="100"><%=article.getId()%></td>
		<td align="center" width="150"><%=sdf.format(article.getReg_date())%></td>
		<td align="center" width="50"><%=article.getReadcount()%></td>
	</tr>
<%} //for %>
</table>
<%} //데이터유무 else%>

<%-- <%if (mem_id=="admin") {%>
<table class="writebutton">
	<tr><td>
	
	<input type="button" value="글쓰기 " onclick="document.location='noticeWriteForm.jsp'" align="right" class="write">
	
	</td></tr>
</table>
<%}else if (mem_id==null || mem_id!="admin")  {%>
<table class="writebutton"><tr><td></td></tr></table>
<%} //글쓰기버튼 else if%> --%>



<!-- 페이징 처리 -->
<%
	if (count > 0) { //레코드 개수가 1 이상이라면
		//1. 총 페이지수 구하기
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		System.out.println("pageCount=>"+pageCount);
		//2. 시작페이지
		int startPage=0;
		if (currentPage%blockSize!=0) { //페이지가 1~9 등등 사이라면
			startPage=currentPage/blockSize*blockSize+1;
		}else {
			startPage=((currentPage/blockSize)-1)*blockSize+1; //대체 몬소리???????????
		}
		//종료페이지
		int endPage=startPage+blockSize-1;
		System.out.println("startPage=>"+startPage+", endPage=>"+endPage);
		//블럭별로 구분하고 링크 걸어서 출력 (마지막 페이지 > 총 페이지 수  면 안 되고 같아야 함)
		//11>10=>endPage=10
		if (endPage > pageCount) endPage=pageCount;
		System.out.println("endPage=pageCount 하고 나서의 endPage=>"+endPage);
		//1) 이전 블럭
		if (startPage > blockSize) {%>
		
		<a href="noticeListOnly.jsp?pageNum=<%=startPage-blockSize%>">[이전]</a>
	<%}
		//2) 현재 블럭
		for (int i=startPage; i<=endPage; i++) {%>
		<a href="noticeListOnly.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<%}
		//3) 다음 블럭
		if (endPage < pageCount) {%>
		<a href="noticeListOnly.jsp?pageNum=<%=startPage+blockSize%>">[다음]</a>
		
	<%	}
	}
	%>
</center>
<!-- <div class="writebutton">
	<input type="button" value="글쓰기 " onclick="document.location='noticeWriteForm.jsp'" align="right">
</div> -->
