package com.bit.bnb.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.bnb.mypage.model.ReviewVO;
import com.bit.bnb.mypage.service.ReviewEditService;

@Controller
@RequestMapping("/reviewEdit")
public class ReviewEditController {
	
	@Autowired
	public ReviewEditService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String reviewEditForm(@RequestParam("reservationNum") int reservationNum, Model model) {
		
		ReviewVO review = service.reviewPick(reservationNum);
		model.addAttribute("reservationNum", reservationNum);
		model.addAttribute("reviewPick", review);
		return "mypage/reviewEditForm";
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String reviewEdit(ReviewVO review) {
		
		service.reviewEdit(review);
		
		return "redirect:/review";
		
	}

}
