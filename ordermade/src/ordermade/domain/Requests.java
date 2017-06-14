package ordermade.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="requests")
@XmlAccessorType(XmlAccessType.FIELD)
public class Requests {
	
	@XmlElement(name="request")
	private List<Request> requests;
	private int rows;

	public Requests() {}
	
	public Requests(List<Request> requests) {
		this.requests = requests;
	}
	
	public Requests(List<Request> requests, int rows) {
		this.requests = requests;
		this.rows = rows;
	}

	public List<Request> getRequests() {
		return requests;
	}

	public void setRequests(List<Request> requests) {
		this.requests = requests;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}
	
}
