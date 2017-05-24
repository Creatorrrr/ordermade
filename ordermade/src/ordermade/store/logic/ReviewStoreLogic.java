package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ordermade.domain.Review;
import ordermade.store.facade.ReviewStore;
import ordermade.store.mapper.ReviewMapper;

public class ReviewStoreLogic implements ReviewStore {
	private SqlSessionFactory factory;
	
	public ReviewStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public boolean insertReview(Review review) {
		SqlSession session = factory.openSession();
		boolean check=false;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			check = mapper.insertReview(review);
			if(check){
				session.commit();
			}else{
				session.rollback();
			}
		}finally {
			session.close();
		}
		return check;
	}

	@Override
	public boolean updateReview(Review review) {
		return false;
	}

	@Override
	public boolean deleteReviewById(String id) {
		return false;
	}

	@Override
	public List<Review> selectReviewsByProductId(String productId, String page) {
		return null;
	}

	@Override
	public List<Review> selectReviewsByTitleAndProductId(String title, String productId, String page) {
		return null;
	}

	@Override
	public List<Review> selectReviewsByConsumerIdAndProductId(String consumerId, String productId, String page) {
		return null;
	}

}
