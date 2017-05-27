package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.domain.Category;
import ordermade.store.facade.CategoryStore;
import ordermade.store.mapper.CategoryMapper;

@Repository
public class CategoryStoreLogic implements CategoryStore {
	
	private SqlSessionFactory factory;
	
	public CategoryStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public List<Category> selectAllCategory() {
		SqlSession session = factory.openSession();
		List<Category> list = null;
		try {
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			list = mapper.selectAllCategory();
		} finally {
			session.close();
		}
		return list;
	}

}
