package chaction.board.notice;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.*;

import chaction.CommandAction;

public class NoticeUpdateFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		System.out.println("NoticeUpdateFormAction에서의 pageNum=>"+pageNum+", num=>"+num);
		
		BoardDAO dbPro=new BoardDAO();
		BoardDTO article=dbPro.updateGetArticle(num);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article); //${article.num}
		
		return "/board/notice/NoticeUpdateForm.jsp";
	}

}
