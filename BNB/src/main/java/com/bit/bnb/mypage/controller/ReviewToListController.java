package com.bit.bnb.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.mypage.service.ReviewToListService;
import com.bit.bnb.user.model.UserVO;

@Controller
public class ReviewToListController {

	@Autowired
	private ReviewToListService service;

	@RequestMapping("/review")
	public ModelAndView reviewToList(HttpSession session) {

		UserVO user = (UserVO) session.getAttribute("loginUser");
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mypage/review");
		modelAndView.addObject("reviewTo", service.reviewToListView(user.getUserId()));
		modelAndView.addObject("reviewWrite", service.reviewWriteList(user.getUserId()));
		modelAndView.addObject("hostReview", service.hostReview(user.getUserId()));		

		return modelAndView;
	}

}
