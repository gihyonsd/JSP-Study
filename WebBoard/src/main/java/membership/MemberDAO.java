package membership;

import common.JDBConnect2;

public class MemberDAO extends JDBConnect2 {
	//명시한 데이터베이스 연결이 완료된 MemberDAO 객체를 생성
	public MemberDAO(String driver, String url, String id, String pass) {
		super(driver, url, id, pass);
	}
	
	//명시한 아이디/비밀번호와 일치하는 회원 정보를 반환한다.
	public MemberDTO getMemberDTO(String userId, String userPwd) {
		MemberDTO dto = new MemberDTO(); //회원 정보 DTO 객체 생성
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			//쿼리 실행
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId); //쿼리문 첫 번째 인파라미터
			pstmt.setString(2, userPwd); //쿼리문 두 번째 인파라미터
			rs = pstmt.executeQuery(); //쿼리문 실행
			
			if(rs.next()) {
				//쿼리 결과로 가져온 회원 정보를 DTO 객체에 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch(Exception e) {
			System.out.println("뭔가 문제가 있다.");
			e.printStackTrace();
		}
		return dto;
	}

}
