package ordermade.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ordermade.constants.Constants;
import ordermade.domain.Categories;
import ordermade.dto.Image;
import ordermade.service.facade.ProductService;

@Controller
@RequestMapping("main")
public class MainController {
	
	@Autowired
	private ProductService pService;

	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public ModelAndView showMainUI(){
		return new ModelAndView("main/main")
				.addObject("categories", pService.findAllCategory());
	}
	
	@RequestMapping(value="xml/categoryList.do", method=RequestMethod.POST, produces="application/xml")
	public @ResponseBody Categories findAllCategories(){
		return new Categories(pService.findAllCategory());
	}
	
	@RequestMapping(value="file/download.do", method=RequestMethod.GET)
	public void downloadFile(String fileName, HttpServletResponse resp) {
		File file = new File(Constants.FILE_PATH + fileName);
		System.out.println(file.toString());
		if (!file.exists()) {
			throw new RuntimeException("No such file");
		}
		try (InputStream in = new BufferedInputStream(new FileInputStream(file));
				OutputStream out = resp.getOutputStream();) {
			byte[] buf = new byte[8096];
			int readByte = 0;
			while ((readByte = in.read(buf)) > -1) {
				out.write(buf, 0, readByte);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "file/upload.do", method = RequestMethod.POST, produces = "text/plain")
	public @ResponseBody String uploadFile(HttpServletRequest req) {
		String filePath = Constants.FILE_PATH;

		File dir = new File(filePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}

		try {
			MultipartRequest mr = new MultipartRequest(req, filePath, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			return mr.getFile(mr.getFileNames().nextElement().toString()).getName();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	@RequestMapping(value = "file/uploadJson.do", method = RequestMethod.POST, produces="application/json")
	public @ResponseBody Image uploadRequestFile(HttpServletRequest req) {
		String imagePath = Constants.FILE_PATH;

		File dir = new File(imagePath);
		if (!dir.exists()) {
			// 폴더가 존재하지 않으면 폴더 생성
			dir.mkdirs();
		}
		
		String fileName = null;
		try {
			fileName = new MultipartRequest(req, imagePath, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy())
					.getFile("upload").getName();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new Image(1, fileName, Constants.ROOT_URL + "/main/file/download.do?fileName=" + fileName);
	}
}
