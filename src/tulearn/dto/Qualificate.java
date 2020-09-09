package tulearn.dto;

public class Qualificate {
	private int qID;
	private String qName;
	
	public Qualificate() {
		super();
	}

	public Qualificate(int qID, String qName) {
		super();
		this.qID = qID;
		this.qName = qName;
	}

	public Qualificate(String qName) {
		super();
		this.qName = qName;
	}

	public int getqID() {
		return qID;
	}

	public void setqID(int qID) {
		this.qID = qID;
	}

	public String getqName() {
		return qName;
	}

	public void setqName(String qName) {
		this.qName = qName;
	}

}
