package chaction.board.notice;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.*;

import chaction.CommandAction;

public class NoticeDeleteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		System.out.println("NotiveDeleteFormAction의 num=>"+num+", pageNum=>"+pageNum);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		
		return "/board/notice/NoticeDeleteForm.jsp";
	}

}
