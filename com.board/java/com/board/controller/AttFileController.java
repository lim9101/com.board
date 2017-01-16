package com.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.DTO.Post;
import com.board.dao.AttFileDao;
import com.board.service.AttFileService;

@Controller
public class AttFileController {
	
	@Autowired
	AttFileDao fileDao;
	
	@Autowired
	private AttFileService fileService;
	
	@RequestMapping("fileDownLoad")
	public ModelAndView fileDownLoad(int pNo, HttpServletResponse response)throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String saveDirectory ="C:\\" + "temp" + File.separator;
		
		String upload=fileDao.fileName(pNo);
		String filename=upload.substring(upload.indexOf("_")+1);
		
		//파일명이 한글일때 인코딩 작업을 한다.
		String str=URLEncoder.encode(filename,"UTF-8");
		
		//원본파일명에서 공백이 있을 때 +로 표시가 되므로 공백으로 처리해줌
		str=str.replaceAll("\\+","%20"); 
		
		//컨텐트 타입
		response.setContentType("application/octet-stream");
				
		//다운로드창에 보여줄 파일명을 지정한다.
		response.setHeader("Content-Disposition", "attachment;filename="+str+";");
		
		//저장된 파일을 읽어와 클라이언트에 출력해준다.
		FileCopyUtils.copy(new FileInputStream(new File(saveDirectory,upload)), response.getOutputStream());
		
		mav.setViewName("postView?pNo="+pNo);
		return mav;
	}
	
	@RequestMapping("userDelFile")
	public boolean userDelFile(){
			boolean result = false;
			
		 return result;
	}
	
}
