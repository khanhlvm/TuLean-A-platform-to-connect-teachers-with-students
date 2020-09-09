package tulearn.dto;

public class Post{
	private int postID;
	private int learnerID;
	private int communeID;
	private int genderID;
	private int qualificateID;
	private int subjectID;
	private int statusPostID;
	private boolean typePost;
	private byte lessonLearn;
	private float timeLearn;
	private String fee;
	private String startDay;
	private String postDes;
	
	public Post() {
		super();
	}

	public Post(int postID, int learnerID, int communeID, int genderID, int qualificateID, int subjectID,
			int statusPostID, boolean typePost, byte lessonLearn, float timeLearn, String fee, String startDay,
			String postDes) {
		super();
		this.postID = postID;
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
	

	public Post(int postID) {
		super();
		this.postID = postID;
	}

	public int getPostID() {
		return postID;
	}

	public void setPostID(int postID) {
		this.postID = postID;
	}

	public int getLearnerID() {
		return learnerID;
	}

	public void setLearnerID(int learnerID) {
		this.learnerID = learnerID;
	}

	public int getCommuneID() {
		return communeID;
	}

	public void setCommuneID(int communeID) {
		this.communeID = communeID;
	}

	public int getGenderID() {
		return genderID;
	}

	public void setGenderID(int genderID) {
		this.genderID = genderID;
	}

	public int getQualificateID() {
		return qualificateID;
	}

	public void setQualificateID(int qualificateID) {
		this.qualificateID = qualificateID;
	}

	public int getSubjectID() {
		return subjectID;
	}

	public void setSubjectID(int subjectID) {
		this.subjectID = subjectID;
	}

	public int getStatusPostID() {
		return statusPostID;
	}

	public void setStatusPostID(int statusPostID) {
		this.statusPostID = statusPostID;
	}

	public boolean isTypePost() {
		return typePost;
	}

	public void setTypePost(boolean typePost) {
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
