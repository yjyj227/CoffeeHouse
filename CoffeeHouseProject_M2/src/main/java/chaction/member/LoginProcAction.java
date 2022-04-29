package chaction.member;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.MemberDAO;

import chaction.CommandAction;

public class LoginProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String mem_id=request.getParameter("mem_id");
	    String mem_passwd=request.getParameter("mem_passwd");
	    System.out.println("mem_id=>"+mem_id+", mem_passwd=>"+mem_passwd);
	    //->member->MemberDAO객체필요->loginCheck()
	    MemberDAO memMgr=new MemberDAO();
	    boolean loginCheck=memMgr.loginCheck(mem_id, mem_passwd);
	    System.out.println("LoginProc.do의 loginCheck=>"+loginCheck);
		
	    request.setAttribute("loginCheck", new Boolean(loginCheck));
	    request.setAttribute("mem_id", new String(mem_id)); //id값을 서버에 저장하기 위해 session처리를 한 것
    	request.setAttribute("mem_passwd", new String(mem_passwd)); //글에 넣기 위해 서버에 저장
		
		
		
		return "/member/LoginProc.jsp";
	}

}
