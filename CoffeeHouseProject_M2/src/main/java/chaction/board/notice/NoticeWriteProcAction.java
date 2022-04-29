package chaction.board.notice;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.*;
import java.sql.Timestamp;

import chaction.CommandAction;

public class NoticeWriteProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String mem_id=(String)session.getAttribute("idKey"); //Object이기 때문에 String으로 형변환 해줘야함
		String mem_passwd=(String)session.getAttribute("pwKey");
		System.out.println("NoticeWriteProc.do의 mem_id=>"+mem_id);
		
		BoardDTO article=new BoardDTO();
		
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setId(request.getParameter("id"));
		article.setPasswd(request.getParameter("passwd"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		article.setFilename(request.getParameter("filename"));
		//article.setFilesize(Integer.parseInt(request.getParameter("filesize")));
		
		BoardDAO dbPro=new BoardDAO();
		dbPro.insertArticle(article);
		
		return "/board/notice/NoticeWriteProc.jsp";
	}

}
