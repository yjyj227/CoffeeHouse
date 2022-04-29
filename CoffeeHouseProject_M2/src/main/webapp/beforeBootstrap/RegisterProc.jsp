<%@ page contentType="text/html;charset=UTF-8"
	import="chhewon.*"%>
<%
	//Register.jsp->RegisterProc.jsp
	request.setCharacterEncoding("utf-8");
	/*
	MemberDTO mem=new MemberDTO();
	mem.setMem_id(request.getParameter("mem_id"));
	mem.setMem_passwd(request.getParameter("mem_passwd"));
	,,, */
%>
<jsp:useBean id="mem" class="chhewon.MemberDTO" />
<jsp:setProperty name="mem" property="*" />
<html>
<head>
<title>회원가입 확인</title>
<link href="css/other.css?ver=1" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js?ver=1">
</script>
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
</style>
<body>
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
<table align="center" border="0" cellspacing="0" cellpadding="5" class="regtable">
  <tr> 
    <td align="center" valign="middle"> 
      <table cellspacing="2" cellpadding="2" align="center">
        <form name="regForm" method="post" action="MemberInsert.jsp">
          <tr align="center"> 
            <td colspan="3"><b>작성하신 내용을 다시 한 번 확인해주세요.</b></td>
          </tr>
          <tr> 
            <td width="30%">아이디</td>
            <td width="57%"> 
            <input type="text" name="mem_id" size="15"  
            value="<jsp:getProperty name="mem" property="mem_id" />" >
		   </td>
          </tr>
          <tr> 
            <td>비밀번호</td>
            <td> <input type="password" name="mem_passwd" size="15"
            value="<jsp:getProperty name="mem" property="mem_passwd" />"> 
           </td>
          </tr>
          <tr> 
            <td>이름</td>
            <td> <input type="text" name="mem_name" size="15" 
            value="<jsp:getProperty name="mem" property="mem_name" />"> </td>
          </tr>
          <tr> 
            <td>이메일</td>
            <td> <input type="text" name="mem_email" size="27" 
            value="<jsp:getProperty name="mem" property="mem_email" />">
            </td>
          </tr>
          <tr>  
            <td>전화번호</td>
            <td> <input type="text" name="mem_phone" size="20" 
            value="<jsp:getProperty name="mem" property="mem_phone" />"> </td>
            
          </tr>
		  <tr>  
            <td>우편번호</td>
            <td> <input type="text" name="mem_zipcode" size="7" 
            value="<jsp:getProperty name="mem" property="mem_zipcode" />">
                 <input type="button" value=" 우편번호찾기 " onClick="zipCheck()"></td>
            
          </tr>
		  <tr>  
            <td>주소</td>
            <td><input type="text" name="mem_address" size="70"
            value="<jsp:getProperty name="mem" property="mem_address" />"></td>
          </tr>
		  <tr>  
            <td>선호커피</td>
            <td><input type="text" name="mem_prefer" size="70"
                   value="<jsp:getProperty name="mem" property="mem_prefer" />"></td>
          </tr>
          <tr> 
            <td colspan="3" align="center"> 
             <input type="submit" value="확인완료 "> 
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
             <input type="button" value="다시쓰기 " onclick="history.back()"> 
            </td>
          </tr>
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
</html>


</body>
</html>
