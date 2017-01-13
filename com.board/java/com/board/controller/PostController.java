package com.board.controller;




import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.board.DTO.Page;
import com.board.DTO.Post;
import com.board.service.AttFileService;
import com.board.service.ComentService;
import com.board.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private AttFileService fileService;
	
	@Autowired
	private ComentService comentService;
	
	private int currentPage;
	private Page pdto;
	
	
	//글 작성하는 페이지 이동
	@RequestMapping(value = "/postAdd", method = RequestMethod.GET)
	public ModelAndView postWrite(Post dto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", postService.postView(dto.getpNo()));
		mav.setViewName("postAdd");
		return mav;
	}//end postWrite
	
	//글 작성 후 처리 메서드
	@RequestMapping(value = "/postAdd", method = RequestMethod.POST)
	public ModelAndView postProWrite(Post post){
		ModelAndView mav = new ModelAndView(); 
		boolean result=false;
		result = postService.postWrite(post);
		if(result){
			mav.addObject("result",result);
			mav.setViewName("redirect:/postList");
		}else{
			mav.setViewName("postAdd");
		}
		return mav;
		/*post.setDate_in(new Date(System.currentTimeMillis()));;*/
	}//end
	
	@RequestMapping(value = "/postUpdate", method = RequestMethod.GET)
	public ModelAndView postUpdate(Post dto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", postService.postView(dto.getpNo()));
		mav.setViewName("postUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/postUpdate", method = RequestMethod.POST)
	public ModelAndView postUpdatePro(Post post, int fileNo){
		ModelAndView mav = new ModelAndView();
		postService.postUpdate(post, fileNo);
		mav.setViewName("redirect:/postList");
		return mav;
	}
	
	//검색안한 리스트
	@RequestMapping(value = "/postList", method = RequestMethod.GET)
	public ModelAndView postList(Page pv ,HttpSession session){
		ModelAndView mav = new ModelAndView();
		int totalRecord=0;
		if(pv.getSearchKey() ==null){
			totalRecord = postService.totalCount();
		}else{
			totalRecord = postService.searchCount(pv);
		}
		if(totalRecord >=1){
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();
			
			pdto = new Page(currentPage, totalRecord, pv.getSearchKey(), pv.getSearchWord());
			mav.addObject("pv", pdto); // 페이지번호를 출력하기위해 mav에 담음
			mav.addObject("pList", postService.postList(pdto));
			//System.out.println(postService.postList(pdto));
		}
		
		mav.setViewName("postList");
		return mav;
	}
	
	//검색한 리스트
	@RequestMapping(value = "/postList", method = RequestMethod.POST)
	public ModelAndView postSearchList(Page pv){
		ModelAndView mav = new ModelAndView();
		if(pv.getSearchKey()==null){
			mav.setViewName("redirect:/postList");
		}else{
			int totalRecord = postService.searchCount(pv);
			if(totalRecord >=1){
				if (pv.getCurrentPage() == 0)
					currentPage = 1;
				else
					currentPage = pv.getCurrentPage();
				
				pdto = new Page(currentPage, totalRecord, pv.getSearchKey(), pv.getSearchWord());
				mav.addObject("pv", pdto); // 페이지번호를 출력하기위해 mav에 담음
				mav.addObject("pList", postService.postList(pdto));
				//System.out.println(postService.postList(pdto));
			}
			
			mav.setViewName("postList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/postView", method = RequestMethod.GET)
	public ModelAndView postView(int pNo, HttpSession session){
		ModelAndView mav = new ModelAndView();	
		if((Integer) session.getAttribute("pNo") != pNo){
			postService.addCount(pNo);
			session.setAttribute("pNo", pNo);
		}
		mav.addObject("dto", postService.postView(pNo));
		mav.setViewName("postView");
		return mav;
	}
	
	@RequestMapping("postDelete")
	public String postDelete(int pNo, int spNo, int depth, int fileNo, int plevel){
		if(comentService.countComent(pNo) !=0){
			comentService.allDelComent(pNo);
		}
		if(fileNo!=0){
			fileService.fileDelete(fileNo, pNo);
		}
		postService.delPost(pNo,spNo,depth,plevel);
		return "redirect:/postList";
	}//end postDelete 
}