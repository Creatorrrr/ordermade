package dataset;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ordermade.domain.Member;
import ordermade.domain.Product;
import ordermade.service.logic.ProductServiceLogic;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:WebContent/WEB-INF/dispatcher-servlet.xml")
public class ProductDataSet {

	@Autowired
	private ProductServiceLogic pService;
	
//	@Test
//	public void registerProductDataSet() {
//		Product product = new Product();
//		product.setMaker(new Member());
//		
//		BufferedReader bufReader = null;
//		
//		try {
//			bufReader = new BufferedReader(new FileReader("test/dataset/productdata"));
//			String check = null;
//			while((check = bufReader.readLine()) != null) {
//				product.setTitle(check);
//				product.getMaker().setId(bufReader.readLine());
//				product.setCategory(bufReader.readLine());
//				product.setContent(bufReader.readLine());
//				product.setImage(bufReader.readLine());
//				product.setPrice(Integer.parseInt(bufReader.readLine()));
//				product.setPeriod(Integer.parseInt(bufReader.readLine()));
//				product.setHit(Integer.parseInt(bufReader.readLine()));
//				
//				pService.registerProduct(product);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(bufReader != null) bufReader.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//	
//	@Test
//	public void alignProductDataSet() {
//		BufferedReader bufReader = null;
//		BufferedWriter bufWriter = null;
//		
//		try {
//			bufReader = new BufferedReader(new FileReader("test/dataset/productdata"));
//			bufWriter = new BufferedWriter(new FileWriter("test/dataset/productdata2"));
//			
//			String str = null;
//			String temp = null;
//			while((str = bufReader.readLine()) != null) {
//				temp = str.replace("'", "");
//				bufWriter.write(temp + "\n");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(bufReader != null) bufReader.close();
//				if(bufWriter != null) bufWriter.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}
	
	@Test
	public void accountDataSet() {
		BufferedWriter bufWriter = null;
		
		try {
			bufWriter = new BufferedWriter(new FileWriter("test/dataset/accountdata"));
			
			String str = null;
			String temp = null;
			for(int i = 1 ; i <= 50 ; i++) {
				bufWriter.write("INSERT INTO account(member_id, money) VALUES ('m" + i + "', 1000000);\n");
			}
			for(int i = 1 ; i <= 50 ; i++) {
				bufWriter.write("INSERT INTO account(member_id, money) VALUES ('c" + i + "', 1000000);\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(bufWriter != null) bufWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
