package ordermade.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ordermade.domain.Portfolio;
import ordermade.service.facade.PortfolioService;
import ordermade.store.logic.PortfolioStoreLogic;

@Service
public class PortfolioServiceLogic implements PortfolioService{

	@Autowired
	private PortfolioStoreLogic store;
	
	public PortfolioServiceLogic() {
		store = new PortfolioStoreLogic();
	}
	
	
	@Override
	public boolean registerPortfolio(Portfolio portfolio) {
		return store.insertPortfolio(portfolio);
	}

	@Override
	public boolean modifyPortfolio(Portfolio portfolio) {
		return store.updatePortfolioById(portfolio);
	}

	@Override
	public boolean removePortfolio(String id) {
		return store.deletePortfolioById(id);
	}

	@Override
	public Portfolio findPortfolioById(String id) {
		return store.selectPortfolioById(id);
	}

	@Override
	public List<Portfolio> findPortfoliosByMakerId(String makerId, String page) {
		return store.selectPortfoliosByMakerId(makerId, page);
	}

	@Override
	public List<Portfolio> findPortfoliosByMakerIdAndTitle(String makerId, String title, String page) {
		return store.selectPortfoliosByMakerIdAndTitle(makerId, title, page);
	}

	@Override
	public List<Portfolio> findPortfoliosByCategory(String category, String page) {
		return store.selectPortfoliosByCategory(category, page);
	}
	
}
