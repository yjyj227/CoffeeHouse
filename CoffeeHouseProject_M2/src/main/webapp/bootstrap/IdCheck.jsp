<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chhewon.MemberDAO"%>
<%
	//소스를 변경해도 바로 반영이 안 되는 이유->서버에서 기본적으로 전의 페이지를 불러오기 때문
	response.setHeader("Cache-Control", "no-cache"); //요청시 메모리에 저장X
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0); //보관기간 0->보관하지 마라
%>
<%
	//script.js(idCheck(id))->IdCheck.jsp?mem_id='nup'
	String mem_id=request.getParameter("mem_id");
	System.out.println("IdCheck.jsp의 mem_id=>"+mem_id);
	MemberDAO memMgr=new MemberDAO();
	boolean check=memMgr.checkId(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 체크</title>
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
	text-align:center;
}
form {
	border-top:2px solid rgb(206, 151, 139);
	border-bottom:2px solid rgb(206, 151, 139);
}
.buttons {
	display:block;
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
<br>
<center>
<br>
<b><%=mem_id %></b>
<%
	if (check) { //이미 아이디가 존재
		out.println("는 이미 존재하는 아이디입니다.<p>");
	}else { //false->존재하는 아이디가 아님
		out.println("는 사용 가능한 아이디입니다.<p>");
	}
%>
<br>
<a href="#" onclick="self.close()">닫기</a><!-- self(열려있는 창을 가리킴) -->
</center>
</body>
</html>