package com.example.headset0.controller.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUploadController {
	@RequestMapping("imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) 
			throws Exception {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			OutputStream out = null;
			PrintWriter printWriter = null;
			String p_image = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			ServletContext application = request.getSession().getServletContext();
			String uploadPath = application.getRealPath("/resources/images/");
			out = new FileOutputStream(new File(uploadPath + p_image));
			out.write(bytes);
			printWriter = response.getWriter();
			String fileUrl = request.getContextPath() + "/resources/images/" + p_image;
			printWriter.println("{\"filename\" : \"" + p_image + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
			}
}
