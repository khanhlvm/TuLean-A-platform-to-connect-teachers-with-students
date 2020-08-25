package tulearn.dto;

public class Schedule {
	private byte entityID;
	private String dayTime;
	private String startTime;
	private String endTime;
	
	public Schedule() {
		super();
	}

	public Schedule(byte entityID, String dayTime, String startTime, String endTime) {
		super();
		this.entityID = entityID;
		this.dayTime = dayTime;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public byte getEntityID() {
		return entityID;
	}

	public void setEntityID(byte entityID) {
		this.entityID = entityID;
	}

	public String getDayTime() {
		return dayTime;
	}

	public void setDayTime(String dayTime) {
		this.dayTime = dayTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}
