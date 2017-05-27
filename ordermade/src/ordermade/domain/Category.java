package ordermade.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="category")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class Category {
	private String type;

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
