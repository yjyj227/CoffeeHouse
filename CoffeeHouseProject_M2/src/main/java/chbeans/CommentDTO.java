package chbeans;

import java.sql.*;

public class CommentDTO {
	private int cnum; //c_idx
	private String cid;
	private String cpasswd;
	private String ccontent;
	private Timestamp creg_date;
	private int num; //b_idx
	private int cref;
	private int cre_step;
	private int cre_level;
	
	
	public int getCnum() {
		return cnum;
	}
	public String getCid() {
		return cid;
	}
	public String getCpasswd() {
		return cpasswd;
	}
	public String getCcontent() {
		return ccontent;
	}
	public Timestamp getCreg_date() {
		return creg_date;
	}
	public int getNum() {
		return num;
	}
	public int getCref() {
		return cref;
	}
	public int getCre_step() {
		return cre_step;
	}
	public int getCre_level() {
		return cre_level;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public void setCpasswd(String cpasswd) {
		this.cpasswd = cpasswd;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public void setCreg_date(Timestamp creg_date) {
		this.creg_date = creg_date;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setCref(int cref) {
		this.cref = cref;
	}
	public void setCre_step(int cre_step) {
		this.cre_step = cre_step;
	}
	public void setCre_level(int cre_level) {
		this.cre_level = cre_level;
	}
	
	
	
	
}
