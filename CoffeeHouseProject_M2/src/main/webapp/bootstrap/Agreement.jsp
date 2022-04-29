<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Coffee House</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="img/favicon.ico" />
<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="js/jquery.cycle2.js"></script>
<script LANGUAGE="JavaScript" src="script.js?ver=1"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<link href="css/CHstyle.css" rel="stylesheet" type="text/css">
<style>
	.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, 
	.col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, 
	.col-xs-3, .col-sm-3, .col-md-3, .col-lg-3,
	.col-xs-4, .col-sm-4, .col-md-4, .col-lg-4,
	.col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, 
	.col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, 
	.col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, 
	.col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, 
	.col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, 
	.col-xs-10,.col-sm-10, .col-md-10, .col-lg-10,
	.col-xs-11,.col-sm-11, .col-md-11, .col-lg-11, 
	.col-xs-12,.col-sm-12, .col-md-12, .col-lg-12 {
		padding:10px; /* 기존의 부트스트랩의 그리드에 해당하는 스타일클래스 선택자를 변경하는 경우 */
	}
	* {
		color:rgb(250, 240, 239);
		
	}
	.row { /* 그리드 시스템 사이의 거리를 주기 위해서 필요 */
		margin-bottom:50px;
		margin-top:50px;
		vertical-align:middle;
	}
	.row1 {
		margin-bottom:4px;
		margin-top:4px;
		vertical-align:middle;
		
	}
	

	.nav-tabs {
  
}


