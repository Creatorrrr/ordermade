package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ordermade.domain.Category;
import ordermade.store.facade.CategoryStore;
import ordermade.store.mapper.CategoryMapper;

public class CategoryStoreLogic implements CategoryStore {
	
	private SqlSession session;
	
	public CategoryStoreLogic() {
		session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}

	@Override
	public List<Category> selectAllCategory() {
		return null;
//		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();

		CategoryMapper mapper = session.getMapper(CategoryMapper.class);
		List<Category> list = mapper.selectAllCategory();
		session.commit();
		session.close();

		return list;
	}

}
