package chbeans;

import java.io.File;
import java.sql.*;
import java.util.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import chbeans.*;

public class BoardDAO {
	
	private DBConnectionMgr pool=null; //1. 연결객체선언
	//공통
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private String sql="";
	
	//2, 생성자 통해서 연결
	public BoardDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool=>"+pool);
		}catch (Exception e) {
			System.out.println("DB접속 오류=>"+e);
		}
	}
	
	private BoardDTO makeArticleFromResult() throws Exception {
		BoardDTO article=new BoardDTO();
		
		article.setNum(rs.getInt("num"));
		article.setId(rs.getString("id"));
		article.setPasswd(rs.getString("passwd"));
		article.setSubject(rs.getString("subject"));
		article.setContent(rs.getString("content"));
		article.setReg_date(rs.getTimestamp("reg_date"));
		article.setReadcount(rs.getInt("readcount")); //조회수 default->0
		article.setRef(rs.getInt("ref"));
		article.setRe_step(rs.getInt("re_step"));
		article.setRe_level(rs.getInt("re_level"));
		article.setFilename(rs.getString("filename"));
		article.setFilesize(rs.getInt("filesize"));
		
		return article;
	}
	
	//3. 메서드 작성(페이징 처리를 위한)=>총 레코드 수(=총 게시물 수=총 회원 수)
	public int getArticleCount() {
		int x=0;
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			sql="select count(*) from chnoticeboard";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				x=rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println("getArticleCount() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	
	//----------검색어에 해당되는 총 레코드 수를 구하는 메서드(1. 검색분야   2. 검색어)
		public int getArticleSearchCount(String search, String searchtext) { //getmemberCount()->MemberDAO에서 작성
			int x=0;
			try {
				con=pool.getConnection();
				System.out.println("con=>"+con);
				//------------------------------------
				if (search==null || search=="") { //검색분야를 선택X
					sql="select count(*) from chnoticeboard";
				}else { //검색분야(제목, 작성자, 제목+본문)
					if (search.equals("subject_content")) { //제목+본문
						sql="select count(*) from chnoticeboard where subject like '%"+
							searchtext+"%' or content like '%"+searchtext+"%' ";
					}else { //제목, 작성자->매개변수를 이용해서 하나의 sql로 통합 가능
						sql="select count(*) from chnoticeboard where "+search+" like '%"+
							searchtext+"%' ";
					}
				}
				System.out.println("getArticleSearchCount 검색어=>"+sql);
				//------------------------------------
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if (rs.next()) { //보여주는 결과가 있다면
					x=rs.getInt(1); //변수명=rs.get자료형(필드명 또는 인덱스번호)=>여기서는 필드명X(필드명이 없기 때문)
					System.out.println("검색된 총 레코드 수=>"+x);
				}
			}catch (Exception e) {
				System.out.println("getArticleSearchCount() 에러발생=>"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return x;
		}
		//------------------------------------------------
	
		
		
		public int getArticleSearchCount(String board, String search, String searchtext) { //getmemberCount()->MemberDAO에서 작성
			int x=0;
			try {
				con=pool.getConnection();
				System.out.println("con=>"+con);
				//------------------------------------
				if (search==null || search=="") { //검색분야를 선택X
					sql="select count(*) from "+board;
				}else { //검색분야(제목, 작성자, 제목+본문)
					if (search.equals("subject_content")) { //제목+본문
						sql="select count(*) from "+board+" where subject like '%"+
							searchtext+"%' or content like '%"+searchtext+"%' ";
					}else { //제목, 작성자->매개변수를 이용해서 하나의 sql로 통합 가능
						sql="select count(*) from "+board+" where "+search+" like '%"+
							searchtext+"%' ";
					}
				}
				System.out.println("getArticleSearchCount2 검색어=>"+sql);
				//------------------------------------
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if (rs.next()) { //보여주는 결과가 있다면
					x=rs.getInt(1); //변수명=rs.get자료형(필드명 또는 인덱스번호)=>여기서는 필드명X(필드명이 없기 때문)
					System.out.println("검색된 총 레코드 수=>"+x);
				}
			}catch (Exception e) {
				System.out.println("getArticleSearchCount() 에러발생=>"+e);
			}finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return x;
		}
		
		
		
		//------------------------
	
	
	//2. 글목록보기에 대한 메서드 구현->레코드 한 개 이상->한 페이지당 10개씩 끊어서 보여준다
	//1) 레코드의 시작 번호  2) 불러올 레코드의 개수(ex 10, 20, 30)
	//public List<MemberDTO> getMemberList(int start, int end) {
	public List<BoardDTO> getArticles(int start, int end) {
		List<BoardDTO> articleList=null;
		
		try {
			con=pool.getConnection();
			/*
			 * 그룹번호가 가장 최신인 글을 중심으로 정렬하되, 만약 level이 같은 경우
			 * step값으로 오름차순을 통해서 몇 번째 레코드번호를 기준으로 몇 개까지 정렬할 것인지 지정해주는 sql구문
			 */
			sql="SELECT * FROM (SELECT chnoticeboard.*, ROWNUM as rn FROM (SELECT * FROM chnoticeboard ORDER BY ref desc, re_step asc) chnoticeboard) WHERE rn BETWEEN ?  AND (? - 1)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start); //mysql은 start-1
			pstmt.setInt(2, start+end); //end-1??
			rs=pstmt.executeQuery();
			if (rs.next()) {
				articleList=new ArrayList(end);
				do {
					BoardDTO article=this.makeArticleFromResult();
					
					articleList.add(article); //데이터 저장
				}while (rs.next());
			}
		}catch (Exception e) {
			System.out.println("getArticles() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return articleList; //NullPointerException 조심
	}
	
	//-------------------------------------------------------------------------
	public List<BoardDTO> getBoardArticles(int start, int end, String search, String searchtext) {
		List<BoardDTO> articleList=null;
		
		try {
			con=pool.getConnection();
			/*
			 * 그룹번호가 가장 최신인 글을 중심으로 정렬하되, 만약 level이 같은 경우
			 * step값으로 오름차순을 통해서 몇 번째 레코드번호를 기준으로 몇 개까지 정렬할 것인지 지정해주는 sql구문
			 */
			if (search==null || search=="") {
			sql="select * from (select chnoticeboard.*, rownum as rn from (select * from chnoticeboard ORDER BY ref desc, re_step asc) chnoticeboard) where rn >= ? and rn <= ?";
			}else { //제목+본문
				if (search.equals("subject_content")) { //제목+본문
					sql="select * from (select chnoticeboard.*, rownum as rn from (select * from chnoticeboard "+"where subject like '%"+searchtext+"%' or content like '%"+searchtext+"%') chnoticeboard) where rn >= ? and rn <= ?";
				}else {
					sql="select * from (select chnoticeboard.*, rownum as rn from (select * from chnoticeboard "+" where "+search+" like '%"+searchtext+"%') chnoticeboard) where rn >= ? and rn <= ?";
				}
			}
			System.out.println("getBoardArticles()의 sql=>"+sql);
			//-------------------------------------------------------
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start); //mysql은 start-1
			pstmt.setInt(2, end); //end-1??
			rs=pstmt.executeQuery();
			if (rs.next()) {
				articleList=new ArrayList(end);
				do {
					BoardDTO article=this.makeArticleFromResult();
					
					articleList.add(article); //데이터 저장
				}while (rs.next());
			}
		}catch (Exception e) {
			System.out.println("getBoardArticles() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return articleList; //NullPointerException 조심
	}
	
	//3. 페이징 처리 계산 정리해주는 메서드(NoticeListAction)+list.jsp
	//Hashtable=>페이징 처리에 관련된 처리결과를 저장할 변수들을 하나의 객체에 담아서 반환
	public Hashtable pageList(String pageNum, int count) {

		//1. 페이징 처리 결과를 저장할 Hashtable객체를 선언
		Hashtable<String, Integer> pgList=new Hashtable<String, Integer>();
		
		int pageSize=10; //numPerPage=>페이지당 보여주는 게시물 수(=레코드 수) default:10
		int blockSize=10; //pagePerBlock=>블럭당 보여주는 페이지수 default:10
	
		//게시판을 맨 처음 실행시키면 무조건 1페이지부터 출력->가장 최근의 글이 나오기 때문
		if (pageNum==null) {
			pageNum="1"; //default(무조건 1페이지는 선택하지 않아도 보여줘야 하기 때문)
		}
		int currentPage=Integer.parseInt(pageNum); //"1"->1(=nowPage)(현재 페이지)
		//				(1-1)*10+1=1, (2-1)*10+1=11, (3-1)*10+1=21
		int startRow=(currentPage-1)*pageSize+1; //시작 레코드 번호
		int endRow=currentPage*pageSize; //1*10=10, 2*10=20, 3*10=30
		int number=0; //beginPerPage->페이지별로 시작하는 맨 처음에 나오는 게시물번호
		System.out.println("현재 레코드 수(count)=>"+count);
		number=count-(currentPage-1)*pageSize;
		System.out.println(currentPage+"페이지별 number=>"+number);
		//모델1의 list.jsp 페이징 처리 복사
		//				122/10=12.2+1.0=13.2=13
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		//2. 시작페이지 @@@@중요@@@@
		int startPage=0;
		if (currentPage%blockSize!=0) { //페이지 수가 1~9, 11~19. 21~29 (10의 배수가 아닌 경우)
			startPage=currentPage/blockSize*blockSize+1; //경계선 때문에
		}else { //10%10=0(10,20,30,40,,,)
					 // ((10/10)-1)*10+1=1
			startPage=((currentPage/blockSize)-1)*blockSize+1;
		}
		//종료페이지
		int endPage=startPage+blockSize-1; //1+10-1=10, 2+10-1=11
		System.out.println("startPage=>"+startPage+", endPage=>"+endPage);
		//블럭별로 구분해서 링크 걸어서 출력(마지막 페이지 > 총 페이지 수  면 안 됨... 같아야 함)
		//11>10=>endPage=10
		if (endPage > pageCount) endPage=pageCount; //마지막 페이지=총 페이지 수  이도록 만들어주기
		//페이징 처리에 대한 계산결과->Hashtable, HashMap=>ListAction에 전달->list.jsp
		pgList.put("pageSize", pageSize); // <->pgList(키명)("pageSize")
		pgList.put("blockSize", blockSize);
		pgList.put("currentPage", currentPage);
		pgList.put("startRow", startRow);
		pgList.put("endRow", endRow);
		pgList.put("count", count);
		pgList.put("number", number);
		pgList.put("startPage", startPage);
		pgList.put("endPage", endPage);
		pgList.put("pageCount", pageCount);
		
		return pgList;
	}
	
	
	
	
	
	
	
	
	//----------------------------------------------------------
	
	
	//게시판의 글쓰기 및 답변글 쓰기
	public void insertArticle(BoardDTO article) {
		//1. article->신규글인지 답변글(기존 게시물 번호)인지 확인
		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		
		int number=0; //데이터를 저장하기 위한 게시물 번호(=new)
		System.out.println("insertArticle()메서드 내부 num=>"+num);
		System.out.println("ref=>"+ref+", re_step=>"+re_step+", re_level=>"+re_level);
		
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			sql="select max(num) from chnoticeboard";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				number=rs.getInt(1)+1; //최대값+1
				System.out.println("글 번호(number)=>"+number);
			}else {
				number=1;
			}
			con.commit();
			//답변글이라면(게시글번호가 양수이면서 1 이상인 경우)
			if (num!=0) {
				//같은 그룹번호를 가지고 있으면서(ref=?) 나보다 step값이 큰 게시물(re_step>?)을 찾아서 그 step 하나 증가
				/*
				sql="update chnoticeboard set re_step=re_step+1 where ref=? and re_step > ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				int update=pstmt.executeUpdate();
				con.commit();
				System.out.println("댓글수정여부(update)=>"+update+" //(1성공 0실패)"); //1성공 0실패
				*/
				//답변글
				re_step=re_step+1;
				re_level=re_level+1;
				con.commit();
			}else { //신규글이라면 num=0
				ref=number;
				re_step=0;
				re_level=0;
				con.commit();
			}
			sql="insert into chnoticeboard(num, id, passwd, subject, reg_date,";
			sql+=" ref, re_step, re_level, content, filename, filesize) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, number); //article.getNum()이 아니었음
			pstmt.setString(2, article.getId());
			pstmt.setString(3, article.getPasswd());
			pstmt.setString(4, article.getSubject());
			
			pstmt.setTimestamp(5,  article.getReg_date());
			
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getFilename());
			
			pstmt.setInt(11, article.getFilesize());
			
			int insert=pstmt.executeUpdate();
			con.commit();
			System.out.println("게시판 글쓰기 성공여부(insert)=>"+insert+" //(1성공 0실패)");
		}catch (Exception e) {
			System.out.println("insertArticle()메서드 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	
	
	
	
	
	
	//글 상세보기
	public BoardDTO getArticle(int num) {
		
		BoardDTO article=null;
		
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			
			sql="update chnoticeboard set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			int update=pstmt.executeUpdate();
			con.commit();
			System.out.println("조회수 증가여부(update)=>"+update+" //(1성공 0실패)");
			
			sql="select * from chnoticeboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if (rs.next()) { //보여주는 결과가 있다면
				article=this.makeArticleFromResult();
				con.commit();
			}
		}catch (Exception e) {
			System.out.println("getArticle() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return article;
	}
	
	//글수정
	//1) 수정할 데이터를 찾을 메서드 필요->select * from board where num=?
	public BoardDTO updateGetArticle(int num) {
		BoardDTO article=null;
		
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			sql="select * from chnoticeboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				article=makeArticleFromResult();
				con.commit();
			}
		}catch (Exception e) {
			System.out.println("updateGetArticle() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return article;
	}
	//2) 수정해주는 메서드
	public int updateArticle(BoardDTO article) {
		String dbpasswd=""; //--->>>>>로그인한 id와 글에 저장된 id가 같으면 비밀번호 입력 없이 삭제되게 하고 싶음
		int x=-1; //게시물 수정여무 1성공 0실패
		
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			sql="select passwd from chnoticeboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, article.getNum());
			rs=pstmt.executeQuery();
			con.commit();
			if (rs.next()) {
				dbpasswd=rs.getString("passwd");
				System.out.println("dbpasswd=>"+dbpasswd);
				//dbpasswd(db상에 저장된 아이디)==passwd
				System.out.println("updateArticle() 내부 암호 확인중");
				System.out.println("article.getPasswd()=>"+article.getPasswd());
				if (dbpasswd.equals(article.getPasswd())) {
					sql="update chnoticeboard set subject=?, content=? where num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, article.getSubject());
					pstmt.setString(2, article.getContent());
					pstmt.setInt(3, article.getNum());
					
					int update=pstmt.executeUpdate();
					con.commit();
					System.out.println("게시판 글수정 성공여부(update)=>"+update+" //(1성공 0실패)");
					x=1; //수정성공
				}else { //암호가 틀린 경우
					x=0;
				}
			}else { //암호가 존재하지 않는 경우
				x=-1;
			}
		}catch (Exception e) {
			System.out.println("updateArticle() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	//게시물 삭제->delete from chnoticeboard where num=?
	public int deleteArticle(int num, String passwd) {
		String dbpasswd="";
		int x=-1;
		
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			sql="select passwd from chnoticeboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			con.commit();
			//암호를 찾았다면
			if (rs.next()) {
				dbpasswd=rs.getString("passwd");
				System.out.println("dbpasswd=>"+dbpasswd);
				//dbpasswd==passwd
				
				sql="delete from chnoticeboard where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
					
				int delete=pstmt.executeUpdate();
				con.commit();
				System.out.println("게시판 글삭제 성공여부=>"+delete+" //(1성공 0실패)");
				x=1;
			}else {
				x=0;
			}
		}catch (Exception e) {
			System.out.println("deleteArticle() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	
	/* 댓글 */
	/*
	//댓글작성
	public void addComment(CommentDTO comment) {
		
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			
			System.out.println("comment.getId()=>"+comment.getId());
			System.out.println("comment.getPasswd()=>"+comment.getPasswd());
			System.out.println("comment.getContent()=>"+comment.getContent());
			System.out.println("comment.getReg_date()=>"+comment.getReg_date());
			System.out.println("comment.getNum()=>"+comment.getNum());
			
			//데이터 추가
			sql="insert into chnoticecomment(id, passwd, content, reg_date, num) values(?, ?, ?, ?, ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, comment.getId());
			pstmt.setString(2, comment.getPasswd());
			pstmt.setString(3, comment.getContent());
			pstmt.setTimestamp(4, comment.getReg_date());
			pstmt.setInt(5, comment.getNum());
			
			int reply=pstmt.executeUpdate();
			con.commit();
			System.out.println("댓글 작성 성공 유무(reply)=>"+reply+" //(1성공 0실패)");
		}catch (Exception e) {
			System.out.println("addComment()메서드 에러 발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	//댓글조회
	public List getComment(int num) {
		
		List commentList=null; //찾은 레코드를 담을 객체 선언
		
		try {
			con=pool.getConnection();
			sql="select * from chnoticecomment where num=?";
			pstmt=con.prepareStatement(sql);
			System.out.println("getComment()의 sql=>"+sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				commentList=new ArrayList();
				do {
					CommentDTO comment=new CommentDTO();
					comment.setCnum(rs.getInt("cnum"));
					comment.setId(rs.getString("id"));
					comment.setPasswd(rs.getString("passwd"));
					comment.setContent(rs.getString("content"));
					comment.setReg_date(rs.getTimestamp("reg_date"));
					comment.setNum(rs.getInt("num"));
					
					commentList.add(comment);
					con.commit();
				}while (rs.next());
			}
		}catch (Exception e) {
			System.out.println("getComment()메서드 에러 발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return commentList;
	}
	
	//댓글수정
	
	
	
	
	//댓글삭제
	public int deleteComment(int cnum) {
		
		int x=-1;
		
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			sql="delete from chnoticecomment where cnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			int delete=pstmt.executeUpdate();
			System.out.println("댓글 삭제 성공 여부(delete)=>"+delete+" //(1성공 0실패)");
			con.commit();
		}catch (Exception e) {
			System.out.println("deleteComment()메서드 에러 발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt);
		}
		
		return x;
	}
	
	
	//??
	public CommentDTO updateArticle(int num) {
		
		CommentDTO article=null;
		
		try {
			con=pool.getConnection();
			sql="select * from chnoticecomment where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			//결과확인
			if (rs.next()) {
				article=new CommentDTO();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setPasswd(rs.getString("passwd"));
				article.setContent(rs.getString("content"));
				article.setReg_date(rs.getTimestamp("reg_date"));
			}
		}catch (Exception e) {
			System.out.println("updateArticle(int num)메서드 에러 발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return article;
	}
	*/
	
	
	
	
	
	
	
}