.nav-tabs > li > a {
  margin-right: 2px;
  line-height: 1.42857143;
  border: 1px solid transparent;
  border-radius: 4px 4px 0 0;
  color:rgb(250, 240, 239);
  font-size:2rem;
}
.nav-tabs li a {
	
}
.nav-tabs > li > a:hover,
.nav-tabs > li > a:focus {
  
  background-color:rgb(250, 240, 239);
  color:rgb(56, 46, 43);
}
.nav-tabs > li.active > a,
.nav-tabs > li.active > a:hover,
.nav-tabs > li.active > a:focus {
  cursor: default;
  border: 1px solid #ddd;
  border-bottom-color: transparent;
  font-weight:bold;
  color:rgb(56, 46, 43);
}
.nav-tabs.nav-justified > li {
  float: none;
  
}
.nav-tabs.nav-justified > li > a {
  margin-bottom: 5px;
  text-align: center;
  border-bottom: 3px solid rgb(206, 151, 139);
}
button {
	font-weight:bold;
	color:rgb(56, 46, 43);
}
	</style>
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js
    	IE의 버전이 낮은 경우에는 html5에 대한 태그 인식X -> 인식을 시켜주는 옵션 -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  
	<div class="container" aling="center"><!-- 전체 레이아웃 감싸주기 -->
	
	<header>
	<div class="container"><!-- header 내부 -->
		<div class="row1"><!-- 로고 -->
		<div class="col-md-12"></div>
			<div class="col-md-offset-3 col-md-6 col-md-offset-3"><a href="Main.jsp"><img src="img/CHlogo.png" alt="coffeehouse" width="250px" height="100px" border="1" class="logo"></a></div>
		</div>
		
		<div class="row1"><!-- 로그인 마이페이지 -->
			<div class="col-md-offset-8 col-md-4">
				<ul class="nav nav-pills navbar-right nv1">
					
					<li class="disabled"><a></a></li>
					
					<li><a href="Login.jsp">Login</a></li>
					
					<li class="dropdown"><a data-toggle="dropdown" href="#">My
							Page</a>
					<!-- 이벤트 대상 -->
						<ul class="dropdown-menu">
							<li><a href="#">회원정보</a></li>
							<li><a href="#">주문조회</a></li>
							<li><a href="#">장바구니</a></li>
							<li><a href="#">관심상품</a></li>
							<li><a href="#">적립금</a></li>
							<li><a href="#">쿠폰</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="row1"><!-- 네비게이션 -->
			<div class="col-md-12 nv2">
				<ul class="nav nav-tabs nav-justified">
					<li><a href="Main.jsp">Home</a></li>
					<li class="dropdown"><a data-toggle="dropdown" href="#">Product</a>
						<ul class="dropdown-menu">
							<li class="dropdown"><a data-toggle="dropdown" href="#">Coffee</a>
								<ul class="dropdown-menu">
									<li><a href="#">Capsule</a></li>
									<li><a href="#">Drip Bag</a></li>
									<li><a href="#">Whole Bean</a></li>
									<li><a href="#">Instant</a></li>
								</ul></li>
							<li><a href="#">Machine</a></li>
							<li><a href="#">Accessory</a></li>
							<li><a href="#">ETC</a></li>
								</ul></li>
							<li class="dropdown"><a data-toggle="dropdown" href="#">Service</a>
						<ul class="dropdown-menu">
							<li><a href="#">공지사항</a></li>
							<li><a href="#">캡슐수거</a></li>
							<li><a href="#">고객센터</a></li>
							<li><a href="#">FAQ</a></li>
							<li><a href="#">머신 A/S 문의</a></li>
						</ul>
					</li>
					<li><a href="#">About Us</a></li>
				</ul>
			</div>
		</div>
	</div><!-- header 내부 -->
	</header>
	
	<div class="container"><!-- header와 footer 사이 -->
	<a class="topbutton" href="#"><img src="img/topbutton.png"></a>
		
		<div class="row">
			<div class="col-md-offset-1 col-md-10 col-md-offset-1">
			<div class="col-md-12 pagetitle">Coffee House 이용약관 동의</div>
			<div class="col-md-12">
				<textarea rows="20" class="form-control">
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
				
				</textarea>
			</div>
			<div class="col-md-12">
				<button type="button" class="btn btn-default" onclick="document.location='Register.jsp'">동의합니다.</button>
				<button type="button" class="btn btn-default" onclick="history.back()">동의하지 않습니다.</button>
			</div>
			</div>
		</div>
		
		
	</div><!-- header footer 사이 -->
	
	<footer>
	<div class="container footerarea1" align="center"><!-- footer 내부 -->
		<div class="row footerarea2"><!-- footer -->
		<div class="col-md-12"></div>
			<div class="col-md-2 footlogo">
				<img src="img/CHlogo.png" alt="footlogo">
			</div>
			<div class="col-md-7">
			<div class="col-md-12">
				<div class="footerinfo">
					<ul>
						<li><a href="#">서비스 이용약관</li>
						<li>|</li>
						<li><a href="#">개인정보 처리방침</li>
						<li>|</li>
						<li><a href="#">영상정보처리기기 운영/관리 방침</li>
						<li>|</li>
						<li><a href="#">쿠키</li>
						<li>|</li>
						<li><a href="#">고객지원</li>
					</ul>
				</div>
			</div>
			<div class="col-md-12">
				<div class="footerinfo">
					<div>
						(주) 커피하우스   서울특별시 강남구 강남대로 2222 22층 커피하우스   대표이사 홍길동<br><br>
						사업자 등록번호 111-22-3333 | 통신판매신고번호 2022-서울강남-0000<br>
						제품 문의 : 080-999-8888   Fax : 02-0000-9999<br>
						이메일 주소 : coffeehouse@coffeehouse.com | 비즈니스 문의 : business@coffeehouse.com
						<p>
						Copyright © 2022 Coffee House. All Rights Reserved.
					</div>
				</div>
			</div>
			</div>
			<div class="col-md-3 snsicon">
			
				<div class="col-md-2"></div>
				<div class="col-md-2"><img src="img/f_icon.png" alt="facebook"></div>
				<div class="col-md-2"><img src="img/t_icon.png" alt="twitter"></div>
				<div class="col-md-2"><img src="img/y_icon.png" alt="youtube"></div>
				<div class="col-md-2"><img src="img/i_icon.png" alt="instagram"></div>
				<div class="col-md-2"></div>
			
			<div class="col-md-12">
				<div>
					고객 서비스 센터 이용안내<br>
					<b>080-999-8888</b><br>
					운영시간 AM 09:00~PM 18:00<br>
					(주말 및 공휴일 휴무)<br>
					점심시간 PM 12:00~13:00<p><p>
					<button class="btn btn-default btn-xs">1:1 상담접수 ></button>
				</div>
			</div>
			</div>
		</div>
	</div><!-- footer 내부 -->
	</footer>
	</div><!-- 전체 레이아웃 감싸주기 -->
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>