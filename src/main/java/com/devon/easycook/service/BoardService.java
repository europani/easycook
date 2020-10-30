package com.devon.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.EventDTO;
import com.devon.easycook.domain.NoticeDTO;
import com.devon.easycook.repository.BoardDAO;
import com.devon.easycook.util.PagingVO;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO boardDao;
	
	public List<NoticeDTO> noticeAllList(){
		return boardDao.noticeAllList();
	}
	
	public int getArticleCount(String category, String sentence)throws Exception {
		return boardDao.getArticleCount(category, sentence);
	}
	
	public List<NoticeDTO> getArticles(int start, int end, String category, String sentence) throws Exception {
		return boardDao.getArticles(start, end, category, sentence);
	}
	
	public NoticeDTO getArticle(int noticeNo, boolean noticeReadCount) throws Exception	{
		return boardDao.getArticle(noticeNo, noticeReadCount);
	}
	
	public List<EventDTO> eventList() {
		return boardDao.eventList();	
	}

	public EventDTO eventDetail(int eventNo) throws Exception {
	    return boardDao.eventDetail(eventNo);
	 }
	
	
	
	
	
	
	
	// ADMIN
	public List<NoticeDTO> getNoticeInfo(PagingVO vo) {
		return boardDao.getNoticeInfo(vo);
	}

	public void noticeWrite(NoticeDTO notice) {
		boardDao.noticeWrite(notice);
	}

	public void noticeModify(NoticeDTO notice) {
		boardDao.noticeModify(notice);
	}

	public void noticeDelete(int noticeNo) {
		boardDao.noticeDelete(noticeNo);
	}
	
	public int countEvent() {
		return boardDao.countEvent();
	}

	public List<EventDTO> getEventInfo(PagingVO vo) {
		return boardDao.getEventInfo(vo);
	}

	public void eventWrite(EventDTO event) {
		boardDao.eventWrite(event);
	}

	public EventDTO getEvent(int eventNo) {
		return boardDao.getEvent(eventNo);
	}

	public void eventModify(EventDTO event) {
		boardDao.eventModify(event);
	}

	public void eventDelete(int eventNo) {
		boardDao.eventDelete(eventNo);
	}
}
