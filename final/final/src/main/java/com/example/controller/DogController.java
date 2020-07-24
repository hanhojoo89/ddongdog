package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.VaccinationMapper;

@Controller

public class DogController {
	@Autowired
	VaccinationMapper mapper;

	@RequestMapping("/vaccination/local")
	public void local() {
	}
	
	@RequestMapping("/vaccination/animal")
	public void animal() {
	}
	
	@RequestMapping("/vaccination/list")
	public void list(Model model) {
		model.addAttribute("list",mapper.list());
	}
	
	@RequestMapping("/vaccination/API")
	public void list() {
	}
	
	@RequestMapping("/index")
	public void index() {
		
	}
	
	@RequestMapping("/menu")
	public void menu() {
		
	}
	
	@RequestMapping("/footer")
	public void footer() {
		
	}
}
