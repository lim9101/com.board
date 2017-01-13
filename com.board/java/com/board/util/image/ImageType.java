package com.board.util.image;

import org.apache.commons.lang3.StringUtils;
import org.apache.tika.Tika;
import org.springframework.web.multipart.MultipartFile;


public class ImageType {
	public static boolean isValidMimeType(MultipartFile file){
		System.out.println("이미지타입판별클레스");
		Tika tika =new Tika();
		String mimeType;
		
		try{
				mimeType = tika.detect(file.getInputStream());
				if(!isPermittedMimeType(mimeType)){
					System.out.println("isValidMime:"+mimeType);
					return false;
				}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("파일 가져오기 실패:false");
			return false;
		}
		return true;
	}
	
	private static boolean isPermittedMimeType(String mimeType) {
		System.out.println("isPermitted:"+mimeType);
		String[] validMimeTypes = {"image/png","image/jpeg","image/bmp" };
		for (String validMimeType : validMimeTypes) {
			if (StringUtils.startsWith(mimeType, validMimeType)) {
				return true;
			}
		}
		return false;
	}
}
