package com.board.util.image;

import java.io.File;

import org.apache.commons.lang3.StringUtils;
import org.apache.tika.Tika;


public class ImageType {
	private static boolean isValidMimeType(File[] files){
		Tika tika =new Tika();
		String mimeType;
		try{
			for(File file : files){
				mimeType = tika.detect(file);
				if(!isPermittedMimeType(mimeType)){
					return false;
				}
			}
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	private static boolean isPermittedMimeType(String mimeType) {
		String[] validMimeTypes = {"image" };
		for (String validMimeType : validMimeTypes) {
			if (StringUtils.startsWith(mimeType, validMimeType)) {
				return true;
			}
		}
		return false;
	}
}
