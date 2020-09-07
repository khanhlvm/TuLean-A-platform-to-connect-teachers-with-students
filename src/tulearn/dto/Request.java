package tulearn.dto;

public class Request {
	private Tutor tutor;
	private Post post;
	private int statusID;
	private boolean typeRequest;
	
	public Request() {
		super();
	}

	public Request(Tutor tutor, Post post, int statusID, boolean typeRequest) {
		super();
		this.tutor = tutor;
		this.post = post;
		this.statusID = statusID;
		this.typeRequest = typeRequest;
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
