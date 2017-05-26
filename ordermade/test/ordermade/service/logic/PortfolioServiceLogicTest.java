package ordermade.service.logic;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ordermade.domain.Member;
import ordermade.domain.Portfolio;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:WebContent/WEB-INF/dispatcher-servlet.xml")
public class PortfolioServiceLogicTest {
	
	@Autowired
	private PortfolioServiceLogic pService;

	@Test
	public void testRegisterPortfolio() {
		Portfolio portfolio = new Portfolio();
		Member maker = new Member();
		portfolio.setCategory("2");
		portfolio.setContent("11");
		maker.setId("7");
		portfolio.setMaker(maker);
		portfolio.setTitle("11");
		portfolio.setImage("./WebContent/images/phonecase6.jpg");
		
		pService.registerPortfolio(portfolio);
	}

}
