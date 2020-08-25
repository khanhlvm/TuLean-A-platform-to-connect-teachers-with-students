package tulearn.dto;

public abstract class User {
	private String email;
	private String phone;
	private String password;
	private String name;
	private String avatar;
	private String street;
	private byte roleID;
	private byte statusUserID;
	private byte genderID;
	private byte qualificationID;
	private byte communeID;
	
	public User() {
		super();
	}

	public User(String email, String phone, String password, String name, String avatar, String street, byte roleID,
			byte statusUserID, byte genderID, byte qualificationID, byte communeID) {
		super();
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.name = name;
		this.avatar = avatar;
		this.street = street;
		this.roleID = roleID;
		this.statusUserID = statusUserID;
		this.genderID = genderID;
		this.qualificationID = qualificationID;
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

	public byte getRoleID() {
		return roleID;
	}

	public void setRoleID(byte roleID) {
		this.roleID = roleID;
	}

	public byte getStatusUserID() {
		return statusUserID;
	}

	public void setStatusUserID(byte statusUserID) {
		this.statusUserID = statusUserID;
	}

	public byte getGenderID() {
		return genderID;
	}

	public void setGenderID(byte genderID) {
		this.genderID = genderID;
	}

	public byte getQualificationID() {
		return qualificationID;
	}

	public void setQualificationID(byte qualificationID) {
		this.qualificationID = qualificationID;
	}

	public byte getCommuneID() {
		return communeID;
	}

	public void setCommuneID(byte communeID) {
		this.communeID = communeID;
	}
	
	
}
