package ordermade.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OkHttpTestController {

	//------------------test
	//POST String
	@RequestMapping(value="test/postString.do", method=RequestMethod.POST, produces="text/plain")
	public @ResponseBody String postString(HttpServletRequest request) throws IOException{
		System.out.println("sessionId="+request.getSession().getId());
		ServletInputStream is = request.getInputStream();
		StringBuilder sb = new StringBuilder();
		int len = 0;
		byte[] buf = new byte[1024];
		while((len = is.read(buf)) != -1){
			sb.append(new String(buf, 0, len));
		}
		System.out.println(sb.toString());
		return sb.toString();
	}
	
	
	//POST File
	@RequestMapping(value="test/postFile.do",method=RequestMethod.POST,produces="text/plain")
	public @ResponseBody String postFile(HttpServletRequest request) throws IOException{
		ServletInputStream is = request.getInputStream();
		System.out.println("sessionId="+request.getSession().getId());
		
		String dir = request.getRealPath("");
		System.out.println(dir);
		File file = new File(dir, "man1.jpg");
		FileOutputStream fos = new FileOutputStream(file);
		int len = 0;
		byte[] buf = new byte[1024];
		while((len = is.read(buf)) != -1){
			fos.write(buf, 0, len);
		}
		fos.flush();
		fos.close();
		return "true";
	}
	
	
	//POST UploadFile
	@RequestMapping(value="test/uploadInfo.do",method=RequestMethod.POST)
	public String uploadInfo(String id, String password, File mPhoto, HttpServletRequest request) throws IOException{
		System.out.println("sessionId="+request.getSession().getId());
		//File mPhoto = null;
		String mPhotoFileName = null;
		if(mPhoto == null){
			System.out.println(mPhotoFileName +" is null.");
		}
		String dir = request.getRealPath("files");
		File file = new File(dir, mPhotoFileName);
		FileCopyUtils.copy(mPhoto, file);
		return null;
	}
	
	
	//-----------------------
	
	
	
	
}
