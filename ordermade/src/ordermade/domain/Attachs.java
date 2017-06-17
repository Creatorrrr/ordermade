package ordermade.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="attachs")
@XmlAccessorType(XmlAccessType.FIELD)
public class Attachs {
	
	@XmlElement(name="attach")
	private List<Attach> attachs;
	
	public Attachs() {}
	
	public Attachs(List<Attach> attachs) {
		this.attachs = attachs;
	}

	public List<Attach> getAttachs() {
		return attachs;
	}

	public void setAttachs(List<Attach> attachs) {
		this.attachs = attachs;
	}

	
}
