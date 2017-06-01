package ordermade.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="inviterequests")
@XmlAccessorType(XmlAccessType.FIELD)
public class InviteRequests {
	@XmlElement(name="inviterequest")
	private List<InviteRequest> inviteRequests;
	
	public InviteRequests() {}

	public InviteRequests(List<InviteRequest> inviteRequests) {
		this.inviteRequests = inviteRequests;
	}

	public List<InviteRequest> getInviteRequests() {
		return inviteRequests;
	}

	public void setInviteRequests(List<InviteRequest> inviteRequests) {
		this.inviteRequests = inviteRequests;
	}
}
