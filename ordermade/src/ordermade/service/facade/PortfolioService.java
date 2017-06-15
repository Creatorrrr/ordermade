package ordermade.service.facade;

import java.util.List;

import ordermade.domain.Category;
import ordermade.domain.Portfolio;

public interface PortfolioService {
	public boolean registerPortfolio(Portfolio portfolio);

	public boolean modifyPortfolio(Portfolio portfolio);

	public boolean removePortfolio(String id);

	public Portfolio findPortfolioById(String id);

	public List<Portfolio> findPortfoliosByMakerId(String makerId, String page);

	public int findRowsByMakerId(String makerId);

	public List<Portfolio> findPortfoliosByMakerIdAndTitle(String makerId, String title, String page);

	public List<Portfolio> findPortfoliosByCategory(String category, String page);
	
	public int findRowsPortfoliosByCategory(String category);
	
	//추가-----------------
	
	public List<Category> findAllCategory();

	public List<Portfolio> findPortfoliosByCategoryAndTitle(String category, String title, String page);

	public List<Portfolio> findPortfoliosByCategoryAndMakerName(String category, String makerName, String page);
}
