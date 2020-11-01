package com.devon.easycook.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EventDTO {

	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private String eventImage;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date eventStartdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date eventEnddate;
	private int couponNo;
}
