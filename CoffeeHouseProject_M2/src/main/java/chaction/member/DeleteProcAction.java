package chaction.member;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.MemberDAO;

import chaction.CommandAction;

public class DeleteProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String mem_id=request.getParameter("mem_id"); //입력X
		String passwd=request.getParameter("passwd"); //입력O
		
		System.out.println("DeleteProcAction의 mem_id=>"+mem_id+", passwd=>"+passwd);
		//-------------------------------------------------------------------------
		MemberDAO memMgr=new MemberDAO();
		int check=memMgr.memberDelete(mem_id, passwd); //회원탈퇴 메서드 호출
		System.out.println("DeleteProc.do의 회원탈퇴성공유무(check)=>"+check); //1탈퇴 0실패
		
		request.setAttribute("check", check);
		
		
		return "/member/DeleteProc.jsp";
	}

}
