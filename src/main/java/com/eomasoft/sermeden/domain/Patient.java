package com.eomasoft.sermeden.domain;



@SuppressWarnings("serial")
public class Patient extends Person{
	
	private String email;
	private String tel_fijo;
	private String tel_cel;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel_fijo() {
		return tel_fijo;
	}
	public void setTel_fijo(String tel_fijo) {
		this.tel_fijo = tel_fijo;
	}
	public String getTel_cel() {
		return tel_cel;
	}
	public void setTel_cel(String tel_cel) {
		this.tel_cel = tel_cel;
	}
	
}
