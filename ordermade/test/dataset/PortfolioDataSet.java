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
import ordermade.domain.Portfolio;
import ordermade.service.logic.PortfolioServiceLogic;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:WebContent/WEB-INF/dispatcher-servlet.xml")
public class PortfolioDataSet {
	
	@Autowired
	private PortfolioServiceLogic pService;
	
	@Test
	public void registerPortfolioDataSet() {
		Portfolio portfolio = new Portfolio();
		portfolio.setMaker(new Member());
		
		BufferedReader bufReader = null;
		
		try {
			bufReader = new BufferedReader(new FileReader("test/dataset/portfoliodata.txt"));
			String check = null;
			while((check = bufReader.readLine()) != null) {
				portfolio.setTitle(check);
				portfolio.setCategory(bufReader.readLine());
				portfolio.setContent(bufReader.readLine());
				portfolio.getMaker().setId(bufReader.readLine());
				portfolio.setImage(bufReader.readLine());
				
				pService.registerPortfolio(portfolio);
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
