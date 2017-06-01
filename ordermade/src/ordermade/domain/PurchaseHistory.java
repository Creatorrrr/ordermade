package ordermade.domain;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="purchasehistory")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class PurchaseHistory {
	private String id;
	private Member maker;
	private Member consumer;
	private Request request;
	private Date orderDate;
	private String invoiceNumber;
	private int charge;
	private String deliveryStatus;
	private String payment;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	public Member getConsumer() {
		if(this.consumer == null) return this.consumer;
		Member safeConsumer=this.consumer;
		safeConsumer.setPassword(null);
		safeConsumer.setMemberType(null);
		safeConsumer.setLicenseNumber(null);
		return safeConsumer;
	}
	public void setConsumer(Member consumer) {
		this.consumer = consumer;
	}
	public Request getRequest() {
		return request;
	}
	public void setRequest(Request request) {
		this.request = request;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "PurchaseHistory [id=" + id + ", maker=" + maker + ", consumer=" + consumer + ", request=" + request
				+ ", orderDate=" + orderDate + ", invoiceNumber=" + invoiceNumber + ", charge=" + charge
				+ ", deliveryStatus=" + deliveryStatus + ", payment=" + payment + "]";
	}
}