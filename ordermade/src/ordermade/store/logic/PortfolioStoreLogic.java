package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ordermade.domain.Portfolio;
import ordermade.store.facade.PortfolioStore;
import ordermade.store.mapper.PortfolioMapper;

public class PortfolioStoreLogic implements PortfolioStore {

	private SqlSession session;
	
	
	@Override
	public boolean insertPortfolio(Portfolio portfolio) {
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		return mapper.insertPortfolio(portfolio);
	}

	@Override
	public boolean updatePortfolioById(Portfolio portfolio) {
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		return mapper.updatePortfolioById(portfolio);
	}

	@Override
	public boolean deletePortfolioById(String id) {
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		return mapper.deletePortfolioById(id);
	}

	@Override
	public Portfolio selectPortfolioById(String id) {
		return session.selectOne("ordermade.store.mapper.PortfolioMapper.selectPortfolioById", id);
	}

	@Override
	public List<Portfolio> selectPortfoliosByMakerId(String makerId, String page) {
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		return mapper.selectPortfoliosByMakerId(makerId, page);
	}

	@Override
	public List<Portfolio> selectPortfoliosByMakerIdAndTitle(String makerId, String title, String page) {
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		return mapper.selectPortfoliosByMakerIdAndTitle(makerId, title, page);
	}

	@Override
	public List<Portfolio> selectPortfoliosByCategory(String category, String page) {
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		return mapper.selectPortfoliosByCategory(category, page);
	}

}
