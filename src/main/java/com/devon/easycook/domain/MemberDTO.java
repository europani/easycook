package com.devon.easycook.domain;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String email1;
	private String email2;
//	private String agency;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private Timestamp birthday;
	private String birthday1;
	private String birthday2;
	private String birthday3;
	private String gender;
	private String zipcode;
	private String address;
	private String address1;
	private String address2;
	private String address3;
	private int point;
//	private String userEmailHash;
//	private String userEmailChecked;
	private int author;
	private Timestamp regDate;
	private Timestamp wdrDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email1, String email2) {
		this.email = getEmail1() + "@" + getEmail2();
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
//		this.tel = getTel1() + getTel2() + getTel3();
	}
	public Timestamp getBirthday() {
		return birthday;
	}
	public void setBirthday(Timestamp birthday) {
		this.birthday = Timestamp.valueOf(getBirthday1());
//		this.birthday = Timestamp.valueOf(getBirthday1() + getBirthday2() + getBirthday3());
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = getAddress1();
//		this.address = getAddress1() + getAddress2() + getAddress3();
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getAuthor() {
		return author;
	}
	public void setAuthor(int author) {
		this.author = author;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Timestamp getWdrDate() {
		return wdrDate;
	}
	public void setWdrDate(Timestamp wdrDate) {
		this.wdrDate = wdrDate;
	}
	
	//
	public String getEmail1() {
		return email1;
	}
	public String getEmail2() {
		return email2;
	}
	public String getTel1() {
		return tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public String getBirthday1() {
		return birthday1;
	}
	public String getBirthday2() {
		return birthday2;
	}
	public String getBirthday3() {
		return birthday3;
	}
	public String getAddress1() {
		return address1;
	}
	public String getAddress2() {
		return address2;
	}
	public String getAddress3() {
		return address3;
	}
	
}
