package tulearn.dto;

public class ReportFeedback {
	private Tutor tutor;
	private Post post;
	private String dateTime;
	private String content;
	private byte grade;
	
	public ReportFeedback() {
		super();
	}

	public ReportFeedback(Tutor tutor, Post post, String dateTime, String content) {
		super();
		this.tutor = tutor;
		this.post = post;
		this.dateTime = dateTime;
		this.content = content;
	}

	public ReportFeedback(Tutor tutor, Post post, String dateTime, String content, byte grade) {
		super();
		this.tutor = tutor;
		this.post = post;
		this.dateTime = dateTime;
		this.content = content;
		this.grade = grade;
	}

	public Tutor getTutor() {
		return tutor;
	}

	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
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

	public byte getGrade() {
		return grade;
	}

	public void setGrade(byte grade) {
		this.grade = grade;
	}
	
}
