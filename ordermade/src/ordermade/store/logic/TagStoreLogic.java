package ordermade.store.logic;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ordermade.constants.Constants;
import ordermade.domain.Tag;
import ordermade.store.facade.TagStore;
import ordermade.store.mapper.TagMapper;

@Repository
public class TagStoreLogic implements TagStore {
	
	private SqlSession session;
	
	public TagStoreLogic() {
		 session = SqlSessionFactoryProvider.getSqlSessionFactory().openSession();
	}

	@Override
	public boolean insertTag(Tag tag) {
		TagMapper mapper = session.getMapper(TagMapper.class);
		int check = mapper.insertTag(tag);
		session.close();
		return check > 0;

	}

	@Override
	public boolean deleteTagById(String id) {
		TagMapper mapper = session.getMapper(TagMapper.class);
		int check = mapper.deleteTagById(id);
		session.close();
		return check > 0;

	}

	@Override
	public List<Tag> selectTagsByPortfolioId(String portfolioId) {
		TagMapper mapper = session.getMapper(TagMapper.class);
		List<Tag> list = mapper.selectTagsByPortfolioId(portfolioId);
		session.close();
		return list;

	}

	@Override
	public List<Tag> retrieveTagsFromGoogleVision(String path) {
		String labelJson = getJsonFromGoogleVision(Constants.GOOGLE_VISION_URL, path, "LABEL_DETECTION", 10);
		System.out.println(labelJson);
		return null;
	}
	
	private String getJsonFromGoogleVision(String url, String filePath, String type, int maxResults) {
		BufferedReader br = null;
		StringBuilder strBuilder = new StringBuilder();
		
		try {
			HttpClient httpClient = HttpClientBuilder.create().build();
			
			String json = makeRequestJson(filePath, type, maxResults);
			
			HttpPost request = new HttpPost(url);
		    StringEntity params =new StringEntity(json);
		    request.addHeader("content-type", "application/json");
		    request.setEntity(params);
		    HttpResponse response = httpClient.execute(request);
		    
		    String line;
		    br = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			while ((line = br.readLine()) != null) {
				strBuilder.append(line);
			}
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(br != null) br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return strBuilder.toString();
	}
	
	private String makeRequestJson(String filePath, String type, int maxResults) {
		StringBuffer strBuf = new StringBuffer();
		
		String imageBase64 = imgToBase64(filePath);
		
		strBuf.append("{'requests':[{'image':{'content': '");
		strBuf.append(imageBase64);
		strBuf.append("'},'features': [{'type':'");
		strBuf.append(type);
		strBuf.append("','maxResults':");
		strBuf.append(maxResults);
		strBuf.append("}]}]}");
		
		return strBuf.toString();
	}
	
	private String imgToBase64(String filePath) {
		String imageBase64 = null;

        File file = new File(filePath);
        
        try(FileInputStream inputStream = new FileInputStream(file);
        		ByteArrayOutputStream byteOutStream = new ByteArrayOutputStream();) {

            if(file.exists()) {
                int len = 0;
                byte[] buf = new byte[1024];
                while( (len = inputStream.read( buf )) != -1 ) {
                    byteOutStream.write(buf, 0, len);
                }

                byte[] fileArray = byteOutStream.toByteArray();
                imageBase64 = new String(Base64.encodeBase64(fileArray));
            }
        } catch( IOException e) {
            e.printStackTrace();
        }
        
        return imageBase64;
	}
}
