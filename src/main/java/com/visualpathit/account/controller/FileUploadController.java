package com.visualpathit.account.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.visualpathit.account.model.User;
import com.visualpathit.account.service.UserService;

@Controller
public class FileUploadController {
	 @Autowired
	    private UserService userService;
	private static final Logger logger = LoggerFactory
			.getLogger(FileUploadController.class);

	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = { "/upload"} , method = RequestMethod.GET)
    public final String upload(final Model model) {
        return "upload";
    }
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public @ResponseBody
	String uploadFileHandler(@RequestParam("name") String name,@RequestParam("userName") String userName,
			@RequestParam("file") MultipartFile file) {
		
		System.out.println("Called the upload file :::" );
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				System.out.println("Path ::::" +rootPath);
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name+".png");
				//image saving 
				User user = userService.findByUsername(userName);
				user.setProfileImg(name +".png");
				user.setProfileImgPath(serverFile.getAbsolutePath());
				userService.save(user);
				
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());

				return "You successfully uploaded file=" + name +".png";
			} catch (Exception e) {
				return "You failed to upload " + name +".png" + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name +".png"
					+ " because the file was empty.";
		}
	}

}
