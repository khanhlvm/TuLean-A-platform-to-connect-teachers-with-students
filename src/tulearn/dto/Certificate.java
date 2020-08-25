package tulearn.dto;

public class Certificate {
	private byte tutorID;
	private	String certificateName;
	private String certificateURL;
	
	public Certificate() {
		super();
	}

	public Certificate(byte tutorID, String certificateName, String certificateURL) {
		super();
		this.tutorID = tutorID;
		this.certificateName = certificateName;
		this.certificateURL = certificateURL;
	}

	public byte getTutorID() {
		return tutorID;
	}

	public void setTutorID(byte tutorID) {
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
