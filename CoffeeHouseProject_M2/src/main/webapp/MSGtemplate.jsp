<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chboard.*, java.util.*, java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="mem_id" value="${sessionScope.idKey}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Movie so good</title>
<!-- 부트스트랩 -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon2.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style>
     /* 네비게이션 */
    #mainNav.navbar-shrink {
	    padding-top: 0.5rem;
	    padding-bottom: 0.5rem;
	    background-color: #212529;
	  }
	  #mainNav.navbar-shrink .navbar-brand img {
	    height: 6rem;
	  }
     .navbar-brand > img {
		 display: block;
		 width:180px;
	}
	#mainNav .navbar-brand img {
	  height: 6rem;
	}
	/* 게시판 배너 크기 */
	.img-fluid {
	  width: 480px;
	  height: 350px;
	}
	  header.masthead {
		 background-image: url("./assets/img/main1.jpg");
	}  
	 .text-lg-start{
	 	color:white;
	 }
	 .link-dark{
	 	color:white;
	 }
	 .link-dark:hover, .link-dark:focus{
	 	color:#d4633d;
	 }
	 .portfolio-caption-heading{
	 	color:white;
	 }
	 /* 게시판배너 호버시 크기조절 */
	 #portfolio .portfolio-item .portfolio-link > img{
		  position: relative;
		  display: block;
		  margin: 0 auto;
		  
		  transform: scale(1);
		  -webkit-transform: scale(1);
		  -moz-transform: scale(1);
		  -ms-transform: scale(1);
		  -o-transform: scale(1);
		  transition: all 0.3s ease-in-out; 
		}
	 #portfolio .portfolio-item .portfolio-link > img:hover{
	 	 transform: scale(1.1);
	  -webkit-transform: scale(1.1);
	  -moz-transform: scale(1.1);
	  -ms-transform: scale(1.1);
	  -o-transform: scale(1.1);
	  overflow:hidden;
	 }
	#portfolio .portfolio-item .portfolio-link .portfolio-hover{
		display:none;
	}
	/* 리모컨 버튼 고정 */
	 .topbutton img {
	   z-index:100;
	   width:50px;
	   height:50px;
	   position:fixed;
	   right:1%;
	   bottom:2%;
	   border-radius:25px;
	}
	/* 슬라이드 조절 */
	.carousel-inner{
		width:124%;
		left:-11%;
	}
	.carousel-item{
		transition-duration:1s;
	}
	.carousel-item img{
		width:100%;
		height:100vh;
	}
	.carousel-caption{
		left:13%;
	}
     </style>
</head>
<body id="page-top" class="bg-dark">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img src="assets/img/msg-logo.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#portfolio">게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="Register.jsp">Sign up</a></li>
                    </ul>
                </div>
            </div>
        </nav>
		
		<header class="Masthead bg-dark"></header>
	
		<section class="page-section bg-dark" id="portfolio">
			<div class="container">
            <a class="topbutton" href="#"><img src="assets/img/topbutton.png"></a>
            
            <div class="row">
			<div class="col-md-offset-1 col-md-10 col-md-offset-1">
			<div class="col-md-12 pagetitle">공지사항</div>
			<div class="col-md-12">
			<c:if test="${pgList.count==0}">
				<table class="table table-hover">
					<tr>
						<td>작성된 글이 없습니다.</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${pgList.count > 0}">
				<table class="table table-hover">
				
					<thead>
						<tr>
							<td width="5%">번호</td><td width="65%">제목</td><td width="10%">작성자</td><td width="15%">작성일</td><td width="5%">조회</td>
						</tr>
					</thead>
					
					<c:set var="number" value="${pgList.number}" />
					<c:forEach var="article" items="${articleList}">
						<tr>
							<td width="5%">
							<c:out value="${number}" />
    						<c:set var="number" value="${number-1}" />
    						</td>
							<td width="65%" align="left">
							
							<c:if test="${article.re_level > 0}">
							<img src="img/level.gif" width="${10*article.re_level}" height="1">
							</c:if>
							<c:if test="${article.re_level==0}">
							<img src="img/level.gif" width="${10*article.re_level}" height="1">
							</c:if>
							
							<a href="NoticeContent.do?num=${article.num}&pageNum=${pgList.currentPage}">${article.subject}</a>
							
							<c:if test="${article.readcount>=20}">
							<!-- <img src="img/hot.gif" border="0" height="16"> -->
							
							</c:if>
							</td>
							<td width="10%">${article.id}</td>
							<td width="15%"><fmt:formatDate value="${article.reg_date}" timeStyle="medium" pattern="yy.MM.dd  hh:mm" /></td>
							<td width="5%">${article.readcount}</td>
						</tr>
				
				</c:forEach>
				</table>
			</c:if>
			</div>
			
			<div class="col-md-12">
			<div class="col-md-1"></div>
			<div class="col-md-10">
			<div class="col-md-12">
			<ul class="pagination">
			
				<c:if test="${pgList.startPage > pgList.blockSize}">
				<li><a href="NoticeList.do?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}"> < </a></li>
				</c:if>
			
				<c:forEach var="i" begin="${pgList.startPage}"	end="${pgList.endPage}">
				<li>
				<a href="NoticeList.do?pageNum=${i}&search=${search}&searchtext=${searchtext}">
				<c:if test="${pgList.currentPage==i}">
					<font color="red"><b>${i}</b></font>
				</c:if>
				<c:if test="${pgList.currentPage!=i}">
					${i}
				</c:if>
				</a>
				</li>
				</c:forEach>
				<!-- 다음 페이지 -->
				<c:if test="${pgList.endPage < pgList.pageCount}">
				<li><a href="NoticeList.do?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}"> > </a></li>
				</c:if>
			
			</ul>
			</div>
			<div class="col-md-12"><!-- 검색기능 -->
			<div class="col-md-offset-2 col-md-8 col-md-offset-2">
				<form action="NoticeList.do" name="bus">
					<div class="col-md-3">
					<select class="form-control" name="search">
						<option value="subject">제목</option>
						<option value="subject_content">제목+본문</option>
						<option value="id">아이디</option>
					</select>
					</div>
					<div class="col-md-7">
					<input type="text" class="form-control" name="searchtext">
					</div>
					<div class="col-md-2">
					<button type="submit" class="btn btn-default">검색</button>
					</div>
				</form>
			</div>
			</div><!-- 검색기능 -->
			
			</div>
			<div class="col-md-1"><!-- 글쓰기버튼 -->
			<c:if test="${!empty mem_id}">
				<c:if test="${mem_id.equals('admin')}">
				<button type="button" class="btn btn-default" onclick="document.location='NoticeWriteForm.do'">글쓰기</button>
				</c:if>
			</c:if>	
			</div><!-- 글쓰기버튼 -->
			</div>
			
			
			
			
			</div><!-- class="col-md-offset-1 col-md-10 col-md-offset-1" -->
		</div><!-- row -->
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            </div>
		</section>




		<!-- Footer-->
        <footer class="footer py-4 bg-dark">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; MSG : Movie So Good 2022</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                    </div>
                </div>
            </div>
        </footer>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="../js/bootstrap.min.js"></script>
</body>
</html>