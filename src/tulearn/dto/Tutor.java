package tulearn.dto;

public class Tutor extends User{
	private String salary;
	private String workAt;
	private String identityCard;
	private String studentCard;
	
	public Tutor() {
		super();
	}

	public Tutor(String email, String phone, String password, String name, String avatar, String street, byte roleID,
			byte statusUserID, byte genderID, byte qualificationID, byte communeID, String salary, String workAt,
			String identityCard, String studentCard) {
		super(email, phone, password, name, avatar, street, roleID, statusUserID, genderID, qualificationID, communeID);
		this.salary = salary;
		this.workAt = workAt;
		this.identityCard = identityCard;
		this.studentCard = studentCard;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getWorkAt() {
		return workAt;
	}

	public void setWorkAt(String workAt) {
		this.workAt = workAt;
	}

	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}

	public String getStudentCard() {
		return studentCard;
	}

	public void setStudentCard(String studentCard) {
		this.studentCard = studentCard;
	}
	
	
}
