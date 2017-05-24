package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Review;

public interface ReviewStore {
	public boolean insertReview(Review review);
	public boolean updateReview(Review review);
	public boolean deleteReviewById(String id);
	public List<Review> selectReviewsByProductId(String productId, String page);
	public List<Review> selectReviewsByTitleAndProductId(String title, String productId, String page);
	public List<Review> selectReviewsByConsumerIdAndProductId(String consumerId, String productId, String page);
}
