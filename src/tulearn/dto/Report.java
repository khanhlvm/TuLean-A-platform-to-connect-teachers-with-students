package tulearn.dto;

public class Report {
	private int tutorID;
	private int postID;
	private String dateTime;
	private String content;
	
	public Report() {
		super();
	}

	public Report(int tutorID, int postID, String dateTime, String content) {
		super();
		this.tutorID = tutorID;
		this.postID = postID;
		this.dateTime = dateTime;
		this.content = content;
	}

	public int getTutorID() {
		return tutorID;
	}

	public void setTutorID(int tutorID) {
		this.tutorID = tutorID;
	}

	public int getPostID() {
		return postID;
	}

	public void setPostID(int postID) {
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
