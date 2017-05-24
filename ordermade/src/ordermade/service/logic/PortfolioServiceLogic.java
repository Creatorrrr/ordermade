package ordermade.service.logic;

import java.util.List;

import ordermade.domain.Portfolio;
import ordermade.service.facade.PortfolioService;

public class PortfolioServiceLogic implements PortfolioService{

	@Override
	public boolean registerPortfolio(Portfolio portfolio) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyPortfolio(Portfolio portfolio) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removePortfolio(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Portfolio findPortfolioById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Portfolio> findPortfoliosByMakerId(String makerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Portfolio> findPortfoliosByMakerIdAndTitle(String makerId, String title, String page) {
		// TODO Auto-generated method stub
		return null;
	}

}
