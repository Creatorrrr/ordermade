package dataset;

import java.io.BufferedReader;
import java.io.FileReader;
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
	
	@Test
	public void registerProductDataSet() {
		Product product = new Product();
		product.setMaker(new Member());
		
		BufferedReader bufReader = null;
		
		try {
			bufReader = new BufferedReader(new FileReader("test/dataset/portfoliodata.txt"));
			String check = null;
			while((check = bufReader.readLine()) != null) {
				product.setTitle(check);
				product.getMaker().setId(bufReader.readLine());
				product.setCategory(bufReader.readLine());
				product.setContent(bufReader.readLine());
				product.setImage(bufReader.readLine());
				product.setPrice(Integer.parseInt(bufReader.readLine()));
				product.setPeriod(Integer.parseInt(bufReader.readLine()));
				product.setHit(Integer.parseInt(bufReader.readLine()));
				
				pService.registerProduct(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(bufReader != null) bufReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
