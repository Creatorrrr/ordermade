package ordermade.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ordermade.domain.Tag;
import ordermade.store.facade.TagStore;
import ordermade.store.mapper.TagMapper;

@Repository
public class TagStoreLogic implements TagStore {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertTag(Tag tag) {
		
		int check = 0;
		
		TagMapper mapper = sqlSession.getMapper(TagMapper.class);
		return false;
	}

	@Override
	public boolean deleteTagById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Tag selectTagById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Tag> TagsFromGoogleVision(String path) {
		// TODO Auto-generated method stub
		return null;
	}

}
