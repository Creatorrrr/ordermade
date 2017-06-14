package ordermade.store.mapper;

import java.util.List;

import ordermade.domain.Tag;

public interface TagMapper {
	public int insertTag(Tag tag);

	public int deleteTagByProductId(String productId);

	public List<Tag> selectTagsByProductId(String productId);
}
