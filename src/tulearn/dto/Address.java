package tulearn.dto;

public class Address {
	private int addressID;
	private int addressKey;
	private String addressName;
	
	public Address() {
		super();
	}

	public Address(int addressID, String addressName) {
		super();
		this.addressID = addressID;
		this.addressName = addressName;
	}

	public Address(int addressID, int addressKey, String addressName) {
		super();
		this.addressID = addressID;
		this.addressKey = addressKey;
		this.addressName = addressName;
	}

	public int getAddressID() {
		return addressID;
	}

	public void setAddressID(int addressID) {
		this.addressID = addressID;
	}

	public int getAddressKey() {
		return addressKey;
	}

	public void setAddressKey(int addressKey) {
		this.addressKey = addressKey;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
		
}
