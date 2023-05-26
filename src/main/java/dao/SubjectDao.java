package dao;


import java.sql.*;
import java.util.*;

import util.*;
import vo.*;


public class SubjectDao {
	// 1) 과목목록
	public ArrayList<Subject> selectSubjectListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<Subject> list = new ArrayList<>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement listStmt = conn.prepareStatement("SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime, updatedate, createdate FROM subject ORDER BY subject_no Limit ?,?");
		listStmt.setInt(1 ,beginRow);
		listStmt.setInt(2 ,rowPerPage);
		ResultSet listRs = listStmt.executeQuery();
		while(listRs.next()) {
			Subject s = new Subject();
			s.setSubjectNo(listRs.getInt("subjectNo"));
			s.setSubjectName(listRs.getString("subjectName"));
			s.setSubjectTime(listRs.getInt("subjectTime"));
			s.setUpdatedate(listRs.getString("updatedate"));
			s.setCreatedate(listRs.getString("createdate"));
			list.add(s);
		}
		return list;
	}
	// 2) 과목추가
	public int insertSubject(Subject subject) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement Stmt = conn.prepareStatement("INSERT INTO subject(subject_name, subject_time, updatedate, createdate) VALUES(?,?,NOW(),NOW()");
		Stmt.setString(1, subject.getSubjectName());
		Stmt.setInt(2, subject.getSubjectTime());
		row = Stmt.executeUpdate();
		
		return row;
	}
	
	// 3) 과목삭제
	public int deleteSubject(int subjectNo) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement Stmt = conn.prepareStatement("DELETE FROM subject WHERE subject_no = ?");
		Stmt.setInt(1, subjectNo);
		row = Stmt.executeUpdate();
		
		return row;
	}
	// 4) 과목수정
	public int updateSubject(Subject subject) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement Stmt = conn.prepareStatement("UPDATE subject SET subject_name=?, subject_time = ?, updatedate = NOW() WHERE subject_no = ?");
		Stmt.setString(1, subject.getSubjectName());
		Stmt.setInt(2, subject.getSubjectTime());
		Stmt.setInt(3, subject.getSubjectNo());
		
		return row; 
	}
	
	// 5) 과목 하나 상세
	public Subject selectSubjectOne(int subjectNo) throws Exception {
		Subject subject = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement Stmt = conn.prepareStatement("SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime, updatedate, createdate FROM subject WHERE subject_no = ?");
		Stmt.setInt(1, subjectNo);
		ResultSet Rs = Stmt.executeQuery();
		if(Rs.next()) {
			subject = new Subject();
			subject.setSubjectNo(Rs.getInt("subjectNo"));
			subject.setSubjectName(Rs.getString("subjectName"));
			subject.setSubjectTime(Rs.getInt("subjectTime"));
			subject.setUpdatedate(Rs.getString("updatedate"));
			subject.setCreatedate(Rs.getString("createdate"));
		}
		
		return subject;
	}
	// 6) 과목전체row
	public int selectSubjectCnt() throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement Stmt = conn.prepareStatement("SELECT COUNT(*) FROM subject");
		ResultSet Rs = Stmt.executeQuery();
		if(Rs.next()) {
			row = Rs.getInt(1);
		}
		return row;
	}
}
