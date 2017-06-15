package ordermade.store.facade;

import java.util.List;

import org.springframework.stereotype.Repository;

import ordermade.domain.Category;
import ordermade.domain.Portfolio;

@Repository
public interface PortfolioStore {

	public boolean insertPortfolio(Portfolio portfolio);
	public boolean updatePortfolioById(Portfolio portfolio);
	public boolean deletePortfolioById(String id);
	public Portfolio selectPortfolioById(String id);
	public List<Portfolio> selectPortfoliosByMakerId(String makerId,String begin, String end);
	public int selectRowsByMakerId(String makerId);
	public List<Portfolio> selectPortfoliosByMakerIdAndTitle(String makerId, String title,String begin, String end );
	public List<Portfolio> selectPortfoliosByCategory(String category, String begin, String end);
	
	//추가-----------
	public List<Category> selectAllCategory();
	public List<Portfolio> selectPortfoliosByCategoryAndMakerName(String category, String makerName, String begin, String end);
	public List<Portfolio> selectPortfoliosByCategoryAndTitle(String category, String title, String begin, String end);
}