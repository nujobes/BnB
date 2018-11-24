package com.bit.bnb.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.mypage.model.ReviewSearchVO;
import com.bit.bnb.mypage.service.ReviewSearchService;
import com.bit.bnb.user.model.UserVO;

@Controller
public class ReviewSearchController {
	
	@Autowired
	private ReviewSearchService service;
	
	@RequestMapping(value="/reviewSearchList", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView reviewSearch(@ModelAttribute("rvs") ReviewSearchVO rvs, HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("loginUser");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("reviewSearch", service.reviewSearchList(user.getUserId(), rvs));
		modelAndView.addObject("hostReviewSearch", service.HostReviewSearchList(user.getUserId(), rvs));
		modelAndView.setViewName("mypage/reviewSearchList");
		
		return modelAndView;
	}

}
