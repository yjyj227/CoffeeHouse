function loginCheck(){
	if(document.login.mem_id.value==""){
		alert("아이디를 입력하세요.");
		document.login.mem_id.focus();
		return; //return false;
	}
	if(document.login.mem_passwd.value==""){
		alert("비밀번호를 입력하세요.");
		document.login.mem_passwd.focus();
		return;
	}
	document.login.submit();
}
//회원가입창으로 전환
function memberReg(){
	document.location="Agreement.jsp"
}

function inputCheck(){
	if(document.regForm.mem_id.value==""){
		alert("아이디를 입력하세요.");
		document.regForm.mem_id.focus();
		return;
	}
	if(document.regForm.mem_passwd.value==""){
		alert("비밀번호를 입력하세요.");
		document.regForm.mem_passwd.focus();
		return;
	}
	if(document.regForm.mem_repasswd.value==""){
		alert("비밀번호를 다시 입력하세요");
		document.regForm.mem_repasswd.focus();
		return;
	}
	if(document.regForm.mem_passwd.value != document.regForm.mem_repasswd.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.mem_repasswd.focus();
		return;
	}
	if(document.regForm.mem_name.value==""){
		alert("이름을 입력하세요.");
		document.regForm.mem_name.focus();
		return;
	}
	if(document.regForm.mem_email.value==""){
		alert("이메일을 입력하세요.");
		document.regForm.mem_email.focus();
		return;
	}
	if(document.regForm.mem_phone.value==""){
		alert("전화번호를 입력하세요.");
		document.regForm.mem_phone.focus();
		return;
	}
	
	if(document.regForm.mem_prefer.value=="0"){
		alert("선호커피를 선택하세요.");
		document.regForm.mem_prefer.focus();
		return;
	}
	
	
	document.regForm.submit();
}

//중복ID체크 해주는 자바스크립트함수 선언
function idCheck(id){
   if (id=="") {
		alert("아이디를 먼저 입력하세요!");
		document.regForm.mem_id.focus(); //document.폼객체명.입력양식객체명.함수명(~)
	}else { //입력했다면 jsp파일에게 매개변수로 전달->checkId(id)
		url="IdCheck.jsp?mem_id="+id; //request.getParameter("mem_id");가 null이 나오면 =을 안 쓴 것(전달이 되지 않아서)
		window.open(url, "post", "left=450, top=150, width=300, height=150");
	}
}
//우편번호를 검색해주는 함수선언
function zipCheck(){
    //check=y ->검색 전의 창의 모습을 구분하는 인자(매개변수로 지정해서 전달하기 위해서)
    //menubar(메뉴바), status(상태바), scrollbars(스크롤기능), toolbar=yes|no
    url="ZipCheck.jsp?check=y";
    window.open(url, "post", "left=400, top=220, width=500, height=300,"+"menubar=no, status=yes, toolbar=no, scrollbars=yes");
}

//정말 탈퇴할 건지 묻기
function deleteCheck() {
	const result=confirm("정말 탈퇴하시겠습니까?");
	
	if (result) {
		location.href="DeleteCheckForm.jsp?mem_id=<%=mem_id%>";
	} else {
		history.back();
	}
}



