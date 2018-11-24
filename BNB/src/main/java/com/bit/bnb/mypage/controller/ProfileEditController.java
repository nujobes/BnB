package com.bit.bnb.mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.mypage.model.MemberVO;
import com.bit.bnb.mypage.service.ProfileEditService;
import com.bit.bnb.user.model.UserVO;

@Controller
@RequestMapping("/mypageEdit")
public class ProfileEditController {

	@Autowired
	private ProfileEditService service;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView profileEditForm(@RequestParam("userId") String userId) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/MemberEditForm");
		modelAndView.addObject("member", service.myUserPick(userId));
		modelAndView.addObject("userId", userId);

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String profileEditPost(MemberVO member, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		UserVO user = (UserVO) session.getAttribute("loginUser");
		System.out.println(member.getUserPw());
		if (member.getUserPw() == null) {
			member.setUserPw(user.getUserPw());
		}
		service.myUserUpdate(member, request);

		return "redirect:/mypage";

	}
}
