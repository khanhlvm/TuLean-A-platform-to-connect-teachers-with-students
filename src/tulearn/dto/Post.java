package tulearn.dto;

public class Post{
	private byte learnerID;
	private byte communeID;
	private byte genderID;
	private byte qualificateID;
	private byte subjectID;
	private byte statusPostID;
	private char typePost;
	private byte lessonLearn;
	private float timeLearn;
	private String fee;
	private String startDay;
	private String postDes;
	
	public Post() {
		super();
	}

	public Post(byte learnerID, byte communeID, byte genderID, byte qualificateID, byte subjectID, byte statusPostID,
			char typePost, byte lessonLearn, float timeLearn, String fee, String startDay, String postDes) {
		super();
		this.learnerID = learnerID;
		this.communeID = communeID;
		this.genderID = genderID;
		this.qualificateID = qualificateID;
		this.subjectID = subjectID;
		this.statusPostID = statusPostID;
		this.typePost = typePost;
		this.lessonLearn = lessonLearn;
		this.timeLearn = timeLearn;
		this.fee = fee;
		this.startDay = startDay;
		this.postDes = postDes;
	}

	public byte getLearnerID() {
		return learnerID;
	}

	public void setLearnerID(byte learnerID) {
		this.learnerID = learnerID;
	}

	public byte getCommuneID() {
		return communeID;
	}

	public void setCommuneID(byte communeID) {
		this.communeID = communeID;
	}

	public byte getGenderID() {
		return genderID;
	}

	public void setGenderID(byte genderID) {
		this.genderID = genderID;
	}

	public byte getQualificateID() {
		return qualificateID;
	}

	public void setQualificateID(byte qualificateID) {
		this.qualificateID = qualificateID;
	}

	public byte getSubjectID() {
		return subjectID;
	}

	public void setSubjectID(byte subjectID) {
		this.subjectID = subjectID;
	}

	public byte getStatusPostID() {
		return statusPostID;
	}

	public void setStatusPostID(byte statusPostID) {
		this.statusPostID = statusPostID;
	}

	public char getTypePost() {
		return typePost;
	}

	public void setTypePost(char typePost) {
		this.typePost = typePost;
	}

	public byte getLessonLearn() {
		return lessonLearn;
	}

	public void setLessonLearn(byte lessonLearn) {
		this.lessonLearn = lessonLearn;
	}

	public float getTimeLearn() {
		return timeLearn;
	}

	public void setTimeLearn(float timeLearn) {
		this.timeLearn = timeLearn;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getPostDes() {
		return postDes;
	}

	public void setPostDes(String postDes) {
		this.postDes = postDes;
	}
	
}
