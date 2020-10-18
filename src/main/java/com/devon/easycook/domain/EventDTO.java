package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class EventDTO {

	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private Timestamp eventSdate;
	private Timestamp eventEdate;
}
