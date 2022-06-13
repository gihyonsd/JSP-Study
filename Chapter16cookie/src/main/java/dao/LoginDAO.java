package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import static db.JdbcUtil.*;

import vo.Member;

public class LoginDAO {
	private static LoginDAO loginDAO;
	private Connection con;
	
	private LoginDAO() {
		
	}
	public static LoginDAO getInstance() {
		if(loginDAO == null) {
			loginDAO = new LoginDAO();
		}
		return loginDAO;
	}
	public void setConnection(Connection con) {
		this.con = con;
	}
	public Member selectLoginMember(String id, String pass) {
		Member loginMember = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("SELECT * FROM users WHERE id = ? AND pass = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loginMember = new Member();
				loginMember.setAddr(rs.getString("addr"));
				loginMember.setAge(rs.getInt("age"));
				loginMember.setEmail(rs.getString("email"));
				loginMember.setGender(rs.getString("gender"));
				loginMember.setId(rs.getString("id"));
				loginMember.setName(rs.getString("name"));
				loginMember.setNation(rs.getString("nation"));
				loginMember.setPass(rs.getString("pass"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				close(rs);
				close(pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return loginMember;
	}
}
