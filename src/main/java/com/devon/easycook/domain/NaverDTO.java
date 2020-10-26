package com.devon.easycook.domain;

public class NaverDTO {
	public String resultcode;
	public String message;
	public Response response;

	public static class Response {

		public String id;
		public String nickname;
		public String profile_image;
		public String age;
		public String gender;
		public String email;
		public String name;
		public String birthday;

	}
}
