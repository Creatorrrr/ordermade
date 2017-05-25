package ordermade.store.facade;

import java.util.List;

import ordermade.domain.Tag;

public interface TagStore {
	public boolean insertTag(Tag tag);

	public boolean deleteTagById(String id);

	public List<Tag> selectTagsByPortfolioId(String portfolioId);

	public List<Tag> retrieveTagsFromGoogleVision(String path);
}
