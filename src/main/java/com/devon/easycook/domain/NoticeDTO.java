package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class NoticeDTO {

	private int noticeNo; //넘버
	private String id; //작성자
    private String noticeTitle; //제목
    private String noticeContent; //내용
    private Timestamp noticeDate; //작성일 
    private int noticeReadCount; //조회수
    private String noticeFilename; //img파일
    private String noticePasswd;//비밀번호
    private int noticeRef;
    private int noticeRe_step;
    private int noticeRe_level;//
}
