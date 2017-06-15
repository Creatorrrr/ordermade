package ordermade.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ordermade.constants.Constants;
import ordermade.domain.Category;
import ordermade.domain.Member;
import ordermade.domain.Portfolio;
import ordermade.service.facade.PortfolioService;
import ordermade.store.facade.CategoryStore;
import ordermade.store.facade.PortfolioStore;
import ordermade.store.logic.PortfolioStoreLogic;

@Service
public class PortfolioServiceLogic implements PortfolioService{

	@Autowired
	private PortfolioStore store;
	@Autowired
	private CategoryStore cStore;
	
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
		return excludePassword(store.selectPortfoliosByMakerId(makerId, getPortfolioBegin(page), getPortfolioEnd(page)));
	}
	
	@Override
	public int findRowsByMakerId(String makerId) {
		return store.selectRowsByMakerId(makerId);
	}

	@Override
	public List<Portfolio> findPortfoliosByMakerIdAndTitle(String makerId, String title,String page ) {
		return excludePassword(store.selectPortfoliosByMakerIdAndTitle(makerId, title, getPortfolioBegin(page), getPortfolioEnd(page)));
	}

	@Override
	public List<Portfolio> findPortfoliosByCategory(String category, String page) {
		return excludePassword(store.selectPortfoliosByCategory(category, getPortfolioBegin(page), getPortfolioEnd(page)));
	}
	
	@Override
	public int findRowsPortfoliosByCategory(String category) {
		return store.selectRowsPortfoliosByCategory(category);
	}
	
	//추가----------------------------
	
	@Override
	public List<Category> findAllCategory() {
		return cStore.selectAllCategory();
	}
	
	@Override
	public List<Portfolio> findPortfoliosByCategoryAndTitle(String category, String title, String page) {
		return excludePassword(store.selectPortfoliosByCategoryAndTitle(category, title, getPortfolioBegin(page), getPortfolioEnd(page)));
	}

	@Override
	public List<Portfolio> findPortfoliosByCategoryAndMakerName(String category, String makerName, String page) {
		return excludePassword(store.selectPortfoliosByCategoryAndMakerName(category, makerName, getPortfolioBegin(page), getPortfolioEnd(page)));
	}
	
	//---------------------------
	
	
	
	private String getPortfolioBegin(String page) {
		return (Integer.parseInt(page) - 1) * Constants.PORTFOLIO_ROW_SIZE + 1 + "";
	}
	
	private String getPortfolioEnd(String page) {
		return Integer.parseInt(page) * Constants.PORTFOLIO_ROW_SIZE + "";
	}
	
	private List<Portfolio> excludePassword(List<Portfolio> portfolioList) {
		for(Portfolio p : portfolioList) {
			Member maker = p.getMaker();
			if(maker != null) {
				maker.setPassword("");
			}
		}
		return portfolioList;
	}
	
}