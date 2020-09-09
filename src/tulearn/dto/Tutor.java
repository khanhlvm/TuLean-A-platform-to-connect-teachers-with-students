package tulearn.dto;

public class Tutor extends User{
	private String salary;
	private String workAt;
	private String identityCard;
	private String studentCard;
	
	public Tutor() {
		super();
	}

	public Tutor(int userID, int roleID, int statusUserID, Gender gender, Qualificate qualificate, AddressUser address,
			String email, String phone, String password, String name, String avatar, String street) {
		super(userID, roleID, statusUserID, gender, qualificate, address, email, phone, password, name, avatar, street);
	}

	public Tutor(int userID, int roleID, int statusUserID, Gender gender, Qualificate qualificate, AddressUser address,
			String email, String phone, String password, String name, String avatar, String street, String salary,
			String workAt, String identityCard, String studentCard) {
		super(userID, roleID, statusUserID, gender, qualificate, address, email, phone, password, name, avatar, street);
		this.salary = salary;
		this.workAt = workAt;
		this.identityCard = identityCard;
		this.studentCard = studentCard;
	}		

	public Tutor(int userID, Gender gender, Qualificate qualificate, AddressUser address, String email, String phone,
			String name, String street) {
		super(userID, gender, qualificate, address, email, phone, name, street);
	}	

	public Tutor(int userID, Gender gender, Qualificate qualificate, AddressUser address, String email, String phone,
			String name, String street, String salary, String workAt, String identityCard, String studentCard) {
		super(userID, gender, qualificate, address, email, phone, name, street);
		this.salary = salary;
		this.workAt = workAt;
		this.identityCard = identityCard;
		this.studentCard = studentCard;
	}

	public Tutor(int userID, String name, String salary, String workAt, String identityCard, String studentCard) {
		super(userID, name);
		this.salary = salary;
		this.workAt = workAt;
		this.identityCard = identityCard;
		this.studentCard = studentCard;
	}

	


	public Tutor(int userID, Qualificate qualificate, AddressUser address, String name, String salary) {
		super(userID, qualificate, address, name);
		this.salary = salary;
	}
	
	
	public Tutor(int userID) {
		super(userID);
	}



	public Tutor(int userID, String name) {
		super(userID, name);
	}

	public Tutor(String name) {
		super(name);
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
