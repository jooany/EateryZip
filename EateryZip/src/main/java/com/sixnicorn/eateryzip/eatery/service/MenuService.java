package com.sixnicorn.eateryzip.eatery.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface MenuService {
	
	public Map<String, Object> saveMenuImage(HttpServletRequest request, 
			MultipartFile mFile);

}
