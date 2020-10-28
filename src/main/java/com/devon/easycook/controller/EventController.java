package com.devon.easycook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devon.easycook.domain.EventDTO;
import com.devon.easycook.repository.EventDAO;

@Controller
@RequestMapping("/board")
public class EventController {
	
	
	@Autowired
	EventDAO dbPro;
	
	
	@GetMapping("/event")
	public String title(Model model) {
		List<EventDTO> title = dbPro.eventList();
		model.addAttribute("title", title);
		return "board/event";
	}
}
