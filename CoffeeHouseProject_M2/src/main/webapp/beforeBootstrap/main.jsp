<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//웹상에서 로그인했는지 안 했는지 확인
	//session.setAttribute("idKey", mem_id); ->LoginProc.jsp를 거쳐서 왔는지?
	String mem_id=(String)session.getAttribute("idKey"); //Object이기 때문에 String으로 형변환 해줘야함
	System.out.println("main.jsp의 mem_id=>"+mem_id); //null이라면? ...
%>
<!doctype html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>Coffee House</title>
  <!-- 
  media속성(반응형) 웹의 크기를 지정할 때 사용(해상도)
  screen and (min-width:768px)(최소 해상도 픽셀)->해상도 이하 mainmo.css 적용
  -->
  <link href="css/main.css" rel="stylesheet" type="text/css"
		media="screen and (min-width:768px)">
  <link href="css/mainmo.css" rel="stylesheet" type="text/css"
		media="screen and (max-width:768px)">
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <!--<script src="js/main.js"></script>-->
 <script src="js/jquery.cycle2.js"></script>
 </head>
 <body>
 <div class="topbg"></div>
  <div class="wrap"> <!-- 본문 내용 전체를 묶어주는 영역 -->
  	<header class="hd1">
		<h1><a href="main.jsp" class="logo"><img src="img/bgxlogo250.png" alt="coffeehouse" width="250px" height="100px" border="1"></a></h1>
		<nav class="nv1"><!-- 상단 메뉴 -->
			<div><li><a href="main.jsp" class="main1">Home</a></li></div> <!-- 1레벨 -->
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
		<input type="search" name="search" size="10" placeholder="검색어 입력" class="search">
		<nav class="nv2"><!-- 상단메뉴 로그인 -->
				<div class="topmenu">
					<%if (mem_id!=null) {//로그인 상태라면%>
					<div><li><a href="Logout.jsp" class="top1">Logout</a></li></div>
					<%}else {%>
					<div><li><a href="Login.jsp" class="top1">Login</a></li></div>
					<%}%>
					<div><li><a href="myPage.jsp" class="top2">My Page</a></li>
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
		<nav class="nv2mb"><!-- 모바일 상단메뉴 로그인 -->
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
	<!-- <header class="hd2"><img src="" alt="mb"></header> --><!-- 모바일용 헤더 -->
	<div class="cycle-slideshow">
		<img src="img/sc1-img1.jpg" alt="sc-1">
		<img src="img/sc1-img2.jpg" alt="sc-2">
		<img src="img/sc1-img3.jpg" alt="sc-3">
	</div>
	<!-- <section class="sc2"><img src="" alt="sc2"></section>
	<section class="sc3"><img src="" alt="sc3"></section> -->
	<!-- articles -->
	<article class="at1">
		<center><h2 class="besth2">- 베스트셀러 -</h2></center>
		<div class="d1">
			<figure>
				<img src="img/best1.jpg" alt="best1">
				<figcaption class="fc1">
					1. 캡슐 머신 미니<br>
					<div class="pcver">179,000원</div>
				</figcaption>
			</figure>
		</div>
		<div class="line"></div>
		<div class="d2">
			<figure>
				<img src="img/best2.jpg" alt="best2">
				<figcaption class="fc2">
					2. 오리지널 캡슐 예가체프<br>
					<div id="pcver">7,000원</div>
				</figcaption>
			</figure>
		</div>
		<div class="d3">
			<figure>
				<img src="img/best3.jpg" alt="best3">
				<figcaption class="fc3">
					3. 오리지널 캡슐 바닐라<br>
					<div id="pcver">7,000원</div>
				</figcaption>
			</figure>
		</div>
		<div class="d4">
			<figure>
				<img src="img/best4.jpg" alt="best4">
				<figcaption class="fc4">
					4. 캡슐 머신 알파<br>
					<div id="pcver">219,000원</div>
				</figcaption>
			</figure>
		</div>
		<div class="d5">
			<figure>
				<img src="img/best5.jpg" alt="best5">
				<figcaption class="fc5">
					5. 오리지널 캡슐 콜롬비아<br>
					<div id="pcver">8,000원</div>
				</figcaption>
			</figure>
		</div>
	</article>
	<article class="at2">
		<center><h2 class="newh2">- 신제품 -</h2></center>
		<div class="dv1">

			<img src="img/new1.jpg" alt="new1">
			<div class="dv1e">
			<h4>모카 포트 H-227</h4>
			<div id="pcver">
			<br>
			세계 여러 도시에서<br>사랑받아 온<br>모카 포트 H-200이<br>새로운 모습으로<br>탄생하였습니다.<br>
			바로 지금,<br>모카 포트 H-227와 함께<br>새로운 커피의 세계를<br>만나 보세요.<br>
			<br>
			<button id="btnnew1"> 장바구니에 담기 </button><br>
			<button id="btnnew2"> 제품 페이지 바로가기 </button></div>
			</div>
		</div>
		<div class="dv2">
			<img src="img/new2.jpg" alt="new2">
			<div class="dv2e">
			<h4>프라이빗 셀렉션 에티오피아 예가체프</h4>
			<div id="pcver">
			<br>
			부드러우면서도<br>짙은 꽃향기,<br>
			목넘김 이후에 남는<br>아련한 향,<br>
			부드러운 바디,<br>달콤한 신맛.<br>
			한층 더 새로워진<br>에티오피아 예가체프를<br>
			프라이빗 셀렉션으로<br>만나 보세요.<br>
			<br>
			<button id="btnnew3"> 장바구니에 담기 </button><br>
			<button id="btnnew4"> 제품 페이지 바로가기 </button></div>
			</div>
		</div>
	</article>
	<article class="at3"><!-- 홍보영상 -->
		<div class="video1">
			<iframe width="450px" height="350px" src="https://www.youtube.com/embed/F48nBQI3r_Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		<div class="video2">
			<iframe width="450px" height="350px" src="https://www.youtube.com/embed/r2s63Gnyj00" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	</article>
	<article class="at4"><!-- 캡슐 회수, 무료 체험 -->
		<div class="capback1">
			<img src="img/capback.jpg" alt="capback">
			<div class="capback2" id="pcver">
				커피하우스는 환경 보호를 위해<br>사용한 알루미늄 캡슐을 회수하여 재활용합니다.<br>
				캡슐 회수에 관한 내용은 <i><a href="#">[여기]</a></i> 에서 확인하세요.
			</div>
			<div class="capback2mb">
				커피하우스는<br>환경 보호를 위해<br>사용한 알루미늄 캡슐을<br>회수하여 재활용합니다.<br>
				캡슐 회수에 관한 내용은<br><i><a href="#">[여기]</a></i> 에서 확인하세요.
			</div>
		</div>
		<div class="free1">
			<div class="free2" id="pcver">
				커피하우스의 다양한 커피 머신들을<br>한 달 동안 무료로 체험하고,<br>멋진 홈카페를 만들어보세요.<br>
				자세한 내용은 <i><a href="#">[여기]</a></i> 에서 확인하세요.
			</div>
			<div class="free2mb">
				커피하우스의<br>다양한 커피 머신들을<br>한 달 동안 무료로 체험하고,<br>멋진 홈카페를 만들어보세요.<br>
				자세한 내용은<br><i><a href="#">[여기]</a></i> 에서 확인하세요.
			</div>
			<img src="img/freeex.jpg" alt="freeex">
		</div>
	</article>
	<article class="at5"><!-- 뉴스, 환경보호, 매장찾기, 정기구독 -->
		<a href="#"><div class="news">
			<img src="img/news.jpg" alt="news">
			<p>커피하우스<br>뉴스</p>
		</div></a>
		<a href="#"><div class="eco">
			<img src="img/eco.jpg" alt="eco">
			<p>환경보호를<br>위한<br>노력들</p>
		</div></a>
		<a href="#"><div class="shop">
			<img src="img/shop.jpg" alt="shop">
			<p>매장찾기</p>
		</div></a>
		<a href="#"><div class="subsc">
			<img src="img/subsc.jpg" alt="subsc">
			<p>정기구독</p>
		</div></a>
	</article>
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
    