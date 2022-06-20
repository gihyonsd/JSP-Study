package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect1 {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public JDBConnect1() {
		try {
			//JDBC ����̹� �ε�
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("����̹� �ε� ����1");
			
			//Database ����
			String url = "jdbc:oracle:thin:@119.194.24.20:1521:xe";
			String id = "c##java";
			String pass = "java";
			conn = DriverManager.getConnection(url, id, pass);
			System.out.println("DB ���� ����1");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	//��ü ��ȯ
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
