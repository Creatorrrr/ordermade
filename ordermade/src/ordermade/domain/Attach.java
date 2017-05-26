package ordermade.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="attach")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class Attach {
	private String id;
	private String path;
	private String fileName;
	private String extension;
	private Request request;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public Request getRequest() {
		return request;
	}
	public void setRequest(Request request) {
		this.request = request;
	}
	@Override
	public String toString() {
		return "Attach [id=" + id + ", path=" + path + ", fileName=" + fileName + ", extension=" + extension
				+ ", request=" + request + "]";
	}
}
