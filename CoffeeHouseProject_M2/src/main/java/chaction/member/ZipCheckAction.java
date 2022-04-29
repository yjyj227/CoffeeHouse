package chaction.member;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import chbeans.*;

import chaction.CommandAction;

public class ZipCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		return "/member/ZipCheck.jsp";
	}

}
