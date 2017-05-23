package ordermade.store.logic;

import java.io.IOException;

public class SqlSessionFactoryProvider{
	private static final String resource = "mybatis-config.xml";
	
	private static SqlSessionFactory factory;
	
	public static SqlSessionFactory getSqlSessionFactory(){
		if(factory == null){
			createSqlSessionFactory();
		}
		return factory;
	}
	
	private static void createSqlSessionFactory(){
		Reader reader = null;
		
		try {
			reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}