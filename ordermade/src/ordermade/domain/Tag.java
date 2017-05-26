package ordermade.domain;

public class Tag {
	private String id;
	private String keyword;
	private double score;
	private Portfolio portfolio;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public Portfolio getPortfolio() {
		return portfolio;
	}
	public void setPortfolio(Portfolio portfolio) {
		this.portfolio = portfolio;
	}
	@Override
	public String toString() {
		return "Tag [id=" + id + ", keyword=" + keyword + ", score=" + score + ", portfolio=" + portfolio + "]";
	}
}
