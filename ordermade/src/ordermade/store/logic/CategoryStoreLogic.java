package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ordermade.domain.Category;
import ordermade.store.facade.CategoryStore;
import ordermade.store.mapper.CategoryMapper;
import ordermade.store.mapper.TagMapper;

public class CategoryStoreLogic implements CategoryStore {

	@Override
	public List<Category> selectAllCategory() {
//		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();

//		CategoryMapper mapper = session.getMapper(TagMapper.class);
//		check = mapper.insertTag(tag);
//		session.close();
//
//		return check > 0;
	}

}
