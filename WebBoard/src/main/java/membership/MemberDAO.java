package membership;

import common.JDBConnect2;

public class MemberDAO extends JDBConnect2 {
	//����� �����ͺ��̽� ������ �Ϸ�� MemberDAO ��ü�� ����
	public MemberDAO(String driver, String url, String id, String pass) {
		super(driver, url, id, pass);
	}
	
	//����� ���̵�/��й�ȣ�� ��ġ�ϴ� ȸ�� ������ ��ȯ�Ѵ�.
	public MemberDTO getMemberDTO(String userId, String userPwd) {
		MemberDTO dto = new MemberDTO(); //ȸ�� ���� DTO ��ü ����
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			//���� ����
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId); //������ ù ��° ���Ķ����
			pstmt.setString(2, userPwd); //������ �� ��° ���Ķ����
			rs = pstmt.executeQuery(); //������ ����
			
			if(rs.next()) {
				//���� ����� ������ ȸ�� ������ DTO ��ü�� ����
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch(Exception e) {
			System.out.println("���� ������ �ִ�.");
			e.printStackTrace();
		}
		return dto;
	}

}
