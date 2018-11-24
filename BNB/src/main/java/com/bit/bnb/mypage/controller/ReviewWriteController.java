package com.bit.bnb.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.bnb.mypage.model.ReviewVO;
import com.bit.bnb.mypage.service.ReviewWriteService;

@Controller
@RequestMapping("/reviewWrite")
public class ReviewWriteController {
	
	@Autowired
	private ReviewWriteService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String reviewForm(@RequestParam("reservationNum") int reservationNum, Model model) {
		
		model.addAttribute("reservationNum", reservationNum);
		return "mypage/reviewWriteForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String reviewInsert(ReviewVO review) {
		
		int result = service.reviewWrite(review);
		
		if(result == 0) {
			return "mypage/reviewWriteFail";
		}
		
		return "redirect:/review";		
	}

}
