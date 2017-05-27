package ordermade.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import ordermade.domain.Comment;
import ordermade.store.facade.CommentStore;
import ordermade.store.mapper.CommentMapper;

@Repository
public class CommentStoreLogic implements CommentStore{
	
	private SqlSessionFactory factory;
	
	public CommentStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public boolean insertComment(Comment comment) {
		SqlSession session = factory.openSession();
		boolean check = false;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			check = mapper.insertComment(comment);
			if(check) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public boolean updateCommentById(Comment comment) {
		SqlSession session = factory.openSession();
		boolean check = false;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			check = mapper.updateCommentById(comment);
			if(check) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public boolean deleteCommentById(String id) {
		SqlSession session = factory.openSession();
		boolean check = false;
		try{
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			check = mapper.deleteCommentById(id);
			if(check) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public List<Comment> selectCommentsByRequestId(String requestId, String page) {
		SqlSession session = factory.openSession();
		List<Comment> commentList = new ArrayList<>();
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			commentList = mapper.selectCommentsByRequestId(requestId, page);
		} finally {
			session.close();
		}
		return commentList;
	}

}
