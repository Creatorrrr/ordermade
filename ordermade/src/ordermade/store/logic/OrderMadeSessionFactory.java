package ordermade.store.logic;

import java.io.IOException;
import java.io.Reader;

import javax.management.RuntimeErrorException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class OrderMadeSessionFactory {
private static OrderMadeSessionFactory instance;
private static SqlSessionFactory sqlSessionFactory;

private final String resources = "mybatis-config.xml";
private OrderMadeSessionFactory(){}

public static OrderMadeSessionFactory getInstance(){
	if(instance == null){
		instance = new OrderMadeSessionFactory();
	}
	
	return instance;
}

public SqlSession getSession(){
	if(sqlSessionFactory == null){
		Reader reader = null;
		
		try {
			reader = Resources.getResourceAsReader(resources);
			
			
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("Mybatis 설정파일 로드중 오류 발생");
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
	}
	
	return sqlSessionFactory.openSession(true); //오토 커밋 commit
}

}
