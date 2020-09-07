package tulearn.dto;

public class Subject {
	private int sID;
	private String sName;
	
	public Subject() {
		super();
	}

	public Subject(int sID, String sName) {
		super();
		this.sID = sID;
		this.sName = sName;
	}

	public int getsID() {
		return sID;
	}

	public void setsID(int sID) {
		this.sID = sID;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}
	
}
