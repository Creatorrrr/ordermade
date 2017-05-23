package ordermade.store.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import ordermade.domain.Comment;

public interface CommentMapper {
	
	public boolean insertComment(Comment comment);
	public boolean updateCommentById(Comment comment);
	public boolean deleteCommentById(String id);
	public List<Comment> selectCommentsByRequestId(@RequestParam("request") String requestId, @RequestParam("page") String page);

}
