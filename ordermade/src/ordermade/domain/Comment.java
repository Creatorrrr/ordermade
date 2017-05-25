package ordermade.domain;

import java.sql.Date;

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
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
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
	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", member=" + member + ", request=" + request + ", time="
				+ time + "]";
	}
	
}
