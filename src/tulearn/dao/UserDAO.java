package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

import tulearn.context.DBContext;
import tulearn.dto.AddressUser;
import tulearn.dto.Gender;
import tulearn.dto.Qualificate;
import tulearn.dto.Schedule;
import tulearn.dto.Subject;
import tulearn.dto.Tutor;

public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	private void closeConnection() throws SQLException {
		if (rs != null) {
			rs.close();
		}

		if (ps != null) {
			ps.close();
		}

		if (conn != null) {
			conn.close();
		}
	}
	
	public Gender getGenderByID(int id) throws SQLException{
		Gender gender = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT UserTB.genderID, Gender.genderType FROM UserTB INNER JOIN Gender\r\n"
						+ " ON UserTB.genderID = Gender.genderID WHERE UserTB.userID = ? ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					int genderID = rs.getInt(1);
					String genderName = rs.getString(2);
					gender = new Gender(genderID, genderName);
				}
			}
		}finally{
			closeConnection();
		}
		return gender;
	}
	
	public Qualificate getQualificateByID(int id) throws SQLException{
		Qualificate qualificate = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql1 = "SELECT UserTB.qualificationID, Qualification.qualificationName FROM UserTB INNER JOIN Qualification\r\n"
						+ "ON UserTB.qualificationID = Qualification.qualificationID\r\n"
						+ "WHERE UserTB.userID = ?";
				ps = conn.prepareStatement(sql1);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					int qID = rs.getInt(1);
					String qName = rs.getString(2);
					qualificate = new Qualificate(qID, qName);
				}
			}
		}finally{
			closeConnection();
		}
		return qualificate;
	}
	
	public AddressUser getAddressUserByID(int id) throws SQLException{
		AddressUser address = null;
		try {
			conn = DBContext.getConnection();			
			if (conn != null) {
				String sql = "SELECT ProvinceOrCity.provinceID,District.districtID,UserTB.communeID,ProvinceOrCity.provinceName,District.districtName,CommuneOrWard.communeName \r\n"
						+"FROM ProvinceOrCity INNER JOIN District ON ProvinceOrCity.provinceID = District.provinceID\r\n" 
						+"JOIN CommuneOrWard ON CommuneOrWard.districtID = District.districtID\r\n" 
						+"JOIN UserTB ON CommuneOrWard.communeID = UserTB.communeID\r\n" 
						+"WHERE UserTB.userID = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					int provinceID = rs.getInt(1);
					int districtID = rs.getInt(2);
					int communeID = rs.getInt(3);
					String provinceName = rs.getNString(4);
					String districtName = rs.getNString(5);
					String communeName = rs.getNString(6);
					address = new AddressUser(provinceID,districtID,communeID,provinceName,districtName,communeName);
				}
			}
		}finally{
			closeConnection();
		}
		return address;
	}
	
	public Tutor getUserTutorByID(int id) throws SQLException {
		Tutor t = new Tutor();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT userID,roleID,statusID,email,userPass,streetName,userName,avatar,phone FROM UserTB WHERE userID = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					int userID = rs.getInt(1);
					int roleID = rs.getInt(2);
					int statusUserID = rs.getInt(3);										
					String email = rs.getString(4);
					String password = rs.getString(5);
					String street = rs.getNString(6);
					String name = rs.getNString(7);
					String avatar = rs.getNString(8);
					String phone = rs.getString(9);
					Gender gender = getGenderByID(userID);
					Qualificate qualificate = getQualificateByID(userID);
					AddressUser addressUser = getAddressUserByID(userID);
					// learner
					t = new Tutor(userID, roleID, statusUserID, gender, qualificate, addressUser, email, phone,
							password, name, avatar, street);
					if (roleID == 2) {
						conn = DBContext.getConnection();
						String query = "SELECT salary,workAt,identityCard,studentCard FROM UserTB WHERE userID = ?";
						ps = conn.prepareStatement(query);
						ps.setInt(1, id);
						rs = ps.executeQuery();
						if (rs.next()) {
							String salary = rs.getString(1);
							String workAt = rs.getNString(2);
							String identityCard = rs.getString(3);
							String studentCard = rs.getString(4);
							// tutor
							t = new Tutor(userID, roleID, statusUserID, gender, qualificate, addressUser, email, phone,
									password, name, avatar, street, salary, workAt, identityCard, studentCard);
						}
					}// end get tutor
				}//end get userOrtutor
			}
		}finally{
			closeConnection();
		}
		return t;
	}

	public boolean updateUserOrTutor(Tutor t) throws SQLException {
		boolean result = false;	
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE UserTB SET userName=?, email=?, phone=?, genderID=?, qualificationID=?, communeID=?, streetName=?  WHERE userID = ?";
				ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				ps.setNString(1, t.getName());
				ps.setNString(2, t.getEmail());
				ps.setString(3, t.getPhone());
				ps.setInt(4, t.getGender().getgID());
				ps.setInt(5, t.getQualificate().getqID());
				ps.setInt(6, t.getAddress().getCommuneID());
				ps.setNString(7, t.getStreet());
				ps.setInt(8, t.getUserID());
				result = ps.executeUpdate() > 0;
				if(t.getRoleID()==2 && result) {
					String query = "UPDATE UserTB SET salary=?, workAt=?, identityCard=?, studentCard=?  WHERE userID = ?";
					ps = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, t.getSalary());
					ps.setString(2, t.getWorkAt());
					ps.setString(3, t.getIdentityCard());
					ps.setString(4, t.getStudentCard());
					ps.setInt(5, t.getUserID());
					result = ps.executeUpdate() > 0;
				}
			}
		}finally {
			closeConnection();
		}
		return result;
	}

	public boolean updatePassword(int userID, String newPass) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE UserTB SET userPass=? WHERE userID=?";
				ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, newPass);
				ps.setInt(2, userID);
				result = ps.executeUpdate() > 0;
			}
		} finally {
			closeConnection();
		}
		return result;
	}
	
	// get all of tutor and schedules
	public HashMap<Tutor, ArrayList<Schedule>> getAllTutor() throws SQLException {
		HashMap<Tutor, ArrayList<Schedule>> allPost = new HashMap<Tutor, ArrayList<Schedule>>();
		UserDAO udao = new UserDAO();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT userID FROM UserTB WHERE NOT statusID=3 AND roleID=2";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					int id = rs.getInt(1);
					allPost.put(udao.getUserTutorByID(id), udao.getScheduleForTutor(id));
				}
			}
		} finally {
			closeConnection();
		}
		return allPost;
	}
	
	// get tutor schedule
	public ArrayList<Schedule> getScheduleForTutor(int tutorID) throws SQLException {
		ArrayList<Schedule> scheList = new ArrayList<>();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "select dayWeek,startTime,endTime from ScheduleTutor where tutorID = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, tutorID);
				rs = ps.executeQuery();
				while (rs.next()) {
					String dayWeek = rs.getString("dayWeek");
					Time sTime = rs.getTime("startTime");
					String startTime = sTime.toString().substring(0, 5);
					Time eTime = rs.getTime("endTime");
					String endTime = eTime.toString().substring(0, 5);
					Schedule s = new Schedule(tutorID, dayWeek, startTime, endTime);
					scheList.add(s);
				}
			}
		} finally {
			closeConnection();
		}
		return scheList;
	}		
	
	public boolean addTutorSchedule(ArrayList<Schedule> ts) throws SQLException, ParseException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "Insert into ScheduleTutor(tutorID,dayWeek,startTime,endTime) values (?,?,?,?)";
				ps = conn.prepareStatement(sql);
				for (Schedule sche : ts) {
					ps.setInt(1, sche.getEntityID());
					int daytime = Integer.parseInt(sche.getDayTime());
					ps.setInt(2, daytime);
					Time sTime = Time.valueOf(sche.getStartTime().concat(":00"));
					Time eTime = Time.valueOf(sche.getEndTime().concat(":00"));
					ps.setTime(3, sTime);
					ps.setTime(4, eTime);
				}
				result = true;
			}
		}finally {
			closeConnection();
		}
		return result;
	}
	
	public ArrayList<Subject> getSubjectByTutorID(int id) throws SQLException {
		ArrayList<Subject> s = new ArrayList<Subject>();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT SubjectTB.subjectID, SubjectTB.subjectName from SubjectTutor\r\n"
						+ "INNER JOIN SubjectTB ON SubjectTutor.subjectID = SubjectTB.subjectID\r\n"
						+ "WHERE SubjectTutor.tutorID =?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				while (rs.next()) {
					int sID = rs.getInt(1);
					String sName = rs.getString(2);
					s.add(new Subject(sID, sName));
				}
			}
		}finally{
			closeConnection();
		}
		return s;
	}

}

