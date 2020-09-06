package tulearn.dto;

public class Feedback extends Report{
	private byte grade;

	public Feedback() {
		super();
	}
	
	public Feedback(int tutorID, int postID, String dateTime, String content, byte grade) {
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
