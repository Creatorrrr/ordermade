package ordermade.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ordermade.domain.Portfolio;
import ordermade.domain.Tag;
import ordermade.service.facade.PortfolioService;
import ordermade.store.facade.PortfolioStore;
import ordermade.store.facade.TagStore;
import ordermade.store.logic.PortfolioStoreLogic;

@Service
public class PortfolioServiceLogic implements PortfolioService{

	@Autowired
	private PortfolioStore store;
	@Autowired
	private TagStore tStore;
	
	public PortfolioServiceLogic() {
		store = new PortfolioStoreLogic();
	}
	
	@Override
	public boolean registerPortfolio(Portfolio portfolio) {
		boolean portfolioResult = store.insertPortfolio(portfolio);
		
		List<Tag> tagList = tStore.retrieveTagsFromGoogleVision(portfolio.getImage());
		for(Tag t : tagList) {
			t.setPortfolio(portfolio);
			tStore.insertTag(t);
		}
		
		return portfolioResult;
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