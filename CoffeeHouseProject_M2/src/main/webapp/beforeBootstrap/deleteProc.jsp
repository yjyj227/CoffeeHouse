<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chhewon.MemberDAO"%>
<%
	String mem_id=request.getParameter("mem_id"); //입력X
	String passwd=request.getParameter("passwd"); //입력O
	
	System.out.println("deleteProc.jsp의 mem_id=>"+mem_id+", passwd=>"+passwd);
	//-------------------------------------------------------------------------
	MemberDAO memMgr=new MemberDAO();
	int check=memMgr.memberDelete(mem_id, passwd); //회원탈퇴 메서드 호출
	System.out.println("deleteProc.jsp의 회원탈퇴성공유무(check)=>"+check); //1탈퇴 0실패
%>
<%
	if (check == 1) {//회원탈퇴 성공했다면 //check가 int이기 때문에 == 1 해주기
		session.invalidate(); //세션종료(메모리 해제)
	%>
	<script>
		alert("회원탈퇴가 완료되었습니다.\n그동안 이용해주셔서 감사합니다.");
		location.href="main.jsp";
	</script>
	<%}else {%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
	<%}%>