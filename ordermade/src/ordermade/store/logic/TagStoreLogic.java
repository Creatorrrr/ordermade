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

	@Override
	public boolean insertTag(Tag tag) {

		int check = 0;

		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();

		TagMapper mapper = session.getMapper(TagMapper.class);
		check = mapper.insertTag(tag);
		session.close();

		return check > 0;

	}

	@Override
	public boolean deleteTagById(String id) {

		int check = 0;

		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();

		TagMapper mapper = session.getMapper(TagMapper.class);
		check = mapper.deleteTagById(id);
		session.close();
		
		return check > 0;

	}

	@Override
	public Tag selectTagById(String id) {
	
		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();
		
		TagMapper mapper = session.getMapper(TagMapper.class);
		Tag tag = mapper.selectTagById(id);
		session.close();
		
		return tag;

	}

	@Override
	public List<Tag> TagsFromGoogleVision(String path) {
		
		SqlSession session = OrderMadeSessionFactory.getInstance().getSession();
		
		TagMapper mapper = session.getMapper(TagMapper.class);
		List<Tag> list = mapper.TagsFromGoogleVision(path);
		session.close();
		
		return list;

	}

}
