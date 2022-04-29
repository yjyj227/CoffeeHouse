package chaction.member;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.MemberDAO;

import chaction.CommandAction;

public class IdCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		response.setHeader("Cache-Control", "no-cache"); //요청시 메모리에 저장X
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0); //보관기간 0->보관하지 마라
		
		String mem_id=request.getParameter("mem_id");
		System.out.println("IdCheck.jsp의 mem_id=>"+mem_id);
		MemberDAO memMgr=new MemberDAO();
		boolean check=memMgr.checkId(mem_id);
		
		request.setAttribute("check", new Boolean(check));
		
		return "/member/IdCheck.jsp";
	}

}
