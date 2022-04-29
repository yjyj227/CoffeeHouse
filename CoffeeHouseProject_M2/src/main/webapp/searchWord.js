/**
	xhr객체를 생성->요청->jsp로 요청->응답->콜백함수를 실시간으로 출력하는 구문
 	작성자:홍길동
 	작성일:2022.1.28
 */
 var xhrObject=null; //xhr객체를 저장할 변수(전역변수의 성격)
	
//1. xhr객체를 생성해주는 함수=>$.ajax
function createXHR() {
	if (window.XMLHttpRequest) {
		xhrObject=new XMLHttpRequest(); //객체를 생성->반환
		//alert(xhrObject);
	}
}
	
//2. 중복 id를 입력
function idCheck(id) {
	if (id=="") { //입력하지 않은 경우
		//var mem_id=document.getElementById("ducheck");
		var mem_id=$("docheck");
		//alert(mem_id);
		$("docheck").innerHTML="<font color='red'><b>아이디를 먼저 입력하세요.</b></font>";
		//document.regForm.mem_id.focus();=>document.폼객체명.입력양식객체명.함수명()
		$(mem_id).focus();
		return false;
	}
	//입력했을 경우 Ajax 요청
	//1. xhr객체 얻어오기
	createXHR();
	var url="http://localhost:8090/JspMember/IdCheck.do?"+getParameterValues()
	//2. 콜백함수 지정
	xhrObject.onreadystatechange=resultProcess;
	//3. open함수를 이용해서 서버에 요청준비
	xhrObject.open("Get", url, true);
	//4. 서버에 send()를 이용해서 요청
	xhrObject.send(null);
}

//3. 파라미터값을 처리해주는 함수=>서버의 메모리 캐시를 제거시키는 역할
function getParameterValues() {
	var mem_id=$("mem_id").value; //document.regForm.mem_id.value;
	//서버캐시에 요청메모리에 저장하지 않는 방법->항상 동일한 url 경로를 지정X
	return "mem_id="+mem_id+"&timestamp="+new Date().getTime();
}

//4. 콜백함수
function resultProcess() {
	//alert("resultProcess");
	if (xhrObject.readyState==4) { //서버가 요청을 다 받았다면
		if (xhrObject.status==200) { //서버로부터 정상적으로 결과를 받았다면
			var result=xhrObject.responseText; //태그+문자열->xml형식으로 전달받음
			//alert(result);
			$("docheck").innerHTML=result;
		}
	}
}














