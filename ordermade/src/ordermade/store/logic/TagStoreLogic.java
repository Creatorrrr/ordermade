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
	
	private SqlSession session;
	
	public TagStoreLogic() {
		session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}

	private SqlSession session;

	public TagStoreLogic() {
		session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}

	@Override
	public boolean insertTag(Tag tag) {

<<<<<<< HEAD
=======
		int check = 0;

>>>>>>> refs/remotes/origin/paul20170523
		TagMapper mapper = session.getMapper(TagMapper.class);
		int check = mapper.insertTag(tag);
		session.commit();
		session.close();

		return check > 0;

	}

	@Override
	public boolean deleteTagById(String id) {

<<<<<<< HEAD
=======
		int check = 0;

>>>>>>> refs/remotes/origin/paul20170523
		TagMapper mapper = session.getMapper(TagMapper.class);
		int check = mapper.deleteTagById(id);
		session.commit();
		session.close();

		return check > 0;

	}

	@Override
	public Tag selectTagById(String id) {
<<<<<<< HEAD

=======
	
>>>>>>> refs/remotes/origin/paul20170523
		TagMapper mapper = session.getMapper(TagMapper.class);
		Tag tag = mapper.selectTagById(id);
		session.commit();
		session.close();

		return tag;

	}

	@Override
	public List<Tag> TagsFromGoogleVision(String path) {
<<<<<<< HEAD

=======
		
>>>>>>> refs/remotes/origin/paul20170523
		TagMapper mapper = session.getMapper(TagMapper.class);
		List<Tag> list = mapper.TagsFromGoogleVision(path);
		session.commit();
		session.close();

		return list;

	}

}
