<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 동의 약관</title>
<link href="css/other.css?ver=1" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="script.js?ver=1">
</SCRIPT>
</head>
<style>
#agreement {
	position:relative;
	text-align:center;
	top:100px;
	display:inline-block;
	float:left;
	left:-10%;
	padding:0;
	margin:0;
}
input {
	border:1px solid #6f5d58;
	line-height:20px;
}
</style>
<body>
<!-- ????? -->
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
	
<center>
<div id="agreement">
	<h2>회원 동의 약관</h2>
	<br>
	<textarea cols="80" rows="20" name="agree">
	제 1 조 (약관의 적용)
인터넷 서비스(이하"서비스"라 합니다)의 이용에는 기본 이용약관(이하"기본약관"이라 합니다)과 이 약관을 함께 적용합니다

 제 2 조 (용어의 정의)
 이 약관에서 사용하는 용어의 정의는 다음과 같습니다. 
 ① 운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람 
 ② 해지 : 회원이 서비스 사용 후 이용계약을 해약하는 것 
 ③ 회원 : 회사와 서비스 이용계약을 체결하고 이용자 ID를 부여받은 자
 ④ 회사: 서비스의 제공자

	
제 2 장 서비스 이용계약

 제 3 조 (이용계약의 성립)
 ① 서비스 가입 신청시 본 약관을 읽고 "동의함" 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다. 
 ② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용신청에 대하여 회사가 승낙함으로써 성립합니다. 
			
 제 4 조 (계약사항의 변경) 
 회원은 개인정보관리를 통해 언제든지 개인정보를 열람하고 수정할 수 있습니다. 
 회원은 이용신청시 기재한 사항이 변경되었을 경우에는 온라인으로 수정을 해야 하고 미변경으로 인하여 발생되는 문제의 책임은 회원에게 있습니다.


제 3 장  서비스의 이용

 제 5조 (정보의 제공)
 회사는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보를 공지사항이나 전자우편, SMS 등의 방법으로 회원에게 제공할 수 있습니다.  

 제 6조 (요금 및 유료정보 등)
 회사가 제공하는 서비스는 기본적으로 무료입니다. 단, 별도의 유료정보에 대해서는 해당 정보에 명시된 요금에 대한 지불을 동의하여야 사용이 가능합니다.

 제 7조 (광고게재 및 광고주와의 거래)
 ① 회사가 회원에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다. 서비스를 이용하고자 하는 자는 서비스 이용시 노출되는 광고게재에 대해 동의하는 것으로 간주됩니다.
 ② 회사는 본 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다. 

 제 8조 (서비스 이용시간) 
 ① 서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기 점검 등의 필요로 회사가 정한 날이나 시간은 그러하지 않습니다.
 ② 회사는 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 사전에 공지합니다. 

 제 9조 (서비스 이용 책임) 
 회원은 회사에서 권한 있는 사원이 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 서비스를 이용하여 상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈벌이 광고, 음란사이트를 통한 상업행위, 상용S/W 및 저작권 자료의 불법배포 등을 할 수 없습니다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치등에 관해서는 회사가 책임을 지지 않습니다. 


제 4 장 계약해지 및 이용제한

 제 10 조 (계약해지 및 이용제한)
 ① 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인, 우편, 방문 및 전화를 통해 회사에 해지 신청을 하여야 합니다. 
 ② 회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다. 
 다만, 이용계약을 해지하는 경우에는 회원에게 이를 통지하고, 이용계약 해지 전에 소명할 기회를 부여합니다.
 가. 타인의 서비스 ID 및 비밀번호를 도용한 경우 
 나. 서비스 운영을 고의로 방해한 경우 
 다. 가입한 이름이 실명이 아닌 경우 
 라. 같은 사용자가 다른 ID로 이중등록을 한 경우 
 마. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우 
 바. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스이용을 계획 또는 실행하는 경우 
 사. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우 
 아. 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우 
 자. 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우 
 차. 회사, 다른 회원 또는 제3자의 지적재산권을 침해하는 경우 
 카. 정보통신윤리위원회 등 외부기관의 시정요구가 있거나 불법선거운동과 관련하여 선거관리위원회의 유권해석을 받은 경우 
 타. 타인의 개인정보, 이용자ID 및 비빌번호를 부정하게 사용하는 경우 
 파. 회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙없이 복제 또는 유통시키거나 상업적으로 이용하는 경우 
 하. 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트 링크하는 경우 
 거. 본 약관 제9조 또는 제10조를 위반한 경우
 너. 기타 서비스 이용계약상의 의무를 위반한 경우
 
제 5 장  손해배상

 제11조 (손해배상의 범위)
 ① 회사가 제공하는 서비스중 무료 서비스의 경우에는 손해배상에 해당되지 않습니다.
 ③ 회사는 그 손해가 천재지변 등 불가항력이거나 이용자의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 아니합니다.

 제12조 (손해배상의 청구)
 ① 손해배상 청구는 회사에 청구사유, 청구금액 및 산출근거를 기재하여 전화 및 서면으로하여야 하며 그 사유가 발생한 날로부터 6개월이 경과한 경우에는 소멸합니다.
 ② 제10조의 서비스 이용정지 사유중 회사 및 타인에게 피해를 주어 피해자의 고발 또는 소송제기로 인하여 손해배상을 청구할 경우 그 사유를 제공한 자는 이에 응하여야 합니다.

 제13조 (면책)
 ① 회사는 천재지변 또는 이에 준하는 불가항력으로 서비스를 제공할 수 없는 경우와 서비스의 효율적 제공을 위한 시스템 개선 공사, 장비 증설 및 상향공사 등 계획공사의 사유로 고객에게 사전 통보한 경우에는 책임을 면합니다.
 ② 자유게시판 서비스의 경우 각 게시판에 게재된 데이터의 보존 책임이 없습니다.
 ③ 회사는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 면합니다.
 ④ 회사는 이용자가 서비스를 통해 얻은 정보 또는 자료 등으로 인해 발생한 손익,서비스를 이용하거나 할 것으로부터 발생하거나 기대하는 손익 등에 대하여 책임을 면합니다.
 ⑤ 회사는 이용자가 게시 또는 전송한 자료의 내용에 관하여는 책임을 면합니다.
 ⑥ 약관의 적용은 이용자에 한하며, 제3자로 부터의 어떠한 배상, 클레임 등에 대하여 회사는 책임을 면합니다.
 ⑦ 회사는 자유게시판 서비스를 무료로 사용하는 이용자들에게 회사의 귀책 사유로 서비스를 제공하지 못하는 경우 책임을 면합니다.
 ⑧ 자유게시판 서비스와 같이 이용자 자신이 서비스를 개설하고 회원을 모집하여 관리하는 경우 개설한 이용자와 해당 서비스에 회원으로 가입한 이용자간의 각종 법규위반 및 금지 행위로 인한 문제에 대한 책임은 이용자간에 있으며 회사는 책임을 면합니다.

 제34조 (관할법원)
 요금 등 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지 법원을 관할법원으로 합니다.
	
	</textarea><p>
	<br>
	<input type="button" value=" 동의합니다. " onclick="document.location='Register.jsp'">&nbsp;
	<input type="button" value=" 동의하지 않습니다. " onclick="history.back()">
	</div>
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
</head>
<body>

</body>
</html>