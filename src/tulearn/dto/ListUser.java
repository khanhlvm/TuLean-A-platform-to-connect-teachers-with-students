package tulearn.dto;

public class ListUser {
	private int userID;
	private String name;
	private String phone;
	private String email;
	private String salary;
	private String workAt;
	private String identityCard;
	private String studentCard;
	private String provinceName;
	private String districtName;
	private String communeName;
	private int communeID;
	private String streetName;
	

	public ListUser() {
		super();
	}
	

	public int getCommuneID() {
		return communeID;
	}


	public void setCommuneID(int communeID) {
		this.communeID = communeID;
	}


	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public String getCommuneName() {
		return communeName;
	}

	public void setCommuneName(String communeName) {
		this.communeName = communeName;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public ListUser(String name, String phone, String email, String salary, String workAt, String identityCard,
			String studentCard, String provinceName, String districtName, String communeName, String streetName) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.salary = salary;
		this.workAt = workAt;
		this.identityCard = identityCard;
		this.studentCard = studentCard;
		this.provinceName = provinceName;
		this.districtName = districtName;
		this.communeName = communeName;
		this.streetName = streetName;
	}
	

	


	public ListUser(String name, String phone, String email, String salary, String workAt, String identityCard,
			String studentCard, int communeID, String streetName) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.salary = salary;
		this.workAt = workAt;
		this.identityCard = identityCard;
		this.studentCard = studentCard;
		this.communeID = communeID;
		this.streetName = streetName;
	}


	@Override
	public String toString() {
		return "ListUser " + name + ", phone=" + phone + ", email=" + email + ", salary=" + salary + ", workAt="
				+ workAt + ", identityCard=" + identityCard + ", studentCard=" + studentCard + ", provinceName="
				+ provinceName + ", districtName=" + districtName + ", communeName=" + communeName + ", streetName="
				+ streetName + "]";
	}
	
	
}
