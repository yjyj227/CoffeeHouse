package chbeans;

import java.sql.*;
import java.util.*;
import chbeans.*;

public class CommentDAO {

	private DBConnectionMgr pool=null; //1. 연결객체선언
	//공통
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private String sql="";
	
	//2, 생성자 통해서 연결
	public CommentDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool=>"+pool);
		}catch (Exception e) {
			System.out.println("DB접속 오류=>"+e);
		}
	}
	
	
	//댓글 불러오기
	public List<CommentDTO> getComment(int num) {
		
		List<CommentDTO> commentList=new ArrayList<CommentDTO>();
		
		try {
			con=pool.getConnection();
			sql="select * from chnoticecomment where num=? order by cref asc, cre_step asc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					CommentDTO comment=new CommentDTO();
					comment.setCnum(rs.getInt("cnum"));
					comment.setCid(rs.getString("cid"));
					comment.setCpasswd(rs.getString("cpasswd"));
					comment.setCcontent(rs.getString("ccontent"));
					comment.setCreg_date(rs.getTimestamp("creg_date"));
					comment.setNum(rs.getInt("num"));
					comment.setCref(rs.getInt("cref"));
					comment.setCre_step(rs.getInt("cre_step"));
					comment.setCre_level(rs.getInt("cre_level"));
					commentList.add(comment);
				}while (rs.next());
			}
		}catch (Exception e) {
			System.out.println("getComment() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return commentList;
	}
	
	
	
	
	
	
	
	
	
}
