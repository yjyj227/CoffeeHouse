package chaction.member;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.MemberDTO;

import chaction.CommandAction;

public class RegisterProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		MemberDTO regmem=new MemberDTO();
		System.out.println("regmem=>"+regmem);
		
		regmem.setMem_id(request.getParameter("mem_id"));
		regmem.setMem_passwd(request.getParameter("mem_passwd"));
		regmem.setMem_name(request.getParameter("mem_name"));
		regmem.setMem_email(request.getParameter("mem_email"));
		regmem.setMem_phone(request.getParameter("mem_phone"));
		regmem.setMem_address(request.getParameter("mem_address"));
		regmem.setMem_prefer(request.getParameter("mem_prefer"));
		
		request.setAttribute("regmem", regmem);
		
		return "/member/RegisterProc.jsp";
	}

}
