package ordermade.service.facade;

import java.util.List;

import ordermade.domain.Portfolio;

public interface PortfolioService {
	public boolean registerPortfolio(Portfolio portfolio);

	public boolean modifyPortfolio(Portfolio portfolio);

	public boolean removePortfolio(String id);

	public Portfolio findPortfolioById(String id);

	public List<Portfolio> findPortfoliosByMakerId(String makerId, String page);

	public List<Portfolio> findPortfoliosByMakerIdAndTitle(String makerId, String title, String page);
}
