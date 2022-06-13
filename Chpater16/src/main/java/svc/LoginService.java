package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.LoginDAO;
import vo.Member;

public class LoginService {
	public Member getLoginMember(String id, String pass) {
		LoginDAO loginDAO = LoginDAO.getInstance();
		Connection con = getConnection();
		loginDAO.setConnection(con);
		Member loginMember = loginDAO.selectLoginMember(id, pass);
		close(con);
		return loginMember;
	}
}
