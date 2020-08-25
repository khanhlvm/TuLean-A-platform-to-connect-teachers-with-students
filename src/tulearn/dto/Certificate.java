package tulearn.dto;

public class Certificate {
	private int tutorID;
	private	String certificateName;
	private String certificateURL;
	
	public Certificate() {
		super();
	}

	public Certificate(int tutorID, String certificateName, String certificateURL) {
		super();
		this.tutorID = tutorID;
		this.certificateName = certificateName;
		this.certificateURL = certificateURL;
	}

	public int getTutorID() {
		return tutorID;
	}

	public void setTutorID(int tutorID) {
		this.tutorID = tutorID;
	}

	public String getCertificateName() {
		return certificateName;
	}

	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}

	public String getCertificateURL() {
		return certificateURL;
	}

	public void setCertificateURL(String certificateURL) {
		this.certificateURL = certificateURL;
	}
	
}
