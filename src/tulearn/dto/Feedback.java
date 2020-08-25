package tulearn.dto;

public class Feedback extends FeedbackReport{
	private byte grade;

	public Feedback() {
		super();
	}

	public Feedback(byte tutorID, byte postID, String dateTime, String content, byte grade) {
		super(tutorID, postID, dateTime, content);
		this.grade = grade;
	}

	public byte getGrade() {
		return grade;
	}

	public void setGrade(byte grade) {
		this.grade = grade;
	}
	
}
