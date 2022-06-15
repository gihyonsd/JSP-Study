package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JdbcUtil;

public class BoardDao {
	private JdbcUtil ju;
	
	public BoardDao() {
		ju = JdbcUtil.getInstance();
	}
	//삽입(C)
	public int insert(boardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO board VALUES(nextval(board_seq),?,?,?,now(),0)";
		int ret = -1;
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());;
			ret = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}	
		}
		return ret;
	}
	//조회(R)
	public List<boardVo> selectAll() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM board ORDER BY num DESC";
		ArrayList<boardVo> ls = new ArrayList<boardVo>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				boardVo vo = new boardVo(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						new Date(rs.getDate(5).getTime()),
						rs.getInt(6));
				ls.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}	
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}	
		}
		return ls;
	}
	public boardVo selectOne(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM board WHERE num=?";
		boardVo vo = null;
		ArrayList<boardVo> ls = new ArrayList<boardVo>();
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				updateCnt(num); //조회수 증가
				 vo = new boardVo(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						new Date(rs.getDate(5).getTime()),
						rs.getInt(6)+1);
				ls.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}	
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}	
		}
		return vo;
	}
	//수정(U)
	public int update(boardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update board set title=?, content=? where num=?";
		int ret = -1;
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getNum());;
			ret = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}	
		}
		return ret;
	}
	public int updateCnt(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update board set cnt=cnt+1 where num=?";
		int ret = -1;
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			ret = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}	
		}
		return ret;
	}
	
	//삭제(D)
	public int delete(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from board where num=?";
		int ret = -1;
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			ret = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}			
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}	
		}
		return ret;
	}
}
