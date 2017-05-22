package ordermade.domain;

public class Review {
	private String id;
	private String title;
	private Member consumer;
	private String content;
	private int grade;
	private ProductPage productPage;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Member getConsumer() {
		return consumer;
	}
	public void setConsumer(Member consumer) {
		this.consumer = consumer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public ProductPage getProductPage() {
		return productPage;
	}
	public void setProductPage(ProductPage productPage) {
		this.productPage = productPage;
	}
}
