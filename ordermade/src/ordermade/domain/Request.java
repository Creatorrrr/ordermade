package ordermade.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;


@XmlRootElement(name="request")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Request {
	private String id;
	private String title;
	private Member maker;
	private Member consumer;
	private String category;
	private String content;
	private int hopePrice;
	private int price;
	private List<Comment> comments;
	private List<Attach> attachs;
	private String bound;
	private String page;
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "Request [id=" + id + ", title=" + title + ", maker=" + maker + ", consumer=" + consumer + ", category="
				+ category + ", content=" + content + ", hopePrice=" + hopePrice + ", price=" + price + ", comments="
				+ comments + ", attachs=" + attachs + ", bound=" + bound + "]";
	}
	
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
	
	@XmlElement(name="maker")
	public Member getMaker() {
		if(this.maker == null) return this.maker;
		Member safeMaker=this.maker;
		safeMaker.setPassword(null);
		safeMaker.setMemberType(null);
		safeMaker.setLicenseNumber(null);
		return safeMaker;
	}
	public void setMaker(Member maker) {
		this.maker = maker;
	}
	@XmlElement(name="consumer")
	public Member getConsumer() {
		if(this.consumer == null) return this.consumer;
		Member safeConsumer=this.consumer;
		safeConsumer.setPassword(null);
		safeConsumer.setMemberType(null);
		safeConsumer.setLicenseNumber(null);
		return safeConsumer;
	}
	public void setConsumer(Member consumer) {
		this.consumer = consumer;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
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
	
	@XmlElement(name="comment")
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
	@XmlElement(name="attach")
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
