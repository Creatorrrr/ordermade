package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Comment;

public interface CommentStore {
	
	public boolean insertComment(Comment comment);
	public boolean updateCommentById(Comment comment);
	public boolean deleteCommentById(String id);
	public List<Comment> selectCommentsByRequestId(String requestId, String page);
	
}
