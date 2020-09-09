package tulearn.dto;

public class Gender {
	private int gID;
	private String gName;
	
	public Gender() {
		super();
	}

	public Gender(int gID, String gName) {
		super();
		this.gID = gID;
		if(gName.equals("M")) {
			this.gName = "Nam";
		}else if(gName.equals("F")) {
			this.gName = "Nữ";
		}else {
			this.gName = "Khác";
		}
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
		if(gName == "M") {
			this.gName = "Nam";
		}else if(gName == "F") {
			this.gName = "Nữ";
		}else {
			this.gName = "Khác";
		}		
	}
		
}
