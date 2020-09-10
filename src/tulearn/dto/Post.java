package tulearn.dto;

public class Post{
	private int postID;
	private Tutor learner;
	private AddressUser address;
	private Gender gender;
	private Qualificate qualificate;
	private Subject subject;
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

	public Post(int postID, Tutor learner, AddressUser address, Gender gender, Qualificate qualificate, Subject subject,
			int statusPostID, boolean typePost, byte lessonLearn, float timeLearn, String fee, String startDay,
			String postDes) {
		super();
		this.postID = postID;
		this.learner = learner;
		this.address = address;
		this.gender = gender;
		this.qualificate = qualificate;
		this.subject = subject;
		this.statusPostID = statusPostID;
		this.typePost = typePost;
		this.lessonLearn = lessonLearn;
		this.timeLearn = timeLearn;
		this.fee = fee;
		this.startDay = startDay;
		this.postDes = postDes;
	}
	
	

	public Post(Tutor learner, AddressUser address, Gender gender, Qualificate qualificate, Subject subject,
			int statusPostID, boolean typePost, byte lessonLearn, float timeLearn, String fee, String startDay,
			String postDes) {
		super();
		this.learner = learner;
		this.address = address;
		this.gender = gender;
		this.qualificate = qualificate;
		this.subject = subject;
		this.statusPostID = statusPostID;
		this.typePost = typePost;
		this.lessonLearn = lessonLearn;
		this.timeLearn = timeLearn;
		this.fee = fee;
		this.startDay = startDay;
		this.postDes = postDes;
	}

public Post(int postID, Tutor learner, Subject subject, byte lessonLearn, float timeLearn) {
		super();
		this.postID = postID;
		this.learner = learner;
		this.subject = subject;
		this.lessonLearn = lessonLearn;
		this.timeLearn = timeLearn;
	}
	
	

	public Post(int postID, Tutor learner, Subject subject, byte lessonLearn, float timeLearn, String fee) {
		super();
		this.postID = postID;
		this.learner = learner;
		this.subject = subject;
		this.lessonLearn = lessonLearn;
		this.timeLearn = timeLearn;
		this.fee = fee;
	}
	

	public Post(int postID, Tutor learner, AddressUser address, Subject subject, byte lessonLearn, float timeLearn,
			String postDes) {
		super();
		this.postID = postID;
		this.learner = learner;
		this.address = address;
		this.subject = subject;
		this.lessonLearn = lessonLearn;
		this.timeLearn = timeLearn;
		this.postDes = postDes;
	}
	

	


	public Post(int postID, Gender gender, Qualificate qualificate, Subject subject, byte lessonLearn, float timeLearn,
			String fee, String startDay, String postDes) {
		super();
		this.postID = postID;
		this.gender = gender;
		this.qualificate = qualificate;
		this.subject = subject;
		this.lessonLearn = lessonLearn;
		this.timeLearn = timeLearn;
		this.fee = fee;
		this.startDay = startDay;
		this.postDes = postDes;
	}

	public int getPostID() {
		return postID;
	}

	public void setPostID(int postID) {
		this.postID = postID;
	}

	public User getLearner() {
		return learner;
	}

	public void setLearner(Tutor learner) {
		this.learner = learner;
	}

	public AddressUser getAddress() {
		return address;
	}

	public void setAddress(AddressUser address) {
		this.address = address;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public Qualificate getQualificate() {
		return qualificate;
	}

	public void setQualificate(Qualificate qualificate) {
		this.qualificate = qualificate;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
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
