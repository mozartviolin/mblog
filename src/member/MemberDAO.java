package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sun.org.apache.xerces.internal.impl.dv.dtd.DTDDVFactoryImpl;

import db.DBClose;
import db.DBOpen;

public class MemberDAO {

	public String getIdFind(Map map) {
		String id = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String mname = (String)map.get("mname");
		String email = (String)map.get("email");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select id from member ");
		sql.append(" where mname=? and email=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, email);		
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt,con);
		}	
		
		return id;
	}


	public String getPwFind(Map map) {
		String pw = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String mname = (String)map.get("mname");
		String id = (String)map.get("id");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select passwd from member ");
		sql.append(" where mname=? and id=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, id);		
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString("passwd");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt,con);
		}	
		
		return pw;

	}
	
	
	public String getGrade(String id) {
		String grade = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select grade from member ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				grade = rs.getString("grade");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
				
		return grade;		
	}
	
	
	public boolean loginCheck(Map map) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = (String)map.get("id");
		String pw= (String)map.get("pw");		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) from member ");
		sql.append(" where id = ? ");
		sql.append(" and passwd = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt > 0)
					flag = true;
			} 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con); 
		}
		
		return flag;		
	}
	
	
	public String getFname(String id) {
		String fname = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select fname from member ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
						
			if(rs.next()) {
				fname = rs.getString("fname");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}		
		return fname;		
	}	
	
	
	public boolean checPwup(Map map) {
		boolean dflag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		
		String id = (String)map.get("id");
		String oldpasswd= (String)map.get("oldpasswd");		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(passwd) as cnt 	" );
		sql.append(" from member          	" );
		sql.append(" where passwd = ?      		" );
		sql.append(" and id= ?		" );
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, oldpasswd);
			pstmt.setString(2, id);

			rs = pstmt.executeQuery();
			rs.next();
			
			int cnt = rs.getInt(1);
						
			if(cnt>0)
				{dflag=true;}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dflag;
	}
	
	
	public boolean updatePw(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		String passwd = (String)map.get("passwd");
		String id = (String)map.get("id");
		
		sql.append(" update member ");
		sql.append(" set passwd = ? ");
		sql.append(" where id = ? ");
		 
		try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, passwd);
		pstmt.setString(2, id);
		 
		int cnt = pstmt.executeUpdate();
		if(cnt>0)flag = true;
		 
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		} finally{
		DBClose.close(pstmt, con);
		}
		 
		return flag;
		}
	
	
	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		String fname = (String) map.get("fname");
		String id = (String) map.get("id");

		StringBuffer sql = new StringBuffer();
		sql.append(" update member ");
		sql.append(" set fname = ? ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public boolean duplicateEmail(String email) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(email) as cnt ");
		sql.append(" from member ");
		sql.append(" where email=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt("cnt");
				if (cnt > 0)
					flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;

	}

	public boolean duplicateId(String id) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) as cnt ");
		sql.append(" from member ");
		sql.append(" where id=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt("cnt");
				if (cnt > 0)
					flag = true; // 중복된 아이디
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;
	}

	public int total(Map map) {
		int total = 0;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");

		StringBuffer sql = new StringBuffer();

		sql.append(" select count(*) from member ");
		if (word.trim().length() > 0)
			sql.append(" 	where " + col + " like '%'||?||'%' ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(1, word);

			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return total;
	}

	public List<MemberDTO> list(Map map) {

		List<MemberDTO> list = new ArrayList<MemberDTO>();
		MemberDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append(" select id,mname,tel,email,zipcode,address1,address2, ");
		sql.append(" fname,r ");
		sql.append(" 	from( ");
		sql.append(" 	select id,mname,tel,email,zipcode,address1,address2,fname, ");
		sql.append(" 	rownum as r ");
		sql.append(" 		from(  ");
		sql.append(" 		select id,mname,tel,email,zipcode,address1, ");
		sql.append(" 		address2,fname ");
		sql.append(" 		from member ");
		if (word.trim().length() > 0)
			sql.append(" 		where " + col + " like '%'||?||'%' ");
		sql.append(" 		order by mdate desc ");
		sql.append(" ) ");
		sql.append(" ) where r>=? and r<=? ");

		int i = 0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);

			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setFname(rs.getString("fname"));

				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;

	}

	public MemberDTO read(String id) {
		MemberDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select id,passwd,mname,tel,email,zipcode,address1,address2, ");
		sql.append(" 	job,mdate,fname,grade ");
		sql.append(" from member ");
		sql.append(" where id= ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJob(rs.getString("job"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
				dto.setGrade(rs.getString("grade"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}

	public boolean update(MemberDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" update member  ");
		sql.append(" set ");
		sql.append(" 	tel=?, ");
		sql.append(" 	email=?, ");
		sql.append(" 	zipcode=?, ");
		sql.append(" 	address1=?, ");
		sql.append(" 	address2=?, ");
		sql.append(" 	job=? ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTel());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getJob());
			pstmt.setString(7, dto.getId());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public boolean delete(String id) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from member where id=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;

	}

	public boolean create(MemberDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" insert into member(id, passwd, mname, tel, email, zipcode, ");
		sql.append(" address1, address2, job, mdate, fname, grade) ");
		sql.append(" values(?, ?, ?, ?, ?,?, ");
		sql.append(" ?,?,?,sysdate, ?, default ) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			pstmt.setString(10, dto.getFname());
			
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;

	}

}
