package tulearn.dto;

public class Gender {
	private int gID;
	private String gName;
	
	public Gender() {
		super();
	}

	public Gender(String gName) {
		super();
		this.gName = gName;
	}

	public Gender(int gID, String gName) {
		super();
		this.gID = gID;
		this.gName = gName;
	}

	public int getgID() {
		return gID;
	}

	public void setgID(int gID) {
		this.gID = gID;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	@Override
	public String toString() {
		return "Gender [gID=" + gID + ", gName=" + gName + "]";
	}
	
}
