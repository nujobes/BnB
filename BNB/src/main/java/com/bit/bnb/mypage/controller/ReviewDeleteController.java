package com.bit.bnb.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.bnb.mypage.service.ReviewDeleteService;

@Controller
public class ReviewDeleteController {
	
	@Autowired
	public ReviewDeleteService service;
	
	@RequestMapping("/review_delete")
	public String reviewDele(@RequestParam("reservationNum") int reservationNum) {
		
		service.reviewDelete(reservationNum);
		
		return "redirect:/review";
	}

}
