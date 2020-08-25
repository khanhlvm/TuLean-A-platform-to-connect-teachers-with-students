package tulearn.dto;

public abstract class FeedbackReport {
	private byte tutorID;
	private byte postID;
	private String dateTime;
	private String content;
	
	public FeedbackReport() {
		super();
	}

	public FeedbackReport(byte tutorID, byte postID, String dateTime, String content) {
		super();
		this.tutorID = tutorID;
		this.postID = postID;
		this.dateTime = dateTime;
		this.content = content;
	}

	public byte getTutorID() {
		return tutorID;
	}

	public void setTutorID(byte tutorID) {
		this.tutorID = tutorID;
	}

	public byte getPostID() {
		return postID;
	}

	public void setPostID(byte postID) {
		this.postID = postID;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
