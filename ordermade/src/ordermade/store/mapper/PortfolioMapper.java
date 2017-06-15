package ordermade.store.mapper;

import java.util.HashMap;
import java.util.List;

import ordermade.domain.Category;
import ordermade.domain.Portfolio;

public interface PortfolioMapper {

	public boolean insertPortfolio(Portfolio portfolio);
	public boolean updatePortfolioById(Portfolio portfolio);
	public boolean deletePortfolioById(String id);
	
	public Portfolio selectPortfolioById(String id);

	public List<Portfolio> selectPortfoliosByMakerId(HashMap<String, String> map);
	public int selectRowsByMakerId(String makerId);
	public List<Portfolio> selectPortfoliosByMakerIdAndTitle(HashMap<String, String> map);
	public List<Portfolio> selectPortfoliosByCategory(HashMap<String, String> map);
	
//	public List<Portfolio> selectPortfoliosByMakerId(@Param("makerId")String makerId, @Param("page")String page);
//	public List<Portfolio> selectPortfoliosByMakerIdAndTitle(@Param("makerId")String makerId, @Param("title")String title, @Param("page")String page );
//	public List<Portfolio> selectPortfoliosByCategory(@Param("category")String category, @Param("page")String page);
	
	//추가----------
	public List<Category> selectAllCategory();
	public List<Portfolio> selectPortfoliosByCategoryAndTitle(HashMap<String, String> map);
	public List<Portfolio> selectPortfoliosByCategoryAndMakerName(HashMap<String, String> map);
}