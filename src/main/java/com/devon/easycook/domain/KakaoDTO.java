package com.devon.easycook.domain;

import lombok.Data;

@Data
public class KakaoDTO {

	public Integer id;
	public String connected_at;
	public Properties properties;
	public KakaoAccount kakao_account;
	public Profile profile;
	
	@Data
	public static class Profile {
		public String nickname;
		public String thumbnail_image_url;
		public String profile_image_url;
	}
	
	@Data
	public static class Properties {
		public String nickname;
	}
	
	@Data
	public static class KakaoAccount {
		public Boolean profile_needs_agreement;
		public Profile profile;
		public Boolean has_email;
		public Boolean email_needs_agreement;
		public Boolean has_birthday;
		public Boolean birthday_needs_agreement;
		public Boolean has_gender;
		public Boolean gender_needs_agreement;
	}
}





