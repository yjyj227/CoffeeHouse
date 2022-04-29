<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, chhewon.*"%>
<!DOCTYPE html>
<jsp:useBean id="memMgr" class="chhewon.MemberDAO" />
<%
	//script.js=>ZipCheck()=>ZipCheck.jsp?check=y
	request.setCharacterEncoding("utf-8");
	String check=request.getParameter("check"); //y->n
	String area3=request.getParameter("area3"); //null->"미아2동"
	System.out.println("ZipCheck.jsp의 check=>"+check+", area3=>"+area3);
	
	ArrayList<ZipcodeDTO> zipcodeList=memMgr.zipcodeRead(area3);
	int totalList=zipcodeList.size();
	System.out.println("검색된 총 레코드 수(totalList)=>"+totalList);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호 검색</title>
<link href="style.css" rel="stylesheet"
         type="text/css">
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
input {
	background-color:rgb(56, 46, 43);
}
	</style>
<script>
//동이름을 체크할 함수선언
  function dongCheck(){
	  if(document.zipForm.area3.value==""){
		  alert("동이름을 먼저 입력하세요!");
		  document.zipForm.area3.focus();
		  return;
	  }
	  document.zipForm.submit(); //ZipCheck.jsp
  }
  //검색된 레코드 중에서 내 주소와 가장 가까운 주소의 링크를 클릭
  //형식) Register.jsp(부모창)의 특정 항목에 값을 넣어주는 함수
  //opener=>부모창을 가리키는 예약어 <-> 자식창(self or this)
  //형식2) opener.document.폼객체명.입력양식.속성=값
  function sendAddress(zipcode, area1, area2, area3, area4) {
	  var address=area1+" "+area2+" "+area3+" "+area4;
	  opener.document.regForm.mem_zipcode.value=zipcode; //우편번호
	  opener.document.regForm.mem_address.value=address; //주소
	  self.close(); //self=>ZipCheck.jsp창(자식창)
  }
</script>
</head>
<body>
  <center><br>
    <b>우편번호 찾기</b>
    <table>
  
   <form name="zipForm" method="post" action="ZipCheck.jsp">
        <tr>
        <td><br>
        동 이름 입력 : <input type="text" name="area3" color="black">
        <input type="button" value="검색" onclick="dongCheck()">
        </td>
        </tr>    
        <!-- post방식 중에서 값을 입력하지 않고도 전달시키는 방법 -->
        <!-- <input type="hidden" name="전달할 매개변수명" value="전달할 값"> -->
        <input type="hidden" name="check" value="n">
   </form>
   <%
   //검색어를 입력하고 검색버튼을 누른 경우
   if (check.equals("n")) {
	   if (zipcodeList.isEmpty()) { //검색된 레코드가 없다면
		   //if(zipcodeList.size()==0) {
   %>
      <tr><td align="center">
            <br>검색된 레코드가 없습니다.
          </td>
      </tr>
      <%}else { %>
   <tr><td align="center"><br>
   *검색 후 ,아래 우편번호를 클릭하면 자동으로
     입력됩니다</td></tr>
     <%
     	for (int i=0; i<totalList; i++) {
     		ZipcodeDTO zipBean=zipcodeList.get(i); //벡터라면 zipcodeList.elementAt(i);
     		String tempZipcode=zipBean.getZipcode(); //우편번호
     		String tempArea1=zipBean.getArea1().trim(); //시->"서울    "=>"서울" 빈 문자 제거해줘야 함
     		String tempArea2=zipBean.getArea2().trim(); //구
     		String tempArea3=zipBean.getArea3().trim(); //동
     		String tempArea4=zipBean.getArea4().trim(); //나머지 주소
     %>
  <tr><td>
  	<a href="JavaScript:sendAddress('<%=tempZipcode%>',
  									'<%=tempArea1%>',
  									'<%=tempArea2%>',
  									'<%=tempArea3%>',
  									'<%=tempArea4%>')">
  	<%=tempZipcode%>&nbsp;<%=tempArea1%>&nbsp;<%=tempArea2%>&nbsp;<%=tempArea3%>&nbsp;<%=tempArea4%>
  </a><br>
 <%
     	}//for
	   }//inner(else)
   }//if (check.equals("n")) {
 
 %>
    </td></tr>
    <tr><td align="center"><br>
<a href="JavaScript:this.close()">닫기</a>                      
    </table>
  </center>
</body>
</html>