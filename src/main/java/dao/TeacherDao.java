package dao;

import java.util.*;

import util.*;
import vo.*;

import java.sql.*;


/*
 "SELECT teacher_no teacherNo, teacher_id teacherId, teacher_name teacherName, 
 teacher_history teacherHistory, updatedate, createdate 
 FROM teacher WHERE teacher_no = ?"
 */
public class TeacherDao {
	// 강사 1명 상세보기
	public Teacher selectTeacherOne(int teacherNo) throws Exception {
		Teacher teacher = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("SELECT teacher_no teacherNo, teacher_id teacherId, teacher_name teacherName, teacher_history teacherHistory, updatedate, createdate FROM teacher WHERE teacher_no = ?");
		stmt.setInt(1, teacherNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			teacher = new Teacher();
			teacher.setTeacherNo(rs.getInt("teacherNo"));
			teacher.setTeacherId(rs.getString("teacherId"));
			teacher.setTeacherName(rs.getString("teacherName"));
			teacher.setTeacherHistory(rs.getString("teacherHistory"));
			teacher.setUpdatedate(rs.getString("updatedate"));
			teacher.setCreatedate(rs.getString("createdate"));
		}
		return teacher;
	}
	
	// 수정액션
	public int updateTeacher(Teacher teacher) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("UPDATE teacher SET teacher_id = ?, teacher_name = ?, teacher_history = ?, updatedate = NOW() WHERE teacher_no = ?");
		stmt.setString(1, teacher.getTeacherId());
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		stmt.setString(4, teacher.getUpdatedate());
		stmt.setInt(5, teacher.getTeacherNo());
		row = stmt.executeUpdate();
		return 0;
	}
	
	// 삭제
	public int deleteTeacher(int teacherNo) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("DELETE FROM teacher WHERE teacher_no = ?");
		stmt.setInt(1, teacherNo);
		row = stmt.executeUpdate();
		return row;
	}
	
	
	/*
	 // 과목이 연결되지 않은 강사는 출력되지 않는다 inner join -> outer join
	 // selectTeacherListBYPage(int beginRow, int rowPerPage)
	 // teacherList.jsp + 화면캡처 + 샘플데이터 추가
	  
	 SELECT t.teacher_no, t.teacher_id, t.teacher_name, ts.subject_no, GROUP_CONCAT(s.subject_name)
	FROM teacher t INNER JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no
	INNER JOIN subject s ON ts.subject_no = s.subject_no
	GROUP BY t.teacher_no, t.teacher_id, t.teacher_name
	LIMIT 0, 10;
	 */
	/*
	 SELECT t.teacher_no, t.teacher_id, t.teacher_name, ts.subject_no, GROUP_CONCAT(s.subject_name)
	FROM teacher t LEFT OUTER JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no
	INNER JOIN subject s ON ts.subject_no = s.subject_no
	GROUP BY t.teacher_no, t.teacher_id, t.teacher_name
	LIMIT 0, 10;
	 */
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("SELECT t.teacher_no teacherNo, t.teacher_id teacherId, t.teacher_name teacherName, ts.subject_no, NVL (GROUP_CONCAT(s.subject_name) , '없음') teacherSubjectName\r\n"
				+ "	FROM teacher t LEFT OUTER JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no\r\n"
				+ "	LEFT OUTER JOIN subject s ON ts.subject_no = s.subject_no\r\n"
				+ "	GROUP BY t.teacher_no, t.teacher_id, t.teacher_name\r\n"
				+ "	LIMIT ?, ?");
		stmt.setInt(1 , beginRow);
		stmt.setInt(2 , rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("teacherNo",rs.getInt("teacherNo"));
			m.put("teacherId",rs.getString("teacherId"));
			m.put("teacherName", rs.getString("teacherName"));
			m.put("teacherSubjectName", rs.getString("teacherSubjectName"));
			list.add(m);
		}
			
		return list;
	}
	
	public int selectTeacherCnt() throws Exception {
		int row = 0;
		
		DBUtil dbUtil = new DBUtil();
		
		Connection conn = dbUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM teacher");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			row = rs.getInt(1);
		}
		
		return row;
	}
 }
