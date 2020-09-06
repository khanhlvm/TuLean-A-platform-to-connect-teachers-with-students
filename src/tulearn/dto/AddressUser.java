package tulearn.dto;

public class AddressUser {
	private int communeID;
	private String provinceName;
	private String districtName;
	private String communeName;
	
	public AddressUser() {
		super();
	}

	public AddressUser(int communeID, String provinceName, String districtName, String communeName) {
		super();
		this.communeID = communeID;
		this.provinceName = provinceName;
		this.districtName = districtName;
		this.communeName = communeName;
	}

	public int getCommuneID() {
		return communeID;
	}

	public void setCommuneID(int communeID) {
		this.communeID = communeID;
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

	@Override
	public String toString() {
		return "AddressUser [communeID=" + communeID + ", provinceName=" + provinceName + ", districtName="
				+ districtName + ", communeName=" + communeName + "]";
	}
	
		
}
