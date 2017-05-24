package ordermade.store.mapper;

import java.util.List;

import ordermade.domain.Tag;

public interface TagMapper {
	public int insertTag(Tag tag);

	public int deleteTagById(String id);

	public Tag selectTagById(String id);

	public List<Tag> TagsFromGoogleVision(String path);
}
