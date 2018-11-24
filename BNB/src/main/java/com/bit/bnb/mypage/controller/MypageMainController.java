package com.bit.bnb.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.mypage.service.MypageMainService;
import com.bit.bnb.user.model.UserVO;


@Controller
public class MypageMainController {
	
	@Autowired
	private MypageMainService service;
	
	@RequestMapping("/mypage")
	public ModelAndView Listview(HttpSession session) {
		
		UserVO user = (UserVO)session.getAttribute("loginUser");
		String userId = user.getUserId();
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("user", service.mypageView(userId));
		modelAndView.setViewName("mypage/mypage");
		
		return modelAndView;
	}

}
