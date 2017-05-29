package ordermade.constants;

public class Constants {
	public static final int PRODUCT_ROW_SIZE = 5;
	public static final int REVIEW_ROW_SIZE = 5;
	public static final int REQUEST_ROW_SIZE = 20;
	public static final int INVITEREQUEST_ROW_SIZE = 20;
	public static final int COMMENT_ROW_SIZE = 10;
	public static final int ATTACH_ROW_SIZE = 10;
	public static final int PORTFOLIO_ROW_SIZE = 10;
	public static final int PURCHASEHISTORY_ROW_SIZE = 10;

	public static final String ROOT = "./WebContent";
	
	public static final String IMAGE_PATH = ROOT +"/img/";
	
	public static final String GOOGLE_VISION_URL = "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyCATcj6V5nyNSrx7ql4jfhRKgOfQQelYaU";

	public static final String FORM_REQUEST = "R";
	public static final String FORM_INVITE = "I";
	public static final String PAYMENT_Y = "Y";
	public static final String PAYMENT_N = "N";
	public static final String CONSUMER = "C";
	public static final String MAKER = "M";

	// Category
	public enum CategoryType {
		FUNITIURE, ACCESSORY, KITCHEN, DIGITAL, CLOTHING, SPORT
	}

	public static final String PORTFOLIO_TITLE = "portfolioTitle";
	public static final String PORTFOLIO_CONTENT = "portfolioContent";
}
