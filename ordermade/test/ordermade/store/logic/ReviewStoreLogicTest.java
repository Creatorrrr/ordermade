package ordermade.store.logic;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import ordermade.domain.Member;
import ordermade.domain.Product;
import ordermade.domain.Review;
import ordermade.store.facade.ReviewStore;

public class ReviewStoreLogicTest {
	
	private ReviewStore rStore;
	
	@Before
	public void beforeTest() {
		rStore = new ReviewStoreLogic();
	}

//	@Test
//	public void testInsertReview() {
//		Review review = new Review();
//		Member consumer = new Member();
//		consumer.setId("5");
//		review.setConsumer(consumer);
//		review.setContent("1");
//		review.setGrade(3);
//		Product product = new Product();
//		product.setId("5");
//		review.setProduct(product);
//		review.setTitle("7");
//		assertTrue(rStore.insertReview(review));
//	}
//
//	@Test
//	public void testUpdateReviewById() {
//		Review review = new Review();
//		review.setId("5");
//		Member consumer = new Member();
//		consumer.setId("9");
//		review.setConsumer(consumer);
//		review.setContent("9");
//		review.setGrade(0);
//		Product product = new Product();
//		product.setId("6");
//		review.setProduct(product);
//		review.setTitle("99");
//		assertTrue(rStore.updateReviewById(review));
//	}
//
//	@Test
//	public void testDeleteReviewById() {
//		assertTrue(rStore.deleteReviewById("7"));
//	}
//
	@Test
	public void testSelectReviewsByProductId() {
		List<Review> reviewList = rStore.selectReviewsByProductId("6", "1", "5");
		System.out.println(reviewList.size());
		System.out.println(reviewList.get(0).getProduct().getCategory());
		System.out.println(reviewList.get(1).getConsumer().getId());
	}
//
//	@Test
//	public void testSelectReviewsByTitleAndProductId() {
//		List<Review> reviewList = rStore.selectReviewsByTitleAndProductId("99", "6", "1", "5");
//		System.out.println(reviewList.size());
//	}
//
//	@Test
//	public void testSelectReviewsByConsumerIdAndProductId() {
//		List<Review> reviewList = rStore.selectReviewsByConsumerIdAndProductId("9", "6", "1", "5");
//		System.out.println(reviewList.size());
//	}

}
