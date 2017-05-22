package ordermade.domain;

public class InviteRequest {
	private String message;
	private Member member;
	private int requestTime;
	private Request request;
	private String form;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(int requestTime) {
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
