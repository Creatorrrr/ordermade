package ordermade.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.domain.Review;
import ordermade.store.facade.ReviewStore;
import ordermade.store.mapper.ReviewMapper;

@Repository
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
	public boolean updateReviewById(Review review) {
		SqlSession session = factory.openSession();
		boolean check=false;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			check = mapper.updateReviewById(review);
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
	public boolean deleteReviewById(String id) {
		SqlSession session = factory.openSession();
		boolean check=false;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			check = mapper.deleteReviewById(id);
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
	public List<Review> selectReviewsByProductId(String productId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Review> reviewList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("productId", productId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			reviewList = mapper.selectReviewsByProductId(map);
		}finally {
			session.close();
		}
		return reviewList;
	}

	@Override
	public List<Review> selectReviewsByTitleAndProductId(String title, String productId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Review> reviewList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("productId", productId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			reviewList = mapper.selectReviewsByTitleAndProductId(map);
		}finally {
			session.close();
		}
		return reviewList;
	}

	@Override
	public List<Review> selectReviewsByConsumerIdAndProductId(String consumerId, String productId, String begin, String end) {
		SqlSession session = factory.openSession();
		List<Review> reviewList = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("consumerId", consumerId);
		map.put("productId", productId);
		map.put("begin", begin);
		map.put("end", end);
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			reviewList = mapper.selectReviewsByConsumerIdAndProductId(map);
		}finally {
			session.close();
		}
		return reviewList;
	}
}
