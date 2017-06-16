package ordermade.constants;

public class Constants {
	public static final int PRODUCT_ROW_SIZE = 10;
	public static final int REVIEW_ROW_SIZE = 5;
	public static final int REQUEST_ROW_SIZE = 10;
	public static final int INVITEREQUEST_ROW_SIZE = 10;
	public static final int COMMENT_ROW_SIZE = 5;
	public static final int ATTACH_ROW_SIZE = 20;
	public static final int PORTFOLIO_ROW_SIZE = 10;
	public static final int PURCHASEHISTORY_ROW_SIZE = 10;
	
	// 본인 이클립스 경로의 WebContent 폴더에 생성됨
	// ex) C:\kosta_14\down\eclipse-jee-neon-2-win32-x86_64\eclipse\WebContent
	public static final String ROOT = "C:/Users/Administrator/ordermade";	

	public static final String FILE_PATH = ROOT +"/file/";
	public static final String IMAGE_PATH = ROOT +"/img/";
	
	public static final String GOOGLE_VISION_URL = "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyCATcj6V5nyNSrx7ql4jfhRKgOfQQelYaU";

	public static final String FORM_REQUEST = "R";
	public static final String FORM_INVITE = "I";
	public static final String PAYMENT_Y = "Y";
	public static final String PAYMENT_N = "N";
	public static final String CONSUMER = "C";
	public static final String MAKER = "M";
	public static final String COMMENT_TYPE_CONTENT = "C";
	public static final String COMMENT_TYPE_FILE = "F";
	public static final String BOUND_PUBLIC = "PUBLIC";
	public static final String BOUND_PRIVATE = "PRIVATE";
	public static final String DELIVERY_PREPARE = "P";
	public static final String DELIVERY_COMPLETE = "C";

	public static final String PANDA_ACCOUNT = "0";
	public static final int INITIAL_MONEY = 1000000;

	// Category
	public enum CategoryType {
		FUNITIURE, ACCESSORY, KITCHEN, DIGITAL, CLOTHING, SPORT
//		가구, 가방, 뷰티, 신발, 악세사리, 의류, 지갑, 파우치, 휴대폰케이스
	}

	public static final String PORTFOLIO_TITLE = "portfolioTitle";
	public static final String PORTFOLIO_CONTENT = "portfolioContent";
}
