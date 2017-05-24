package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Category;

public interface CategoryStore {
	public List<Category> selectAllCategory();
}
