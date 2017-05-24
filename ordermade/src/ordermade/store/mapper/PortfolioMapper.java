package ordermade.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ordermade.domain.Portfolio;

public interface PortfolioMapper {

	public boolean insertPortfolio(Portfolio portfolio);
	public boolean updatePortfolioById(Portfolio portfolio);
	public boolean deletePortfolioById(String id);
	public Portfolio selectPortfolioById(String id);
	public List<Portfolio> selectPortfoliosByMakerId(@Param("makerId")String makerId, @Param("page")String page);
	public List<Portfolio> selectPortfoliosByMakerIdAndTitle(@Param("makerId")String makerId, @Param("title")String title, @Param("page")String page );
	public List<Portfolio> selectPortfoliosByCategory(@Param("category")String category, @Param("page")String page);

}
