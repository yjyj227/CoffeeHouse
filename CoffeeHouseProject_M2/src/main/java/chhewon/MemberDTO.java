package chhewon;

public class MemberDTO {
	private String mem_id;
	private String mem_passwd;
	private String mem_name;
	private String mem_email;
	private String mem_phone;
	private String mem_zipcode;
	private String mem_address;
	private String mem_prefer;
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id.trim();
	}
	public void setMem_passwd(String mem_passwd) {
		this.mem_passwd = mem_passwd.trim();
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public void setMem_prefer(String mem_prefer) {
		this.mem_prefer = mem_prefer;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public String getMem_passwd() {
		return mem_passwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public String getMem_address() {
		return mem_address;
	}
	public String getMem_prefer() {
		return mem_prefer;
	}
	
	
}
