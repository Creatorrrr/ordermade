package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ordermade.domain.Tag;
import ordermade.store.facade.TagStore;
import ordermade.store.mapper.TagMapper;

@Repository
public class TagStoreLogic implements TagStore {
	
	private SqlSession session;
	
	public TagStoreLogic() {
		 session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}

	@Override
	public boolean insertTag(Tag tag) {
		TagMapper mapper = session.getMapper(TagMapper.class);
		int check = mapper.insertTag(tag);
		session.close();
		return check > 0;

	}

	@Override
	public boolean deleteTagById(String id) {
		TagMapper mapper = session.getMapper(TagMapper.class);
		int check = mapper.deleteTagById(id);
		session.close();
		return check > 0;

	}

	@Override
	public List<Tag> selectTagsByPortfolioId(String portfolioId) {
		TagMapper mapper = session.getMapper(TagMapper.class);
		List<Tag> list = mapper.selectTagsByPortfolioId(portfolioId);
		session.close();
		return list;

	}

	@Override
	public List<Tag> TagsFromGoogleVision(String path) {
		TagMapper mapper = session.getMapper(TagMapper.class);
		List<Tag> list = mapper.TagsFromGoogleVision(path);
		session.commit();
		session.close();
		return list;

	}

}
