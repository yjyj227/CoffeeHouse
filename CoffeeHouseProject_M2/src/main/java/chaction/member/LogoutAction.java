package chaction.member;

import javax.servlet.http.*;
import javax.servlet.jsp.*;

import chaction.CommandAction;

public class LogoutAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		session.invalidate();
		
		return "/member/Logout.jsp";
	}

}
