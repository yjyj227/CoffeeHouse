<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chboard.*, java.util.*, java.text.SimpleDateFormat"%>
    <%
	//웹상에서 로그인했는지 안 했는지 확인
	//session.setAttribute("idKey", mem_id); ->LoginProc.jsp를 거쳐서 왔는지?
	String mem_id=(String)session.getAttribute("idKey"); //Object이기 때문에 String으로 형변환 해줘야함
	System.out.println("noticeList.jsp의 mem_id=>"+mem_id); //null이라면? ...
	%>
<!DOCTYPE html>
<%!
	int pageSize=10; //페이지당 보여주는 @@게시물 수@@
	int blockSize=10; //블럭당 보여주는 @@페이지 수@@
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<%
	String pageNum=request.getParameter("pageNum");
	if (pageNum==null) {
		pageNum="1";
	}
	int currentPage=Integer.parseInt(pageNum);
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
		System.out.println("noticeList.jsp의 articleList=>"+articleList);
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
	top:120px;
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
#table {
	position:relative;
}
/* #forPages {
	z-index:100;
	position:relative;
	text-align:center;
	border:1px solid red;
	top:470px;
	
	left: 0%;
	transform: translateX(-50%);
} */
#forPages {
	z-index:100;
	position:relative;
	display:table;
	text-align:center;
	top:470px;
	float:left;
	left:-34%;
	
}
#forPages a {
	position:relative;
	display:table-cell;
	vertical-align:middle;
	
}
.writebutton {
	position:relative;
	top:470px;
	z-index:1231;
	float:right;
	right:10%;
}
.noti {
	position:relative;
	top:100px;
	left:-15px;
}
</style>
<body>
<!-- ????? -->
<div class="topbg"></div>
  <div class="wrap"> <!-- 본문 내용 전체를 묶어주는 영역 -->
  	<header class="hd1">
		<h1><a href="main.jsp" class="logo"><img src="img/bgxlogo250.png" alt="coffeehouse" width="250px" height="100px" border="1"></a></h1>
		<nav class="nv1"><!-- 상단 메뉴 -->
			<div><li><a href="main.jsp"" class="main1">Home</a></li></div> <!-- 1레벨 -->
			<div><li><a href="#" class="main2">Products</a> <!-- 1레벨 -->
				<ul class="sub1">
					<li><a href="#" class="p1">Coffee</a> <!-- 2레벨 -->
						<ul class="subc">
							<li><a href="#" class="subc1">Capsule</a></li>
							<li><a href="#" class="subc2">Drip Bag</a></li>
							<li><a href="#" class="subc3">Whole Bean</a></li>
							<li><a href="#" class="subc4">Instant</a></li>
						</ul>
					</li>
					<li><a href="#" class="p2">Machine</a> <!-- 2레벨 -->
						<ul class="subm">
							<li><a href="#" class="subm1">Capsule Machine</a></li>
							<li><a href="#" class="subm2">Coffee Maker</a></li>
							<li><a href="#" class="subm3">Milk Steamer</a></li>
							<li><a href="#" class="suba4">Mocha Pot</a></li>
							<li><a href="#" class="subm4">Espresso Machine</a></li>
						</ul>
					</li>
					<li><a href="#" class="p3">Accessory</a> <!-- 2레벨 -->
						<ul class="suba">
							<li><a href="#" class="suba1">Grinder</a></li>
							<li><a href="#" class="suba2">Filter</a></li>
							<li><a href="#" class="suba3">Coffee Pot</a></li>
							<li><a href="#" class="suba5">Dripper</a></li>
							<li><a href="#" class="suba6">Server</a></li>
							<li><a href="#" class="suba7">Cup</a></li>
						</ul>
					</li>
					<li><a href="#" class="p4">ETC</a></li> <!-- 2레벨 -->
				</ul></li>
			</div>
			<div><li><a href="#" class="main3">Service</a> <!-- 1레벨 -->
				<ul class="sub2">
					<li><a href="noticeList.jsp" class="sub2_1">공지사항</a></li>
					<li><a href="capback.jsp" class="sub2_2">캡슐 수거</a></li>
					<li><a href="help.jsp" class="sub2_3">고객센터</a></li>
					<li><a href="faq.jsp" class="sub2_4">FAQ</a></li>
					<li><a href="machineAS.jsp" class="sub2_5">머신 A/S 문의</a></li>
				</ul></li>
			</div>
			<div><li><a href="#" class="main4">About Us</a></li></div> <!-- 1레벨 -->
		</nav>
		<input type="text" name="search" size="10" placeholder="검색어 입력" class="search">
		<nav class="nv2"><!-- 상단메뉴 로그인 -->
				<div class="topmenu">
					<%if (mem_id!=null) {//로그인 상태라면%>
					<div><li><a href="Logout.jsp" class="top1">Logout</a></li></div>
					<%}else {%>
					<div><li><a href="Login.jsp" class="top1">Login</a></li></div>
					<%}%>
					<div><li><a href="#" class="top2">My Page</a></li>
							<ul class="myp">
								<li><a href="MemberUpdate.jsp" class="myp1">회원정보</a></li>
								<li><a href="#" class="myp2">주문조회</a></li>
								<li><a href="#" class="myp3">관심상품</a></li>
								<li><a href="#" class="myp4">적립금</a></li>
								<li><a href="#" class="myp4">쿠폰</a></li>
							</ul>
					</div>
					<div><li><a href="#" class="top3">Site Map</a></li></div>
					<div><li><a href="#" class="top4">Language</a></li>
							<ul class="lang">
								<li><a href="#" class="ln1">한국어</a></li>
								<li><a href="#" class="ln2">English</a></li>
								<li><a href="#" class="ln3">Français</a></li>
								<li><a href="#" class="ln4">Español</a></li>
								<li><a href="#" class="ln5">Japanese</a></li>
								<li><a href="#" class="ln6">Chinese</a></li>
							</ul>
						</li>
					</div>
				</div>
		</nav>
		<img src="img/search.png" alt="searchimg" class="searchimg">
		<nav class="nv2mb"><!-- 상단메뉴 로그인 -->
				<div class="topmenu">
					<div><li><a href="Login.jsp" class="top1">Login</a></li></div>
					<div><li><a href="#" class="top2">My Page</a></li>
							<ul class="myp">
								<li><a href="#" class="myp1">회원정보</a></li>
								<li><a href="#" class="myp2">주문조회</a></li>
								<li><a href="#" class="myp3">관심상품</a></li>
								<li><a href="#" class="myp4">적립금</a></li>
								<li><a href="#" class="myp4">쿠폰</a></li>
							</ul>
					</div>
				</div>
			</nav>
	</header>
