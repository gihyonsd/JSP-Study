package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect2 {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	//�⺻ ������
	public JDBConnect2(String driver, String url, String id, String pass) {
		try {
			//JDBC ����̹� �ε�
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("����̹� �ε� ����2");
			
			//Database ����
			conn = DriverManager.getConnection(url, id, pass);
			System.out.println("DB ���� ���� 2");
		}
		catch (Exception e) {
			// TODO: handle exception
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
