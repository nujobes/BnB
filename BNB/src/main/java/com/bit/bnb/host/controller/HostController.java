package com.bit.bnb.host.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.bnb.host.model.HostModel;
import com.bit.bnb.host.service.HostService;

@Controller
@RequestMapping
public class HostController {

	@Autowired
	private HostService hostService;

	/**
	 * 게시판 조회
	 * 
	 * @param boardVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/host")
	public ModelAndView list() throws Exception {
		System.out.println("리스트컨트롤러진입");
		List<HostModel> list = hostService.listAll();
		System.out.println(list);
		// 모델앤뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("host/list");// 뷰를 LIST.JSP설정
		mav.addObject("list", list);// 데이터저장
		return mav;// list.jsp가 List에 전달

	}

	/**
	 * 글쓰기 폼
	 * 
	 * @return
	 * @throws Exception
	 */
	// 게시글 작성화면 ,전송방식 설정

	@RequestMapping(value = "/host/write", method = RequestMethod.GET) // get방식으로 들어올때
	public String HostWrite() {

		return "host/write_view";

	}

	@RequestMapping(value = "/host/write", method = RequestMethod.POST)
	public ModelAndView HostWrite(HostModel hostModel) throws Exception {

		ModelAndView modelAndView = new ModelAndView(); // 모델앤뷰생성=데이터를 전송할수있는 리턴타입
		hostService.create(hostModel);
		modelAndView.setViewName("redirect:/host/");// 어떤페이지를 보여줄것인지.

		return modelAndView;
	}
	
	/**
	 * 게시글 조회
	 * 
	 */
	@RequestMapping(value = "/host/viewLink", method = RequestMethod.GET)
	public ModelAndView View(@RequestParam int bId, HttpSession session) throws Exception {
		// 조회수증가
		/* hostService.increaseViewcnt(bId.session); */

		ModelAndView mav = new ModelAndView();// 새로운 modelandview생성.
		
		mav.setViewName("/host/content_view");// SET을 이용해서 VIEW이름 입력.
		mav.addObject("viewLink", hostService.read(bId));// MODEL객체에 데이터를 담음.
		return mav;// 객체리턴
	}

	/**
	 * 게시글 수정
	 * 
	 * @param hostModel
	 * @param boardVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
		@RequestMapping(value = "/host/update", method=RequestMethod.GET)
		public ModelAndView updateGet(int bId)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("content", hostService.read(bId)); // content에 객체 넣어서 반환
		modelAndView.setViewName("/host/updateForm"); // 보여줄 view페이지 경로
		// model.add(hostService.read(bId));
		return modelAndView;
	}
	
		@RequestMapping(value="/host/update", method=RequestMethod.POST)
		public String updatePost(@ModelAttribute HostModel hostModel)throws Exception{
			hostService.update(hostModel);
			return"redirect:/host/";
		}	
			
		
	
	// 삭제

	@RequestMapping("/host/delete")
	public String delete(@RequestParam int bId) throws Exception {

		hostService.delete(bId);

		return "redirect:/host";

	}

}
