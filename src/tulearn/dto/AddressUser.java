package tulearn.dto;

public class AddressUser {
	private int provinceID;
	private int districtID;
	private int communeID;
	private String provinceName;
	private String districtName;
	private String communeName;
	
	public AddressUser() {
		super();
	}

	public AddressUser(int provinceID, int districtID, int communeID, String provinceName, String districtName,
			String communeName) {
		super();
		this.provinceID = provinceID;
		this.districtID = districtID;
		this.communeID = communeID;
		this.provinceName = provinceName;
		this.districtName = districtName;
		this.communeName = communeName;
	}

public AddressUser(String provinceName) {
		super();
		this.provinceName = provinceName;
	}
	

	public AddressUser(String provinceName, String districtName, String communeName) {
		super();
		this.provinceName = provinceName;
		this.districtName = districtName;
		this.communeName = communeName;
	}

	public int getProvinceID() {
		return provinceID;
	}

	public void setProvinceID(int provinceID) {
		this.provinceID = provinceID;
	}

	public int getDistrictID() {
		return districtID;
	}

	public void setDistrictID(int districtID) {
		this.districtID = districtID;
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
		
}
