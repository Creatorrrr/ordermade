package ordermade.domain;

import java.util.List;

public class Request {
	private String id;
	private String title;
	private Member maker;
	private Member consumer;
	private Category category;
	private String content;
	private int hopePrice;
	private int price;
	private List<Comment> comments;
	private List<Attach> attachs;
	private String bound;
	
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
	public Member getMaker() {
		return maker;
	}
	public void setMaker(Member maker) {
		this.maker = maker;
	}
	public Member getConsumer() {
		return consumer;
	}
	public void setConsumer(Member consumer) {
		this.consumer = consumer;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHopePrice() {
		return hopePrice;
	}
	public void setHopePrice(int hopePrice) {
		this.hopePrice = hopePrice;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public List<Attach> getAttachs() {
		return attachs;
	}
	public void setAttachs(List<Attach> attachs) {
		this.attachs = attachs;
	}
	public String getBound() {
		return bound;
	}
	public void setBound(String bound) {
		this.bound = bound;
	}
}
