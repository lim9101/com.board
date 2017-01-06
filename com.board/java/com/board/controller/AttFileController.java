package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.board.service.AttFileService;

@Controller
public class AttFileController {
	
	@Autowired
	private AttFileService fileService;
}
