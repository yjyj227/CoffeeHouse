package chaction.member;

import javax.servlet.http.*;
import javax.servlet.jsp.*;

import chaction.CommandAction;

public class LogErrorAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		return "/member/LogError.jsp";
	}

}
