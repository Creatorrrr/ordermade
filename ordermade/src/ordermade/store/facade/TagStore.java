package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Tag;

public interface TagStore {
	public boolean insertTag(Tag tag);

	public boolean deleteTagByProductId(String productId);

	public List<Tag> selectTagsByProductId(String productId);

	public List<Tag> retrieveTagsFromGoogleVision(String path);
}
