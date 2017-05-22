package ordermade.store.mapper;

import java.util.List;

import ordermade.domain.Portfolio;

public interface PortfolioMapper {

	public boolean insertPortfolio(Portfolio portfolio);
	public boolean updatePortfolioById(Portfolio portfolio);
	public boolean deletePortfolioById(String id);
	public Portfolio selectPortfolioById(String id);
	public List<Portfolio> selectPortfoliosByMakerId(String makerId, String page);
	public List<Portfolio> selectPortfoliosByMakerIdAndTitle(String makerId, String title, String page );
	public List<Portfolio> selectPortfoliosByCategory(String category, String page);

}
