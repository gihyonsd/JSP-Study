package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public DBConnPool() {
		try {
			//Ŀ�ؼ� Ǯ(DataSource) ���
			// 1. �ڹ� ���̹�(JNDI) �̸��� ���� ��ü�� ����(Context)
			Context initCtx = new InitialContext();
			// 2. ���� �� ���ø����̼��� ��Ʈ ���͸��� �μ��� �Ͽ� Context ��ü�� ��´�.
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			// 3. myOracle �ڿ��� �����´�.
			DataSource source = (DataSource)ctx.lookup("/jdbc/oracleDB");
			// 4. Ŀ�ؼ� Ǯ�� ���� ����
			conn = source.getConnection();
			
			System.out.println("DB Ŀ�ؼ� Ǯ ���� ����");
		} 
		catch (Exception e) {
			System.out.println("DB Ŀ�ؼ� Ǯ ���� ����");
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

