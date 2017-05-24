package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Review;

public interface ReviewStore {
	public boolean insertReview(Review review);
	public boolean updateReviewById(Review review);
	public boolean deleteReviewById(String id);
	public List<Review> selectReviewsByProductId(String productId, String begin, String end);
	public List<Review> selectReviewsByTitleAndProductId(String title, String productId, String begin, String end);
	public List<Review> selectReviewsByConsumerIdAndProductId(String consumerId, String productId, String begin, String end);
}