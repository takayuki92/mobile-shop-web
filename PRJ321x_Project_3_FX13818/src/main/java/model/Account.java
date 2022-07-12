package model;

public class Account {
	private String usr, pwd;
	private int role;
	private String phone, address, name;
	private int check;
	private String message;
	
	public Account() {};
	
	public Account(String usr, String pwd, int role, String name, String address,
		String phone, int check, String message) {
		this.usr = usr;
		this.name = name;
		this.pwd = pwd;
		this.role = role;
		this.address = address;
		this.phone = phone;
		this.check = check;
		this.message = message;
	}
	
	public Account(String usr, String pwd, int role, String name, String address,
			String phone) {
			this.usr = usr;
			this.pwd = pwd;
			this.role = role;
			this.name = name;
			this.address = address;
			this.phone = phone;			
		}
	
	
	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}
	
	public String getMessage() {
		if(message == "syntax-error") {
			return "Invalid syntax";
		} else if (message == "usr-pwd") {
			return "wrong user name or password";
		} else {
		return "No error found";
		}
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean validate() {		
		return true;
	}
	
	public String toString() {
		return "Username: "+getUsr()+ ", Password: "+getPwd()+", Name: "+getName() + ", Role: "+ getRole();
	}
}
