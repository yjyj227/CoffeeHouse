package chaction.board.notice;

import javax.servlet.http.*;
import javax.servlet.jsp.*;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import chbeans.BoardDTO;
import chbeans.BoardDAO;

import chaction.CommandAction;

public class NoticeListAction2 implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String pageNum=request.getParameter("pageNum");
		//추가(검색분야, 검색어)
		String search=request.getParameter("search"); //검색분야
		String searchtext=request.getParameter("searchtext"); //검색
		System.out.println("NoticeListAction에서의 매개변수 확인");
		System.out.println("pageNum=>"+pageNum+", search=>"+search+", searchtext=>"+searchtext);
		
		int count=0; //총 레코드수
		List<BoardDTO> articleList=null; //화면에 출력할 레코드를 저장할 변수
		
		BoardDAO dbPro=new BoardDAO();
		count=dbPro.getArticleSearchCount(search, searchtext); //select count(*) from board->member
		System.out.println("현재 레코드수(count)=>"+count);
		//1. 화면에 출력할 페이지번호   2. 출력할 레코드 개수
		Hashtable<String, Integer> pgList=dbPro.pageList(pageNum, count);
		if (count > 0) {
			System.out.println(pgList.get("startRow")+", "+pgList.get("endRow"));
			articleList=dbPro.getBoardArticles(pgList.get("startRow"), pgList.get("endRow"), search, searchtext);
			
			System.out.println("NoticeListAction의 articleList=>"+articleList);
		}else {
			articleList=Collections.EMPTY_LIST; //비어있는 List객체
		}
		
		//2. 처리한 결과를 공유(서버 메모리에 저장)=>이동할 페이지에 공유해서 사용(request)
		request.setAttribute("search", search); //${search}
		request.setAttribute("searchtext", searchtext); //
		request.setAttribute("pgList", pgList); //10개의 페이징 처리 정보
		request.setAttribute("articleList", articleList); //출력할 레코드값들 ${articleList}
		
		//3. 공유해서 이동할 수 있도록 페이지를 지정
		return "/board/notice/NoticeList.jsp";
	}

}
