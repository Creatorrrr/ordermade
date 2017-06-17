package ordermade.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="inviterequest")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class InviteRequest {
	private String id;
	private String message;
	private Member maker;
	private String requestTime;
	private Request request;
	private String form;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
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
	public String getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}
	public Request getRequest() {
		return request;
	}
	public void setRequest(Request request) {
		this.request = request;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
}
