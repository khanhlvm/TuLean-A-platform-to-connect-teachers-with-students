package tulearn.dto;

public class Request {
	private Tutor tutor;
	private Post post;
	private int statusID;
	private boolean typeRequest;
	private String status;
	
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
	

	public Request(Tutor tutor, Post post) {
		super();
		this.tutor = tutor;
		this.post = post;
	}
	

	public Request(Tutor tutor, Post post, String status) {
		super();
		this.tutor = tutor;
		this.post = post;
		this.status = status;
	}

	public Request(Post post) {
		super();
		this.post = post;
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

	public int isTypeRequest() {
		if(typeRequest) {
			return 1;
		}else {
			return 0;
		}
	}

	public void setTypeRequest(boolean typeRequest) {
		this.typeRequest = typeRequest;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
