package com.zblog.web.backend.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sun.misc.BASE64Decoder;

import com.zblog.biz.UploadManager;
import com.zblog.biz.editor.Ueditor;
import com.zblog.core.dal.entity.Upload;
import com.zblog.core.plugin.MapContainer;
import com.zblog.core.util.StringUtils;
import com.zblog.web.support.ServletRequestReader;
import com.zblog.web.support.WebContextFactory;

@Controller
@RequestMapping("/backend/uploads")
@RequiresRoles(value = { "admin", "editor" }, logical = Logical.OR)
public class UploadController{
  @Autowired
  private Ueditor ueditor;
  @Autowired
  private UploadManager uploadManager;

  @Value("${upload.image.dir}")
  private String uploadDir ;
  
  @Value("${site.url}")
  private String siteUrl ;
  
  @RequestMapping(method = RequestMethod.GET)
  public String index(@RequestParam(value = "page", defaultValue = "1") int page, Model model){
    model.addAttribute("page", uploadManager.list(page, 15));
    return "backend/upload/list";
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.POST)
  public Object insert(MultipartFile file){
    Upload upload = null;
    try(InputStream in = file.getInputStream()){
      upload = uploadManager.insertUpload(new InputStreamResource(in), new Date(), file.getOriginalFilename(),
          WebContextFactory.get().getUser().getId());
    }catch(Exception e){
      e.printStackTrace();
    }

    return new MapContainer("success", upload != null);
  }

  @RequestMapping(value = "/edit", method = RequestMethod.GET)
  public String edit(){
    return "backend/upload/edit";
  }

  @ResponseBody
  @RequestMapping(value = "/{uploadid}", method = RequestMethod.DELETE)
  public Object remove(@PathVariable("uploadid") String uploadid){
    uploadManager.removeUpload(uploadid);
    return new MapContainer("success", true);
  }

  @ResponseBody
  @RequestMapping(value = "/ueditor")
  public Object ueditor(ServletRequestReader reader){
    return ueditor.server(reader);
  }
  
  @ResponseBody
  @RequestMapping(value = "/js-upload")
  public Object jsUpload(HttpServletRequest req, HttpServletResponse resp){
	  String image = req.getParameter("image");
	// 只允许jpg
	  String header ="";
	  String header1 ="data:image/jpeg;base64,";
	  String header2 ="data:image/gif;base64,";
	  String header3 ="data:image/png;base64,";
	  String format ="";
	  boolean valid =false;
	  if(image.indexOf(header1) == 0){
		  header =header1;
		  valid =true;
		  format =".jpg";
	  }
	  if(image.indexOf(header2) == 0){
		  header =header2;
		  valid =true;
		  format =".gif";
	  }
	  if(image.indexOf(header3) == 0){
		  header =header3;
		  valid =true;
		  format =".png";
	  }
	  if (!valid) {
		return "{\"code\":\"-1\"}";
	}
	// 去掉头部
	  image = image.substring(header.length());
	  // 写入磁盘
	  boolean success = false;
	  BASE64Decoder decoder = new BASE64Decoder();
	  String imgFilePath =uploadDir;
	  File dir =new File(uploadDir);
	  if (!dir.exists()) {
		dir.mkdir();
	}
	  String fileName =StringUtils.getRandKeys(10)+ format;
	  String fileUri ="/resource/upload/"+fileName;
	  try{
	  byte[] decodedBytes = decoder.decodeBuffer(image);
	  imgFilePath =imgFilePath + "/"+ fileName;
	  System.out.println("-------------"+uploadDir);
	  FileOutputStream out = new FileOutputStream(imgFilePath);
	  out.write(decodedBytes);
	  out.close();
	  success = true;
	  }catch(Exception e){
	  success = false;
	  e.printStackTrace();
	  }
//	  String contextPath =req.getContextPath();
//	  String imgUrl =contextPath + fileUri;
	  if (success) {
		  return "{\"code\":0,\"path\":\""+fileUri+"\"}";
	}
	  else{
		  return "{\"code\":\"-1\"}";
	  }
  }
  

}
