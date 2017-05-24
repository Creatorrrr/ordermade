package ordermade.store.mapper;

import java.util.HashMap;
import java.util.List;

import ordermade.domain.Review;

public interface ReviewMapper {
	public boolean insertReview(Review review);
	public boolean updateReviewById(Review review);
	public boolean deleteReviewById(String id);
	public List<Review> selectReviewsByProductId(HashMap<String, String> map);
	public List<Review> selectReviewsByTitleAndProductId(HashMap<String, String> map);
	public List<Review> selectReviewsByConsumerIdAndProductId(HashMap<String, String> map);
}
