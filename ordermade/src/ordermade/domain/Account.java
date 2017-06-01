package ordermade.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="account")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Account {
	private Member member;
	private int money;
	
	public Member getMaker() {
		if(this.member == null) return this.member;
		Member safeMaker=this.member;
		safeMaker.setPassword(null);
		safeMaker.setMemberType(null);
		safeMaker.setLicenseNumber(null);
		return safeMaker;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
}
