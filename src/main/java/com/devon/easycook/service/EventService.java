package com.devon.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.EventDTO;
import com.devon.easycook.repository.EventDAO;
import com.devon.easycook.util.PagingVO;

@Service
public class EventService {
	@Autowired
	private EventDAO eventDao;
	
	//eventTitile보기
	public List<EventDTO> eventList(){
		return eventDao.eventList();
	}

	
	
	
	
	
	// ADMIN
	
	public int countEvent() {
		return eventDao.countEvent();
	}

	public List<EventDTO> getFullInfo(PagingVO vo) {
		return eventDao.getFullInfo(vo);
	}

	public void write(EventDTO event) {
		eventDao.write(event);
	}

	public EventDTO getEvent(int eventNo) {
		return eventDao.getEvent(eventNo);
	}

	public void modify(EventDTO event) {
		eventDao.modify(event);
	}

	public void delete(int eventNo) {
		eventDao.delete(eventNo);
	}
}
