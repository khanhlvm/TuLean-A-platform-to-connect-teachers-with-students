package tulearn.dto;

public class Subject {
	private byte subjectID;
	private String subjectName;
	
	public Subject() {
		super();
	}

	public Subject(byte subjectID, String subjectName) {
		super();
		this.subjectID = subjectID;
		this.subjectName = subjectName;
	}

	public byte getSubjectID() {
		return subjectID;
	}

	public void setSubjectID(byte subjectID) {
		this.subjectID = subjectID;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	
	
}
