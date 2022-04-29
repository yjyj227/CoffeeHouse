<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chhewon.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>회원정보 수정</title>
<link href="css/other.css?ver=1" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js?ver=1"></script>
</head>
<style>
* {
	vertical-align:center;
}
.regtable {
	position:relative;
	top:100px;
	float:left;
	left:0%;
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
form {
	position:relative;
	text-align:center;
	top:150px;
	display:inline-block;
	padding:0;
	margin:0;
	border-bottom:1px solid #f5ebe9; border-left:none; border-right:none; border-top:none;
}
.delete {
	color:red;
	font-weight:bold;
}
</style>
</head>
<body>
<%
	//소스를 변경해도 바로 반영이 안 되는 이유->서버에서 기본적으로 전의 페이지를 불러오기 때문
	response.setHeader("Cache-Control", "no-cache"); //요청시 메모리에 저장X
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0); //보관기간 0->보관하지 마라
%>
<%
	/*
	1) post 전달(input box를 이용)   2) get(링크걸기)(물음표)   3) post 전달(hidden 이용하는 경우)
	MemberUpdate.jsp?mem_id='admin' (회원수정)
	String mem_id=request.getParameter("mem_id")
	*/
	String mem_id=(String)session.getAttribute("idKey");
	System.out.println("MemberUpdate.jsp의 mem_id=>"+mem_id);
	MemberDAO memMgr=new MemberDAO();
	MemberDTO mem=memMgr.getMember(mem_id);
	System.out.println("MemberUpdate.jsp의 객체(mem)=>"+mem); //null이라면 메서드에 문제 있음
%>
<%
if (mem_id!=null) { //로그인 상태라면
%>
<div class="topbg"></div>
  <div class="wrap"> <!-- 본문 내용 전체를 묶어주는 영역 -->
  	<header class="hd1">
		<h1><a href="main.jsp" class="logo"><img src="img/bgxlogo250.png" alt="coffeehouse" width="250px" height="100px" border="1"></a></h1>
		<nav class="nv1"><!-- 상단 메뉴 -->
			<div><li><a href="#" class="main1">Home</a></li></div> <!-- 1레벨 -->
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
					<li><a href="#" class="sub2_2">캡슐 수거</a></li>
					<li><a href="#" class="sub2_3">고객센터</a></li>
					<li><a href="#" class="sub2_4">FAQ</a></li>
					<li><a href="#" class="sub2_5">머신 A/S 문의</a></li>
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
								<li><a href="#" class="myp1">회원정보</a></li>
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
<table align="center" cellspacing="0" cellpadding="5" class="regtable">
  <tr> 
    <td align="center" valign="middle"> 
      <table cellspacing="2" cellpadding="15" align="center">
        <form name="regForm" method="post" action="MemberUpdateProc.jsp">
          <tr align="center"> 
            <td colspan="2"><b>회원정보 수정</b></td>
          </tr>
          <tr> 
            <td width="30%">아이디</td>
            <td width="57%"> <%=mem.getMem_id() %> </td>
          </tr>
          <tr> 
            <td>비밀번호</td>
            <td> <input type="password" name="mem_passwd" size="15" value="<%=mem.getMem_passwd()%>"> </td>
            
          </tr>
          <!-- 비밀번호 확인란 제거 -->
          <tr> 
            <td>이름</td>
            <td> <input type="text" name="mem_name" size="15" value="<%=mem.getMem_name()%>"> </td>
            
          </tr>
          <tr> 
            <td>이메일</td>
            <td> <input type="text" name="mem_email" size="27" value="<%=mem.getMem_email()%>"> </td>
            
          </tr>
          <tr>  
            <td>전화번호</td>
            <td> <input type="text" name="mem_phone" size="20" value="<%=mem.getMem_phone()%>"> </td>
           
          </tr>
		  <tr>  
            <td>우편번호</td>
            <td> <input type="text" name="mem_zipcode" size="7" value="<%=mem.getMem_zipcode()%>">
                 <input type="button" value=" 우편번호찾기 " onClick="zipCheck()"></td>
            
          </tr>
		  <tr>  
            <td>주소</td>
            <td><input type="text" name="mem_address" size="70" value="<%=mem.getMem_address()%>"></td>
            
          </tr>
		  <tr>  
            <td>선호커피</td>
            <td><select name=mem_prefer>
 					<option value="0">선택
 					<option value="캡슐커피">캡슐커피
 					<option value="드립커피">드립커피
 					<option value="원두">원두
 					<option value="인스턴트">인스턴트
				</select>
				<script>
				document.regForm.mem_prefer.value="<%=mem.getMem_prefer()%>"
				</script></td>
          </tr>
          <tr> 
            <td colspan="3" align="center"> 
             <input type="submit" value="수정완료 "> 
             &nbsp;
             <input type="reset" value="다시쓰기 "> 
             &nbsp;
             <input type="button" value="수정취소 " onclick="history.back()">
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             <input type="button" value="회원탈퇴 " onclick="location.href='DelCheckForm.jsp?mem_id=<%=mem_id%>'" class="delete">
            </td>
          </tr>
          <input type="hidden" name="mem_id" value="<%=mem_id %>">
        </form>
      </table>
    </td>
  </tr>
</table>
</center>
	
	<!-- footer -->
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
<%}else { %>
	<script>
		alert("로그인 후 이용 가능합니다.");
		location.href="Login.jsp";
	</script>
<%} %>
</html>