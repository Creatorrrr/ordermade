package ordermade.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.stereotype.Component;

@XmlRootElement(name = "review")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Review {
	private String id;
	private String title;
	private Member consumer;
	private String content;
	private int grade;
	private Product product;

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

	@XmlTransient 
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}