package ordermade.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="portfolios")
@XmlAccessorType(XmlAccessType.FIELD)
public class Portfolios {
	
	@XmlElement(name="portfolio")
	private List<Portfolio> portfolios;
	
	public Portfolios(){} 
	
	public Portfolios(List<Portfolio> portfolios){
		this.portfolios=portfolios;
	} 

	public List<Portfolio> getPortfolios() {
		return portfolios;
	}

	public void setPortfolios(List<Portfolio> portfolios) {
		this.portfolios = portfolios;
	}

}
