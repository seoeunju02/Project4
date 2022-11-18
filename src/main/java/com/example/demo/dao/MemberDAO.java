package com.example.demo.dao;

import com.example.demo.bean.MemberVO;
import com.example.demo.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String M_INSERT = "insert into MEMBER (userid,username,major,email,phoneNumber,photo,detail) values (?,?,?,?,?,?,?)";
	private final String M_UPDATE = "update MEMBER set userid=?, username=?, major=?, email=?,phoneNumber=?,photo=?,detail=? where sid=?";
	private final String M_DELETE = "delete from MEMBER  where sid=?";
	private final String M_GET = "select * from MEMBER  where sid=?";
	private final String M_LIST = "select * from MEMBER order by sid desc";

	public int insertMember(MemberVO vo) {
//		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(M_INSERT);
			stmt.setString(1, vo.getUserid());
			stmt.setString(2, vo.getUsername());
			stmt.setString(3, vo.getMajor());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getPhoneNumber());
			stmt.setString(6, vo.getPhoto());
			stmt.setString(7, vo.getDetail());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteMember(MemberVO vo) {
//		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_DELETE);
			stmt.setInt(1, vo.getSid());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateMember(MemberVO vo) {
//		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_UPDATE);
			stmt.setString(1, vo.getUserid());
			stmt.setString(2, vo.getUsername());
			stmt.setString(3, vo.getMajor());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getPhoneNumber());
			stmt.setString(6, vo.getPhoto());
			stmt.setString(7, vo.getDetail());
			stmt.setInt(8, vo.getSid());

			System.out.println(vo.getUserid() + "-" + vo.getUsername() + "-" + vo.getMajor() + "-" + vo.getSid());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public MemberVO getOne(int sid) {
		MemberVO one = new MemberVO();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if (rs.next()) {
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setMajor(rs.getString("major"));
				one.setEmail(rs.getString("email"));
				one.setPhoneNumber(rs.getString("phoneNumber"));
				one.setPhoto(rs.getString("photo"));
				one.setDetail(rs.getString("detail"));
//				one.setRegdate(rs.getDate("regdate"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<MemberVO> getList(){
		List<MemberVO> list = new ArrayList<MemberVO>();
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemberVO one = new MemberVO();
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setMajor(rs.getString("major"));
				one.setEmail(rs.getString("email"));
				one.setPhoneNumber(rs.getString("phoneNumber"));
				one.setPhoto(rs.getString("photo"));
				one.setDetail(rs.getString("detail"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	public String getPhotoFilename(int sid) {
		String filename=null;
		try{
			conn=JDBCUtil.getConnection();
			stmt=conn.prepareStatement(M_GET);
			stmt.setInt(1,sid);
			rs=stmt.executeQuery();
			if(rs.next()){
				filename=rs.getString("photo");
			}
			rs.close();
		}catch (Exception e){
			e.printStackTrace();
		}
//		System.out.println("==> JDBC로 getPhotoFilename() 기능처리");
		return filename;
	}
}
