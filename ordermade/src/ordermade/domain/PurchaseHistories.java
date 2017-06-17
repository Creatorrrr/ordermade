package ordermade.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="purchaseHistories")
@XmlAccessorType(XmlAccessType.FIELD)
public class PurchaseHistories {
	
	@XmlElement(name="purchaseHistory")
	private List<PurchaseHistory> purchaseList;
	
	public PurchaseHistories() {}

	public PurchaseHistories(List<PurchaseHistory> purchaseList) {
		this.purchaseList = purchaseList;
	}

	public List<PurchaseHistory> getPurchaseList() {
		return purchaseList;
	}

	public void setPurchaseList(List<PurchaseHistory> purchaseList) {
		this.purchaseList = purchaseList;
	}
}
