package chaction.board.notice;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.*;
import java.sql.Timestamp;

import chaction.CommandAction;

public class NoticeUpdateProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String pageNum=request.getParameter("pageNum");
		System.out.println("NoticeUpdateProcAction에서의 pageNum=>"+pageNum);
		
		BoardDTO article=new BoardDTO();
		
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setId(request.getParameter("id"));
		article.setPasswd(request.getParameter("passwd"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		
		BoardDAO dbPro=new BoardDAO();
		int check=dbPro.updateArticle(article);
		
		request.setAttribute("pageNum", pageNum); //수정한 레코드가 있는 페이지로 이동
		request.setAttribute("check", check); //${check} 데이터 수정성공유무
		
		return "/board/notice/NoticeUpdateProc.jsp";
	}

}
