package chbeans;

import java.sql.Timestamp; //DB상의 테이블의 필드와 연관이 있는 클래스(날짜와 시간을 설정)

public class BoardDTO {
	
	private int num;
	
	private String id, passwd, subject;
	
	private Timestamp reg_date;
	private int readcount;
	
	private int ref;
	private int re_step;
	private int re_level;
	
	private String content, filename;
	
	private int filesize;
	
	private int c_count; //댓글수 카운트
	
	public void setNum(int num) {
		this.num = num;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
	
	
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getSubject() {
		return subject;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public int getRef() {
		return ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public String getContent() {
		return content;
	}
	public String getFilename() {
		return filename;
	}
	public int getFilesize() {
		return filesize;
	}
}
