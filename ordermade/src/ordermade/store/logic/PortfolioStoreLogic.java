package ordermade.store.logic;

import java.util.List;

import ordermade.domain.Portfolio;
import ordermade.store.facade.PortfolioStore;

public class PortfolioStoreLogic implements PortfolioStore {

	@Override
	public boolean insertPortfolio(Portfolio portfolio) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatePortfolioById(Portfolio portfolio) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deletePortfolioById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Portfolio selectPortfolioById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Portfolio> selectPortfoliosByMakerId(String makerId, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Portfolio> selectPortfoliosByMakerIdAndTitle(String makerId, String title, String page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Portfolio> selectPortfoliosByCategory(String category, String page) {
		// TODO Auto-generated method stub
		return null;
	}

}
