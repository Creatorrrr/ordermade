package ordermade.domain;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.stereotype.Component;

@XmlRootElement(name="comment")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Comment {
	private String id;
	private String content;
	private Member member;
	private Request request;
	private Date time;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Member getMember() {
		if(this.member == null) return this.member;
		Member safeMaker=this.member;
		safeMaker.setPassword(null);
		safeMaker.setMemberType(null);
		safeMaker.setLicenseNumber(null);
		return safeMaker;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	@XmlTransient 
	public Request getRequest() {
		return request;
	}
	public void setRequest(Request request) {
		this.request = request;
	}
	
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
}
