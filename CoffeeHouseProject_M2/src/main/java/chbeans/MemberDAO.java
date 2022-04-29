package chbeans;

import java.sql.*;
import java.util.*;

public class MemberDAO {

	//1) 멤버변수에 연결할 클래스의 객체 선언
	private DBConnectionMgr pool=null;
	
	//2. 공통으로 접속할 경우 필요로 하는 멤버변수 선언
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private String sql="";
	
	//2) 생성자를 통해서 자동으로 객체를 얻어올 수 있도록 연결
	public MemberDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool=>"+pool);
		}catch (Exception e) {
			System.out.println("DB연결 실패=>"+e);
		}
	}
	
	//3. 요구분석에 따른 웹상에서 호출할 메서드 작성
	
	//1) 회원로그인
	//select id, passwd from member where id='nup' and passwd='1234';
	public boolean loginCheck(String id, String passwd) {
		//1. DB연결
		boolean check=false;
		//2. SQL 실행->결과
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			sql="select id, passwd from chmember where id=? and passwd=?";
			//pstmt객체 생략->NullPointerException 발생됨
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs=pstmt.executeQuery();
			check=rs.next(); //데이터O->true, x->false
		}catch (Exception e) {
			System.out.println("loginCheck() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check;
	}
	
	//1-2) 관리자로그인
	public boolean adminLoginCheck(String id, String passwd) {
		
		boolean check=false;
		
		try {
			con=pool.getConnection();
			System.out.println("con=>"+con);
			sql="select admin_id, admin_passwd from chadmin where admin_id=? and admin_passwd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs=pstmt.executeQuery();
			check=rs.next();
		}catch (Exception e) {
			System.out.println("adminLoginCheck() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return check;
	}
	
	
	
	
	
	
	
	
	
	
	//2) id 중복체크
	//select id from chmember where id='admin';
	public boolean checkId(String id) {
		boolean check=false;
		//2. sql실행->결과
		try {
			con=pool.getConnection(); //이미 만들어진 Connection객체를 반환
			sql="select id from chmember where id=?"; //제일 먼저 확인
			//pstmt객체 생략->NullPointerException 발생됨
			pstmt=con.prepareStatement(sql); //con.prepareStatement(실행시킬 sql구문)
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			check=rs.next(); //데이터O->true X->false
		}catch (Exception e) {
			System.out.println("checkId() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check; //IdCheck.jsp에서 받아서 존재유무 확인
	}
	
	//3) 우편번호
	//public Vector<ZipcodeDTO>
	/*
	 * public ArrayList<ZipcodeDTO> zipcodeRead(String area3) { //레코드 한 개 이상 담을
	 * 변수(객체) 선언 ArrayList<ZipcodeDTO> zipList=new ArrayList(); try {
	 * con=pool.getConnection(); //select * from zipcode where area3 like '미아2동%';
	 * sql="select * from zipcode1 where area3 like '"+area3+"%'";
	 * pstmt=con.prepareStatement(sql); rs=pstmt.executeQuery();
	 * System.out.println("검색된 sql구문 확인=>"+sql); //검색된 레코드의 값을 필드별로 담는 소스코드->찾은 레코드가
	 * 1개->if(rs.next()) // 1개 이상->while(rs.next()) while (rs.next()) { ZipcodeDTO
	 * tempZipcode=new ZipcodeDTO();
	 * tempZipcode.setZipcode(rs.getString("zipcode")); //우편번호
	 * tempZipcode.setArea1(rs.getString("area1")); //시
	 * tempZipcode.setArea2(rs.getString("area2"));
	 * tempZipcode.setArea3(rs.getString("area3"));
	 * tempZipcode.setArea4(rs.getString("area4")); //ArrayList에 담는 구문을 작성
	 * zipList.add(tempZipcode); } }catch (Exception e) {
	 * System.out.println("zipcodeRead() 에러발생=>"+e); }finally {
	 * pool.freeConnection(con, pstmt, rs); } return zipList; }
	 */
	
	//4) 회원가입->insert into chmember value(?~)
	public boolean memberInsert(MemberDTO mem) {
		boolean check=false;
		//트랜잭션->오라클은 필수!! commit이 자동으로 되지 않음
		try {
			con=pool.getConnection();
			//커밋
			con.setAutoCommit(false); //default->con.setAutoCommit(true);
			//-------------------------------
			sql="insert into chmember values(?, ?, ?, ?, ?, ?, ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mem.getMem_id());
			pstmt.setString(2, mem.getMem_passwd());
			pstmt.setString(3, mem.getMem_name());
			pstmt.setString(4, mem.getMem_email());
			pstmt.setString(5, mem.getMem_phone());
			pstmt.setString(6, mem.getMem_address());
			pstmt.setString(7, mem.getMem_prefer());
			
			int insert=pstmt.executeUpdate(); //반환값 1->성공 / 0->실패
			con.commit(); //실제 테이블에 반영
			System.out.println("insert(데이터 입력유무)=>"+insert);
			if (insert > 0) { //insert==1(성공)
				check=true;
			}
		}catch (Exception e) {
			System.out.println("memberInsert() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt); //select구문이 아니기 때문에 rs(X)
		}
		return check; //memberInsert.jsp에서~
	}
	
	//5) 회원수정->특정 회원 찾기
	//select * from chmember where id='admin'; //매개변수 1개, 반환값 객체인 메서드
	public MemberDTO getMember(String mem_id) {
		MemberDTO mem=null; //id값에 해당되는 레코드 1개를 저장
		try {
			con=pool.getConnection();
			sql="select * from chmember where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mem_id); //책의 방법, sql구문 확인불가
			rs=pstmt.executeQuery();
			//찾은 레코드가 1개->if(rs.next())
			if (rs.next()) {
				//찾은 값->Setter Method의 매개변수로 저장=>웹에 출력=>Getter Method
				mem=new MemberDTO();
				mem.setMem_id(rs.getString("id")); //<%=mem.getMem_id()%>
				mem.setMem_passwd(rs.getString("passwd"));
				mem.setMem_name(rs.getString("name"));
				mem.setMem_email(rs.getString("email"));
				mem.setMem_phone(rs.getString("phone"));
				mem.setMem_address(rs.getString("address"));
				mem.setMem_prefer(rs.getString("prefer"));
			}
		}catch (Exception e) {
			System.out.println("getMember 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return mem;
	}
	
	//6) 찾은 회원을 수정=>회원가입해주는 메서드와 동일(sql구문이 다르다)
	public boolean memberUpdate(MemberDTO mem) {
		boolean check=false;// 회원수정 성공유무
		
		System.out.println("==memberUpdate() 내부==");
		System.out.println("mem.getMem_id()=>"+mem.getMem_id());
		//-------------------------------------------------------
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			//-----------------------
			sql="update chmember set passwd=?, name=?, email=?, phone=?, address=?, prefer=? where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, mem.getMem_passwd());
			pstmt.setString(2, mem.getMem_name());
			pstmt.setString(3, mem.getMem_email());
			pstmt.setString(4, mem.getMem_phone());
			pstmt.setString(5, mem.getMem_address());
			pstmt.setString(6, mem.getMem_prefer());
			pstmt.setString(7, mem.getMem_id());
			
			int update=pstmt.executeUpdate(); //반환값 1(성공), 0(실패)
			con.commit();
			System.out.println("update(데이터 성공유무)=>"+update);
			if (update == 1) {
				check=true;
			}
		}catch (Exception e) {
			System.out.println("memberUpdate() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return check; //memberUpdate.jsp에서 메서드의 반환값
	}
	
	//7) 회원탈퇴
	//select passwd from chmember where id='admin';
	//delete from chmember where id='admin'; //id 매개변수 받아야 함
	public int memberDelete(String id, String passwd) {
		String dbpasswd=""; //DB상에서 찾은 암호를 저장할 변수
		int x=-1; //회원탈퇴유무
		
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			sql="select passwd from chmember where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			//암호를 찾았다면
			if (rs.next()) {
				dbpasswd=rs.getString("passwd");
				System.out.println("dbpasswd=>"+dbpasswd);
				
				if (dbpasswd.equals(passwd)) {
					pstmt=con.prepareStatement("delete from chmember where id=?");
					pstmt.setString(1, id);
					int delete=pstmt.executeUpdate();
					System.out.println("delete(회원탈퇴 성공유무)=>"+delete);
					con.commit();
					x=1; //회원탈퇴 성공
				}else {
					x=0; //회원탈퇴 실패
				}
			}else { //암호가 존재하지 않는 경우
				x=-1;
			}
		}catch (Exception e) {
			System.out.println("memberDelete() 에러발생=>"+e);
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}
	
	
	
}
