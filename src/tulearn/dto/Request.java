package tulearn.dto;

public class Request {
	private int tutorID;
	private int postID;
	private int statusID;
	private boolean typeRequest;
	
	public Request() {
		super();
	}

	public Request(int tutorID, int postID, int statusID, boolean typeRequest) {
		super();
		this.tutorID = tutorID;
		this.postID = postID;
		this.statusID = statusID;
		this.typeRequest = typeRequest;
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

	public int getStatusID() {
		return statusID;
	}

	public void setStatusID(int statusID) {
		this.statusID = statusID;
	}

	public boolean isTypeRequest() {
		return typeRequest;
	}

	public void setTypeRequest(boolean typeRequest) {
		this.typeRequest = typeRequest;
	}

	
}
