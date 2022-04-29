package chaction.member;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.*;

import chaction.CommandAction;

public class MemberUpdateProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		MemberDTO memUP=new MemberDTO();
		System.out.println("regmem=>"+memUP);
		
		String mem_id=request.getParameter("mem_id");
		
		memUP.setMem_id(request.getParameter("mem_id"));
		memUP.setMem_passwd(request.getParameter("mem_passwd"));
		memUP.setMem_name(request.getParameter("mem_name"));
		memUP.setMem_email(request.getParameter("mem_email"));
		memUP.setMem_phone(request.getParameter("mem_phone"));
		memUP.setMem_address(request.getParameter("mem_address"));
		memUP.setMem_prefer(request.getParameter("mem_prefer"));
		
		MemberDAO memMgr=new MemberDAO();
		boolean check=memMgr.memberUpdate(memUP);
		System.out.println("MemberUpdateProcAction의 check=>"+check);
		
		request.setAttribute("check", new Boolean(check));
		request.setAttribute("mem_id", new String(mem_id)); //id값을 서버에 저장하기 위해 session처리를 한 것
    	
		return "/member/MemberUpdateProc.jsp";
	}

}
