package ordermade.store.mapper;

import java.util.List;

import ordermade.domain.Tag;

public interface TagMapper {
	public boolean insertTag(Tag tag);

	public boolean deleteTagById(String id);

	public Tag selectTagById(String id);

	public List<Tag> TagsFromGoogleVision(String path);
}
