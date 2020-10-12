package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String email;
//	private String agency;
	private String tel;
	private Timestamp birthday;
	private String gender;
	private String address;
	private int point;
//	private String userEmailHash;
//	private String userEmailChecked;
	private int author;
	private Timestamp regDate;
	private Timestamp wdrDate;
}
