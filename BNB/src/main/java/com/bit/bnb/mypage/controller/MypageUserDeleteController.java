package com.bit.bnb.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.bnb.mypage.service.MypageUserDeleteService;

@Controller
public class MypageUserDeleteController {
	
	@Autowired
	private MypageUserDeleteService service;
	
	@RequestMapping("/userDelete")
	public String userDele(@RequestParam("userId") String userId, HttpServletRequest request, RedirectAttributes rttr) {
		
		service.userDelete(userId);
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		return "redirect:/";
		
	}

}
