package chaction.board.notice;

import javax.servlet.http.*;
import javax.servlet.jsp.*;

import chaction.CommandAction;

public class NoticeWriteFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String pageNum=request.getParameter("pageNum");
		
		int num=0, ref=1, re_step=0, re_level=0;

		//noticeContent.jsp에서 매개변수가 전달됨
		if (request.getParameter("num")!=null) {
			num=Integer.parseInt(request.getParameter("num"));
			ref=Integer.parseInt(request.getParameter("ref"));
			re_step=Integer.parseInt(request.getParameter("re_step"));
			re_level=Integer.parseInt(request.getParameter("re_level"));
			System.out.println("NoticeContent.do에서 넘어온 매개변수 확인");
			System.out.println("num=>"+num+", ref=>"+ref+", re_step=>"+re_step+", re_level=>"+re_level);
		}
		
		request.setAttribute("num", num); //${num}
		request.setAttribute("ref", ref); //${ref}
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);
		
		
		
		return "/board/notice/NoticeWriteForm.jsp";
	}

}
