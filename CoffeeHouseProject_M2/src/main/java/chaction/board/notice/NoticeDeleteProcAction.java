package chaction.board.notice;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import chbeans.*;


import chaction.CommandAction;

public class NoticeDeleteProcAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String pageNum=request.getParameter("pageNum"); //hidden
		//추가
		String passwd=request.getParameter("passwd"); //입력O //이제 필요 없을듯
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println("NoticeDeleteProcAction의 num=>"+num+", passwd=>"+passwd+", pageNum=>"+pageNum);
		
		BoardDAO dbPro=new BoardDAO();
		int check=dbPro.deleteArticle(num, passwd);
		
		request.setAttribute("pageNum", pageNum); //수정한 레코드가 있는 페이지로 이동
		request.setAttribute("check", check); //${check} 데이터 수정성공유무
		
		return "/board/notice/NoticeDeleteProc.jsp";
	}

}
