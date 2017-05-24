package ordermade.service.logic;

import java.util.List;

import ordermade.domain.Category;
import ordermade.service.facade.CategoryService;
import ordermade.store.facade.CategoryStore;
import ordermade.store.logic.CategoryStoreLogic;

public class CategoryServiceLogic implements CategoryService {

	private CategoryStore store;

	public CategoryServiceLogic() {
		store = new CategoryStoreLogic();
	}

	@Override
	public List<Category> findAllCategory() {
		return store.selectAllCategory();
	}

}
