package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class NoticeDTO {

	private int noticeNo; //넘버
    private String noticeTitle; //제목
    private String noticeContent; //내용
    private Timestamp noticeDate; //작성일 
    private int noticeCount; //조회수
    private String noticeFilename; //img파일
}
