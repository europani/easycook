package com.devon.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.EventDTO;
import com.devon.easycook.repository.EventDAO;

@Service
public class EventService {
	@Autowired
	private EventDAO eventDao;
	
	//eventTitile보기
	public List<EventDTO> selectTitle(){
		return eventDao.selectTitle();
	}
}
