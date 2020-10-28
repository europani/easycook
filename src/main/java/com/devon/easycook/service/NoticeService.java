package com.devon.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.NoticeDTO;
import com.devon.easycook.repository.NoticeDAO;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO noticeDao;

	public List<NoticeDTO> noticeAllList(){
		return noticeDao.noticeAllList();
	}
	
	public int getArticleCount(String category, String sentence)throws Exception {
		return noticeDao.getArticleCount(category, sentence);
	}
	
	public List<NoticeDTO> getArticles(int start, int end, String category, String sentence) throws Exception {
		return noticeDao.getArticles(start, end, category, sentence);
	}
	
	public NoticeDTO getArticle(int noticeNo, boolean noticeReadCount) throws Exception	{
		return noticeDao.getArticle(noticeNo, noticeReadCount);
	}
	
	public void insertArticle(NoticeDTO article) throws Exception {
		noticeDao.insertArticle(article);
	}
	
	public int updateArticle(NoticeDTO article) throws Exception {
		return noticeDao.updateArticle(article);
	}
	
	public int deleteArticle(int noticeNo, String noticePasswd) throws Exception {
		return noticeDao.deleteArticle(noticeNo, noticePasswd);
	}
	
	
}
