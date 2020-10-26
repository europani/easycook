package com.devon.easycook.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	@Setter(AccessLevel.NONE)
	private String email;
	private String agency;
	@Setter(AccessLevel.NONE)
	private String tel;
	private Date birthday;
	private String gender;
	private String zipcode;
	@Setter(AccessLevel.NONE)
	private String address;
	private int point;
	private String emailAuthKey;
	private int emailAuthCheck;
	private int author;
	private Timestamp regDate;
	private Timestamp wdrDate;
	
	private String email1;
	private String email2;
	private String tel1;
	private String tel2;
	private String tel3;
	private String address1;
	private String address2;
	private String address3;
	
	
	public void setEmail() {
		this.email = getEmail1() + "@" + getEmail2();
	}
	
	public void setTel() {
		this.tel = getTel1() + "-" +  getTel2() + "-" + getTel3();
	}
	
	public void setAddress() {
		this.address = getAddress1() + "," + getAddress2() + getAddress3();
	}
	
	
	
}
