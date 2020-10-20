package com.devon.easycook.domain;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	
//	private String agency;
	private String tel;
	
	private Timestamp birthday;
	
	private String gender;
	private String zipcode;
	private String address;
	
	private int point;
//	private String userEmailHash;
//	private String userEmailChecked;
	private int author;
	private Timestamp regDate;
	private Timestamp wdrDate;
	
	private String email1;
	private String email2;
	private String tel1;
	private String tel2;
	private String tel3;
	private String birthday1;
	private String birthday2;
	private String birthday3;
	private String address1;
	private String address2;
	private String address3;
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
		return getEmail1() + "@" + getEmail2();
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return getTel1() + getTel2() + getTel3();
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Timestamp getBirthday() {
		return Timestamp.valueOf(getBirthday1() + getBirthday2() + getBirthday3());
	}
	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
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
		return getAddress1() + getAddress2() + getAddress3();
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getBirthday1() {
		return birthday1;
	}
	public void setBirthday1(String birthday1) {
		this.birthday1 = birthday1;
	}
	public String getBirthday2() {
		return birthday2;
	}
	public void setBirthday2(String birthday2) {
		this.birthday2 = birthday2;
	}
	public String getBirthday3() {
		return birthday3;
	}
	public void setBirthday3(String birthday3) {
		this.birthday3 = birthday3;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", tel=" + tel
				+ ", birthday=" + birthday + ", gender=" + gender + ", zipcode=" + zipcode + ", address=" + address
				+ ", point=" + point + ", author=" + author + ", regDate=" + regDate + ", wdrDate=" + wdrDate
				+ ", email1=" + email1 + ", email2=" + email2 + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3
				+ ", birthday1=" + birthday1 + ", birthday2=" + birthday2 + ", birthday3=" + birthday3 + ", address1="
				+ address1 + ", address2=" + address2 + ", address3=" + address3 + "]";
	}
	
	
}
