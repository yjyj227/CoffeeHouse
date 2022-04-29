<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chboard.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	BoardDAO dbPro=new BoardDAO();
	BoardDTO article=dbPro.getArticle(num);
	//링크문자열의 길이 줄이기 위해
	int ref=article.getRef();
	int re_step=article.getRe_step();
	int re_level=article.getRe_level();
	System.out.println("noticeContent.jsp의 매개변수 확인");
	System.out.println("ref=>"+ref+", re_step=>"+re_step+", re_level=>"+re_level);
	
	String mem_id=(String)session.getAttribute("idKey");
	String mem_passwd=(String)session.getAttribute("pwKey");
	System.out.println("noticeContent.jsp의 mem_id=>"+mem_id);
	
%>
<title><%=article.getSubject()%></title>
<link href="css/other.css?ver=1" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js?ver=1">
	function list() {
		document.listFrm.submit();
	}
	function down() {
		document.downFrm.filename.value=filename;
		document.downFrm.submit();
	}
</script>
</head>

<style>
* {
	vertical-align:center;
}
.noticetable {
	position:relative;
	top:20px;
	float:left;
	left:10%;
	display:inline-block;
	border:3px solid #f5ebe9;
	border-left:none; border-right:none;
	word-break:break-all;
}
td {
	border-bottom:1px solid #f5ebe9; border-left:none; border-right:none; border-top:none;
	line-height:25px;
	padding-left:5px; padding-right:5px;
	word-break:break-all;
}
input {
	border:1px solid #6f5d58;
	line-height:20px;
	padding-left:5px;
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

.noti {
	position:relative;
	top:100px;
	left:-15px;
}
.content {
	padding-left:30px; padding-top:30px;
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
<center>
<div class="noti">
<form>
<table border="1" width="900" cellspacing="0" cellpadding="5" class="noticetable" align="center">
	<tr height="30">
		<td align="center" width="800" colspan="4" padding="20px"><%=article.getSubject()%></td>
	</tr>
	<tr height="30">
		<td align="left" width="160">&nbsp;&nbsp;&nbsp;&nbsp;<%=article.getId()%></td>
		<td align="center" width="240"></td>
		<td align="right" width="320"><%=sdf.format(article.getReg_date())%></td>
		<td align="center" width="80"><%=article.getReadcount()%></td>
	</tr>
	<%if (article.getFilename()!=null && !article.getFilename().equals("")) {%>
	<tr height="30">
		<td align="left" width="800" colspan="4">
		&nbsp;&nbsp;&nbsp;&nbsp;첨부파일&nbsp;&nbsp;&nbsp;<a href="javascript:down('<%=article.getFilename()%>' %>)"><%=article.getFilename()%></a>
		&nbsp;&nbsp;<font-color="gray">(<%=article.getFilesize()%>KBytes)</font-color>
		</td>
	</tr>
	<%}else {%>
		<td align="left" width="800" colspam="4">
		&nbsp;&nbsp;&nbsp;&nbsp;첨부된 파일이 없습니다.
		</td>
	<%} %>
	<tr>
		<td align="left" width="800" height="100" colspan="4"><pre class="content"><%=article.getContent()%></pre></td>
	</tr>
	<tr height="50">
		<td align="left" width="400" colspan="2">
		&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="목록으로 "
				onclick="document.location.href='noticeList.jsp?pageNum=<%=pageNum%>'">
		</td>
		<td align="right" width="400" colspan="2">
		<%if (article.getId().equals(mem_id) || mem_id.equals("admin")) {%>
			<input type="button" value="수정 "
				onclick="document.location.href='noticeUpdateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="삭제 "
				onclick="document.location.href='noticeDeleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
		<%}else {%>
			<%} %>
				
			<input type="button" value="답글쓰기 "
				onclick="docunemt.location.href='noticeWriteFrom.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
		</td>	
	</tr>
</table>
</form>
</div>
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