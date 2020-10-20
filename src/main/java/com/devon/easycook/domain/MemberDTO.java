package com.devon.easycook.domain;

import java.sql.Timestamp;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;

@Data
public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	@Getter(AccessLevel.NONE)
	private String email;
//	private String agency;
	@Getter(AccessLevel.NONE)
	private String tel;
	private String birthday;
	private String gender;
	private String zipcode;
	@Getter(AccessLevel.NONE)
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
	private String address1;
	private String address2;
	private String address3;
	
	
	public String getEmail() {
		return getEmail1() + "@" + getEmail2();
	}
	
	public String getTel() {
		return getTel1() + getTel2() + getTel3();
	}
	
	public String getAddress() {
		return getAddress1() + getAddress2() + getAddress3();
	}
	
}
