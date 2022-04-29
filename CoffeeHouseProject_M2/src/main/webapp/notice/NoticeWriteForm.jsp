<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="mem_id" value="${sessionScope.idKey}" />
<c:set var="mem_passwd" value="${sessionScope.pwKey}" />
<fmt:requestEncoding value="utf-8" />

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
ul.nav li.dropdown:hover > ul.dropdown-menu {
	display:block; margin:0;
}
table {
	border-top:2px solid rgb(206, 151, 139);
	border-bottom:2px solid rgb(206, 151, 139);
}

.btn {
	font-weight:bold;
	color:rgb(56, 46, 43);
	text-align:center;
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
			<div class="col-md-offset-3 col-md-6 col-md-offset-3"><a href="Main.do"><img src="img/CHlogo.png" alt="coffeehouse" width="250px" height="100px" border="1" class="logo"></a></div>
		</div>
		
		<div class="row1"><!-- 로그인 마이페이지 -->
			<div class="col-md-offset-8 col-md-4">
				<ul class="nav nav-pills navbar-right nv1">
					<c:if test="${!empty mem_id}">
						<li class="disabled"><a><c:out value="${mem_id}" />님 환영합니다.</a></li>
						<li><a href="Logout.do">Logout</a></li>
					</c:if>
					<c:if test="${empty mem_id}">
						<li><a href="Login.do">Login</a></li>
					</c:if>
					<li class="dropdown"><a data-toggle="dropdown" href="#">My Page</a>
					<!-- 이벤트 대상 -->
						<ul class="dropdown-menu">
							<c:if test="${!empty mem_id}">
								<li><a href="MemberUpdate.do">회원정보</a></li>
							</c:if>
							<c:if test="${empty mem_id}">
								<li class="disabled"><a>회원정보</a></li>
							</c:if>
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
							<li><a href="NoticeList.do">공지사항</a></li>
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
			<div class="col-md-12 pagetitle">글 작성</div>
			<div class="form-group">
				<form role="form" class="form-horizontal" name="noticewriteform" method="post" action="NoticeWriteProc.do" onsubmit="return writeSave()">
					<!-- 입력하지 않고 매개변수로 전달해서 테이블에 저장 -->
					<input type="hidden" name="num" value="${num}">
					<input type="hidden" name="ref" value="${ref}">
					<input type="hidden" name="re_step" value="${re_step}">
					<input type="hidden" name="re_level" value="${re_level}">
					
					<input type="hidden" name="id" value="${mem_id}">
					<input type="hidden" name="passwd" value="${mem_passwd}">
		
				<table class="table">
				<thead>
					<tr>
						<td>
						<c:if test="${num==0}">
							<input type="text" name="subject" placeholder="제목을 입력하세요." class="form-control">
						</c:if>
					    <c:if test="${num!=0}"><!-- 답변글인 경우 -->
					    	<input type="text" name="subject" placeholder="제목을 입력하세요." class="form-control" value="┗ [re] ">
					    </c:if>
						</td>
					</tr>
				</thead>
					<tr>
						<td>
						<textarea name="content" rows="20" placeholder="내용을 입력하세요." class="form-control"></textarea>
						</td>
					</tr>	
					<tr>
						<td>
						<div class="col-md-1">
						파일 첨부
						</div>
						<div class="col-md-11">
						<input type="file" name="filename" size="50%">
						</div>
						</td>
					</tr>
					<tr>
						<td>
						<div class="col-md-2" align="left">
						<button type="button" class="btn btn-default" onclick="location.href='NoticeList.do'">목록으로</button>
						</div>
						<div class="col-md-8">
						<button type="submit" class="btn btn-default">등록</button>&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-default">다시 작성</button>
						</div>
						<div class="col-md-2"></div>
						</td>
					</tr>
				</table>
				</form>
			</div>
			</div><!-- col-md-offset-1 col-md-10 col-md-offset-1 -->
			</div><!-- row -->
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