<br><br>
<div>
<center id="table">
<div class="noti" align="center"><b>공지사항</b></div>
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
			<a href="noticeContent.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"><%=article.getSubject()%></a>
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
</div>
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
<div id="forPages" align="center">
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
		//1) 이전 블럭
		if (startPage > blockSize) {%>
		<a href="noticeList.jsp?pageNum=<%=startPage-blockSize%>">[이전]</a>
	<%}
		//2) 현재 블럭
		for (int i=startPage; i<=endPage; i++) {%>
		<a href="noticeList.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<%}
		//3) 다음 블럭
		if (endPage < pageCount) {%>
		<a href="noticeList.jsp?pageNum=<%=startPage+blockSize%>">[다음]</a>
	<%	}
	}
	%>
	</div>
	
	<%if (mem_id.equals("admin")) {%>
	<div class="writebutton">
		<input type="button" value="글쓰기 " onclick="document.location='noticeWriteForm.jsp'" align="right">
	</div>
	<%}else { //디자인 문제... 손보기@@@@ disabled를 쓰라고 하심... 먼소린지 찾아보기 %>
	<div class="writebutton"></div>
	<%} %>
</center>

	<footer class="ft1">
		<nav class="nv3">
			<img src="img/bgxlogo250.png" alt="footerlogo">
		</nav>
		<nav class="nv4">
			<ul>
				<li><a href="#">서비스 이용약관</li>
				<li class="l1">|</li>
				<li><a href="#">개인정보 처리방침</li>
				<li class="l1">|</li>
				<li><a href="#">영상정보처리기기 운영/관리 방침</li>
				<li class="l1">|</li>
				<li><a href="#">쿠키</li>
				<li class="l1">|</li>
				<li><a href="#">고객지원</li>
			</ul>
		</nav>
		<nav class="nv5" id="pcver">
			<div>
			(주) 커피하우스   서울특별시 강남구 강남대로 9999 9층 커피하우스   대표이사 홍길동<br>
			사업자 등록번호 111-22-3333 | 통신판매신고번호 2022-서울강남-0000<br>
			제품 문의 : 080-999-8888   Fax : 02-0000-9999<br>
			이메일 주소 : coffeehouse@coffeehouse.com | 비즈니스 문의 : business@coffeehouse.com
			<p>
			Copyright © 2022 Coffee House. All Rights Reserved.
			</div>
		</nav>
		<nav class="nv5mb">
			<div>
			(주) 커피하우스   서울특별시 강남구 강남대로 9999 9층 커피하우스<br>  대표이사 홍길동<br>
			사업자 등록번호 111-22-3333<br>통신판매신고번호 2022-서울강남-0000<br>
			제품 문의 : 080-999-8888 | Fax : 02-0000-9999<br>
			이메일 주소 : coffeehouse@coffeehouse.com<br>비즈니스 문의 : business@coffeehouse.com
			<p>
			Copyright © 2022 Coffee House. All Rights Reserved.
			</div>
		</nav>
		<nav class="nv6" id="pcver">
				<li><img src="img/snsicon.png"></li>
		</nav>
		<nav class="nv7">
			<div>
			고객 서비스 센터 이용안내
			<h3>080-999-8888</h3>
			운영시간 AM 09:00~PM 18:00<br>
			(주말 및 공휴일 휴무)<br>
			점심시간 PM 12:00~13:00<p>
			<button id="btncall">1:1 상담접수 ></button>
			</div>
		</nav>
		<nav class="nv6mb">
			<li><img src="img/snsicon.png"></li>
		</nav>
	</footer>
  </div><!-- 본문 내용 전체를 묶어주는 영역 -->
</body>
<div class="bottombg"></div>
</html>