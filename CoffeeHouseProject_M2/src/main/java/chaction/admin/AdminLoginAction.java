package chaction.admin;

import javax.servlet.http.*;
import javax.servlet.jsp.*;

import chaction.CommandAction;

public class AdminLoginAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		return "/admin/AdminLogin.jsp";
	}

}
