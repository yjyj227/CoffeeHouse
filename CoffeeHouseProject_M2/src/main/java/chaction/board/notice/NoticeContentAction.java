package chaction.board.notice;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.*;
import javax.servlet.jsp.*;

import chaction.CommandAction;
import chbeans.BoardDAO;
import chbeans.BoardDTO;
import chbeans.CommentDAO;
import chbeans.CommentDTO;

public class NoticeContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		System.out.println("NoticeContentAction의 pageNum=>"+pageNum+", num=>"+num);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		BoardDAO dbPro=new BoardDAO();
		BoardDTO article=dbPro.getArticle(num);
		
		//String content=article.getContent().replace("\r\n", "<br>");
		//content=content.replace("\r\n", "<br>");
		
		//링크문자열의 길이 줄이기 위해
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		System.out.println("NoticeContent.do의 매개변수 확인");
		System.out.println("ref=>"+ref+", re_step=>"+re_step+", re_level=>"+re_level);
		
		String filename=article.getFilename();
		int filesize=article.getFilesize();
		System.out.println("filename=>"+filename+", filesize=>"+filesize);
		
		
		//2. 실행결과를 서버의 메모리에 저장->request에 저장->jsp ${키명}으로 불러올 수 있도록 공유
		request.setAttribute("num", num); //${num}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article); //${article.ref}, ${article.re_step} ~
		
		
		
		
		//댓글
		int cnum=0, cref=0, cre_step=0, cre_level=0;
		CommentDAO cd=new CommentDAO();
		
		request.setAttribute("cnum", cnum);
		request.setAttribute("cref", cref);
		request.setAttribute("cre_step", cre_step);
		request.setAttribute("cre_level", cre_level);
		
		//댓글작업
		List<CommentDTO> commentList=cd.getComment(num);
		request.setAttribute("commentList", commentList);
		
		
		
		return "/board/notice/NoticeContent.jsp";
	}

}
