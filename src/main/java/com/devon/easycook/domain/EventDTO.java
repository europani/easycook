package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class EventDTO {

	private int event_no;
	private String event_title;
	private String event_content;
	private String event_image;
	private Timestamp event_startdate;
	private Timestamp event_enddate;
}
