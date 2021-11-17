package com.spring.market.vo;

public class MemberVO {
	private int memberno;
	private String email;
	private String password;
	private String name;
	private int gender;
	private int phone;
	private String address;
	private String profile;
	private String profiletype;
	public MemberVO() {}
	public MemberVO(int memberno, String email, String password, String name, int gender, int phone,
			String address, String profile, String profiletype) {
		super();
		this.memberno = memberno;
		this.email = email;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
		this.profile = profile;
		this.profiletype = profiletype;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getProfiletype() {
		return profiletype;
	}
	public void setProfiletype(String profiletype) {
		this.profiletype = profiletype;
	}
	


	
}
