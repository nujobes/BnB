package com.bit.bnb.host.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.bnb.host.model.CommentModel;
import com.bit.bnb.host.service.CommentService;

 

 

/*@RequestMapping("/host/comment")*/
@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
    
    
    @RequestMapping(value="/comment/list",method=RequestMethod.GET) //댓글 리스트
    @ResponseBody
    private List<CommentModel> CommentServiceList(CommentModel commentModel) throws Exception{

        return commentService.commentList(commentModel);
    }
    
    @RequestMapping(value="/comment/insert", method = RequestMethod.POST) //댓글 작성 
    @ResponseBody
    private int commentServiceInsert(@RequestParam int bId, @RequestParam String content) throws Exception {
        
        CommentModel commentModel = new CommentModel();
        commentModel.setbId(bId);
        System.out.println(bId);
        commentModel.setContent(content);
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용, 임시로 "test"라는 값을 입력
        commentModel.setWriter("test");  
        
        return commentService.commentInsert(commentModel);
    }
	
    @RequestMapping("/comment/update") //댓글 수정  
    @ResponseBody
    private int commentServiceUpdate(@RequestParam int cno, @RequestParam String content) throws Exception{
        
    	CommentModel commentModel = new CommentModel();
    	commentModel.setCno(cno);
    	commentModel.setContent(content);
        
        return commentService.commentUpdate(commentModel);
    }
    
    @RequestMapping("/comment/delete/{cno}") //댓글 삭제  
    @ResponseBody
    private int commentServiceDelete(@PathVariable int cno) throws Exception{
        
        return commentService.commentDelete(cno);
    }
    
}


