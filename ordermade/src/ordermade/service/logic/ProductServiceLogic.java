package ordermade.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ordermade.constants.Constants;
import ordermade.domain.Category;
import ordermade.domain.Member;
import ordermade.domain.Product;
import ordermade.domain.Review;
import ordermade.domain.Tag;
import ordermade.service.facade.ProductService;
import ordermade.store.facade.CategoryStore;
import ordermade.store.facade.ProductStore;
import ordermade.store.facade.ReviewStore;
import ordermade.store.facade.TagStore;

@Service
public class ProductServiceLogic implements ProductService{
	
	@Autowired
	private ProductStore pStore;
	@Autowired
	private ReviewStore rStore;
	@Autowired
	private CategoryStore cStore;
	@Autowired
	private TagStore tStore;

	@Override
	public boolean registerProduct(Product product) {
		boolean result = pStore.insertProduct(product);

		List<Tag> tagList = tStore.retrieveTagsFromGoogleVision(product.getImage());
		for(Tag t : tagList) {
			t.setProduct(product);
			tStore.insertTag(t);
		}
		
		return result;
	}

	@Override
	public boolean modifyProductById(Product product) {
		return pStore.updateProductById(product);
	}

	@Override
	public boolean removeProductById(String id) {
		return pStore.deleteProductById(id);
	}

	@Override
	public Product findProductById(String id) {
		Product product = pStore.selectProductById(id);
		product.setHit(product.getHit() + 1);
		pStore.updateProductById(product);
		return excludePassword(product);
	}

	@Override
	public List<Product> findProductsByCategoryOrderByHitsForMain(String category, String page) {
		return excludePassword(pStore.selectProductsByCategoryOrderByHitsForMain(category, page));
	}

	@Override
	public List<Product> findProductsByCategoryOrderByIdForMain(String category, String page) {
		return excludePassword(pStore.selectProductsByCategoryOrderByIdForMain(category, page));
	}

	@Override
	public List<Product> findProductsByImage(String image) {
		List<Tag> tagList = tStore.retrieveTagsFromGoogleVision(image);	// 현재 이미지의 특징을 추출함
		return excludePassword(pStore.selectProductsByTags(tagList));	// 태그에 해당하는 상품 불러옴
	}

	@Override
	public List<Product> findProductsByCategoryAndTitle(String category, String title, String page) {
		return excludePassword(pStore.selectProductsByCategoryAndTitle(category, title, getProductBegin(page), getProductEnd(page)));
	}

	@Override
	public List<Product> findProductsByCategoryAndMakerName(String category, String makerName, String page) {
		return excludePassword(pStore.selectProductsByCategoryAndMakerName(category, makerName, getProductBegin(page), getProductEnd(page)));
	}

	@Override
	public List<Product> findProductsByMakerId(String makerId, String page) {
		return excludePassword(pStore.selectProductsByMakerId(makerId, getProductBegin(page), getProductEnd(page)));
	}
	
	@Override
	public int findRowsByMakerId(String makerId) {
		return pStore.selectRowsByMakerId(makerId);
	}

	@Override
	public List<Product> findProductsByMakerIdAndTitle(String makerId, String title, String page) {
		return excludePassword(pStore.selectProductsByMakerIdAndTitle(makerId, title, getProductBegin(page), getProductEnd(page)));
	}

	@Override
	public List<Product> findProductsByCategory(String category, String page) {
		return excludePassword(pStore.selectProductsByCategory(category, getProductBegin(page), getProductEnd(page)));
	}
	
	@Override
	public int findRowsProductsByCategory(String category) {
		return pStore.selectRowsProductsByCategory(category);
	}
	
	@Override
	public List<Product> findProductsByTitle(String title, String page) {
		return excludePassword(pStore.selectProductsByTitle(title, getProductBegin(page), getProductEnd(page)));
	}
	
	@Override
	public List<Product> findProductsByMakerName(String makerName, String page) {
		return excludePassword(pStore.selectProductsByMakerName(makerName, getProductBegin(page), getProductEnd(page)));
	}

	@Override
	public boolean registerReview(Review review) {
		return rStore.insertReview(review);
	}

	@Override
	public boolean modifyReviewById(Review review) {
		return rStore.updateReviewById(review);
	}

	@Override
	public boolean removeReviewById(String id) {
		return rStore.deleteReviewById(id);
	}

	@Override
	public List<Review> findReviewsByProductId(String productId, String page) {
		return rStore.selectReviewsByProductId(productId, getReviewBegin(page), getReviewEnd(page));
	}

	@Override
	public List<Review> findReviewsByTitleAndProductId(String title, String productId, String page) {
		return rStore.selectReviewsByTitleAndProductId(title, productId, getReviewBegin(page), getReviewEnd(page));
	}

	@Override
	public List<Review> findReviewsByConsumerIdAndProductId(String consumerId, String productId, String page) {
		return rStore.selectReviewsByConsumerIdAndProductId(consumerId, productId, getReviewBegin(page), getReviewEnd(page));
	}

	@Override
	public List<Category> findAllCategory() {
		return cStore.selectAllCategory();
	}
	
	private String getProductBegin(String page) {
		return (Integer.parseInt(page) - 1) * Constants.PRODUCT_ROW_SIZE + 1 + "";
	}
	
	private String getProductEnd(String page) {
		return Integer.parseInt(page) * Constants.PRODUCT_ROW_SIZE + "";
	}

	private String getReviewBegin(String page) {
		return (Integer.parseInt(page) - 1) * Constants.REVIEW_ROW_SIZE + 1 + "";
	}
	
	private String getReviewEnd(String page) {
		return Integer.parseInt(page) * Constants.REVIEW_ROW_SIZE + "";
	}
	
	private Product excludePassword(Product product) {
		Member maker = product.getMaker();
		if(maker != null) {
			maker.setPassword("");
		}
		return product;
	}
	
	private List<Product> excludePassword(List<Product> productList) {
		for(Product p : productList) {
			Member maker = p.getMaker();
			if(maker != null) {
				maker.setPassword("");
			}
		}
		return productList;
	}
}
