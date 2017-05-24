package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ordermade.domain.Portfolio;
import ordermade.store.facade.PortfolioStore;
import ordermade.store.mapper.PortfolioMapper;

public class PortfolioStoreLogic implements PortfolioStore {

	private SqlSession session;
	
	public PortfolioStoreLogic() {
		session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}
	
	
	@Override
	public boolean insertPortfolio(Portfolio portfolio) {
		
		try{
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			boolean check = mapper.insertPortfolio(portfolio);
			session.commit();
			return check;
		
		} finally{
			session.close();
		}
		
	}

	@Override
	public boolean updatePortfolioById(Portfolio portfolio) {
		
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		boolean check = mapper.updatePortfolioById(portfolio);
		session.commit();
		return check;
	}

	@Override
	public boolean deletePortfolioById(String id) {
		
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		boolean check = mapper.deletePortfolioById(id);
		session.commit();
		return check;
	}

	@Override
	public Portfolio selectPortfolioById(String id) {
		PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
		return  mapper.selectPortfolioById(id);
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
