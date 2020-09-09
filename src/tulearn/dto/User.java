package tulearn.dto;

public class User {
	private int userID;
	private int roleID;
	private int statusUserID;
	private Gender gender;
	private Qualificate qualificate;
	private AddressUser address;
	private String email;
	private String phone;
	private String password;
	private String name;
	private String avatar;
	private String street;
	
	public User() {
		super();
	}

	public User(int userID, int roleID, int statusUserID, Gender gender, Qualificate qualificate, AddressUser address,
			String email, String phone, String password, String name, String avatar, String street) {
		super();
		this.userID = userID;
		this.roleID = roleID;
		this.statusUserID = statusUserID;
		this.gender = gender;
		this.qualificate = qualificate;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.name = name;
		this.avatar = avatar;
		this.street = street;
	}

	public User(int userID, Gender gender, Qualificate qualificate, AddressUser address, String email, String phone,
			String name, String street) {
		super();
		this.userID = userID;
		this.gender = gender;
		this.qualificate = qualificate;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.name = name;
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

	public AddressUser getAddress() {
		return address;
	}

	public void setAddress(AddressUser address) {
		this.address = address;
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
	
}
