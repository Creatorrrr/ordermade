package ordermade.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ordermade.domain.Comment;
import ordermade.store.facade.CommentStore;
import ordermade.store.mapper.CommentMapper;

public class CommentStoreLogic implements CommentStore{
	
	private SqlSession session;
	
	public CommentStoreLogic() {
		session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}

	@Override
	public boolean insertComment(Comment comment) {
		
		boolean check = false;
		
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			check = mapper.insertComment(comment);
			session.commit();
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public boolean updateCommentById(Comment comment) {
		
		boolean check = false;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			check = mapper.updateCommentById(comment);
			session.commit();
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public boolean deleteCommentById(String id) {
		boolean check = false;
		try{
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			check = mapper.deleteCommentById(id);
			session.commit();
		} finally {
			session.close();
		}
		return check;
	}

	@Override
	public List<Comment> selectCommentsByRequestId(String requestId, String page) {
		List<Comment> commentList = new ArrayList<>();
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			commentList = mapper.selectCommentsByRequestId(requestId, page);
			session.commit();
		} finally {
			session.close();
		}
		return commentList;
	}

}
