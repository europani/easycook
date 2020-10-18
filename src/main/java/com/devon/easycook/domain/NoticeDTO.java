package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class NoticeDTO {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFile;
	private Timestamp noticeDate;
	private int noticeCount;
}
