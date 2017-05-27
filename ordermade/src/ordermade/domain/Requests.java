package ordermade.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="requests")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class Requests {
	
	@XmlElement(name="request")
	private List<Request> requests;

	public Requests() {}
	
	public Requests(List<Request> requests) {
		this.requests = requests;
	}

	public List<Request> getRequests() {
		return requests;
	}

	public void setRequests(List<Request> requests) {
		this.requests = requests;
	}


}
