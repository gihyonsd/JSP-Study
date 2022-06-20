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
			//커넥션 풀(DataSource) 얻기
			// 1. 자바 네이밍(JNDI) 이름과 실제 객체를 연결(Context)
			Context initCtx = new InitialContext();
			// 2. 현재 웹 애플리케이션의 루트 디렉터리를 인수로 하여 Context 객체를 얻는다.
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			// 3. myOracle 자원을 가져온다.
			DataSource source = (DataSource)ctx.lookup("/jdbc/oracleDB");
			// 4. 커넥션 풀을 통해 연결
			conn = source.getConnection();
			
			System.out.println("DB 커넥션 풀 연결 성공");
		} 
		catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}
	//객체 반환
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

