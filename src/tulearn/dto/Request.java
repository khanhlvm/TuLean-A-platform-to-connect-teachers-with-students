package tulearn.dto;

public class Request {
	private byte tutorID;
	private byte postID;
	private char typeRequest;
	private byte statusID;
	
	public Request() {
		super();
	}

	public Request(byte tutorID, byte postID, char typeRequest, byte statusID) {
		super();
		this.tutorID = tutorID;
		this.postID = postID;
		this.typeRequest = typeRequest;
		this.statusID = statusID;
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

	public char getTypeRequest() {
		return typeRequest;
	}

	public void setTypeRequest(char typeRequest) {
		this.typeRequest = typeRequest;
	}

	public byte getStatusID() {
		return statusID;
	}

	public void setStatusID(byte statusID) {
		this.statusID = statusID;
	} 
	
	
}
