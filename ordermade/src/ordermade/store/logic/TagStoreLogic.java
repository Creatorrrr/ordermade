package ordermade.store.logic;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.google.cloud.vision.spi.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.protobuf.ByteString;

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
//		try {
//			// Instantiates a client
//		    ImageAnnotatorClient vision = ImageAnnotatorClient.create();
//		
//		    // Reads the image file into memory
//		    Path filePath = Paths.get(path);
//		    byte[] data = Files.readAllBytes(filePath);
//		    ByteString imgBytes = ByteString.copyFrom(data);
//		
//		    // Builds the image annotation request
//		    List<AnnotateImageRequest> requests = new ArrayList<>();
//		    Image img = Image.newBuilder().setContent(imgBytes).build();
//		    Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
//		    AnnotateImageRequest request = AnnotateImageRequest.newBuilder()
//		        .addFeatures(feat)
//		        .setImage(img)
//		        .build();
//		    requests.add(request);
//		
//		    // Performs label detection on the image file
//		    BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
//		    List<AnnotateImageResponse> responses = response.getResponsesList();
//		
//		    for (AnnotateImageResponse res : responses) {
//	    		if (res.hasError()) {
//	    			System.out.printf("Error: %s\n", res.getError().getMessage());
//	    			throw new RuntimeException("Vision ERR");
//		    	}
//				for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
//					annotation.getAllFields().forEach((k, v)->System.out.printf("%s : %s\n", k, v.toString()));
//				}
//		    }
//		}
//		catch (IOException e) {
//			e.printStackTrace();
//		}
	    
		return null;
	}

}
