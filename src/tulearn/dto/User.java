package tulearn.dto;

public class User {
	private int userID;
	private int roleID;
	private int statusUserID;
	private int genderID;
	private int qualificationID;
	private int communeID;
	private String email;
	private String phone;
	private String password;
	private String name;
	private String avatar;
	private String street;
	
	public User() {
		super();
	}

	
	public User(int userID) {
		super();
		this.userID = userID;
	}


	public User(int userID, int roleID, int statusUserID, int genderID, int qualificationID, int communeID,
			String email, String phone, String password, String name, String avatar, String street) {
		super();
		this.userID = userID;
		this.roleID = roleID;
		this.statusUserID = statusUserID;
		this.genderID = genderID;
		this.qualificationID = qualificationID;
		this.communeID = communeID;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.name = name;
		this.avatar = avatar;
		this.street = street;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public int getStatusUserID() {
		return statusUserID;
	}

	public void setStatusUserID(int statusUserID) {
		this.statusUserID = statusUserID;
	}

	public int getGenderID() {
		return genderID;
	}

	public void setGenderID(int genderID) {
		this.genderID = genderID;
	}

	public int getQualificationID() {
		return qualificationID;
	}

	public void setQualificationID(int qualificationID) {
		this.qualificationID = qualificationID;
	}

	public int getCommuneID() {
		return communeID;
	}

	public void setCommuneID(int communeID) {
		this.communeID = communeID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}


	public User(String password, String name) {
		super();
		this.password = password;
		this.name = name;
	}
	
	
	
}
