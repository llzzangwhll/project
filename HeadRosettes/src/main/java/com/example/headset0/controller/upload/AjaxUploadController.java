package com.example.headset0.controller.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.headset0.service.qna.QnaService;
import com.example.headset0.util.UploadFileUtils;


@Controller
public class AjaxUploadController {
    
	String upload_path = "c:/upload";
	
    @Autowired
	QnaService qnaService;

	
	@ResponseBody
	@RequestMapping(value = "/upload/ajax_upload", produces = "text/plain;charset=utf-8")       
	public ResponseEntity<String> ajax_upload(MultipartFile file) throws Exception {
		String file_name = UploadFileUtils.uploadFile(upload_path, file.getOriginalFilename(), file.getBytes());
		
		return new ResponseEntity<String>(file_name, HttpStatus.OK); 
	}

	@ResponseBody
	@RequestMapping("/upload/display_file")
	public ResponseEntity<byte[]> display_file(String file_name) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(file_name);
			file_name = file_name.substring(file_name.indexOf("_") + 1); 
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); 
			headers.add("Content-Disposition", "attachment; filename=\"" + file_name + "\"");
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if (in != null)
				in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/upload/delete_file", method = RequestMethod.POST)
	public ResponseEntity<String> delete_file(String file_name) {
		new File(file_name.replace("/", File.separator)).delete();
		qnaService.delete_attach(file_name);
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}


}
