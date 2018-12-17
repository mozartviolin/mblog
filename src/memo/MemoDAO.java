package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class MemoDAO {

	public boolean passCheck(Map map) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int memono = (Integer) map.get("memono");
		String passwd = (String) map.get("passwd");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(memono) as cnt ");
		sql.append(" from memo ");
		sql.append(" where memono=?  ");
		sql.append(" and passwd=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			
			if(cnt>0)flag=true; // 올바른 패스워드
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);			
		}	
		
		return flag;
	
	}
	
	
	public boolean checkRefnum(int memono) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refnum) ");
		sql.append(" from memo ");
		sql.append(" where refnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			int cnt = rs.getInt(1);
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return flag;
		
	}
	
	public boolean replyCreate(MemoDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into memo(memono,wname,content,wdate,grpno,indent,ansnum,refnum,passwd )	 ");
		sql.append(" values(memo_seq.nextval,?,?,sysdate,?,?,?,?,? ) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getGrpno());
			pstmt.setInt(4, dto.getIndent()+1);
			pstmt.setInt(5, dto.getAnsnum()+1);
			pstmt.setInt(6, dto.getMemono());
			pstmt.setString(7, dto.getPasswd());
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
				
		return flag;
		
	}
	
	
	
	public void upAnsnum(Map map) {
				
		Connection con = DBOpen.open();
		PreparedStatement pstmt =null;
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update memo ");
		sql.append(" set ansnum = ansnum + 1 ");
		sql.append(" where grpno = ? ");
		sql.append(" and ansnum > ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
	}
		
	
	
	
	public MemoDTO replyRead(int memono) {
		MemoDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select memono, grpno,indent,ansnum,wname ");
		sql.append(" from memo where memono=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setWname(rs.getString("wname"));
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
		
	}
	
	public int total(Map map) {
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from memo ");
		if(word.trim().length()>0) {
			sql.append(" where "+ col +" like '%'||?||'%' ");
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
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
	
	public List<MemoDTO> list(Map map){
		List<MemoDTO> list = new ArrayList<MemoDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select memono,wname,content,wdate,viewcnt,grpno,indent,ansnum, r ");
		sql.append(" from( ");
		sql.append(" 	select memono,wname,content,wdate,viewcnt,grpno,indent,ansnum, rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select memono,wname,content,                   ");
		sql.append(" 		wdate, viewcnt, ");
		sql.append(" 		grpno,indent,ansnum from memo    ");
		if(word.trim().length()>0)
			sql.append(" where " + col + " like  '%'||?||'%'   ");
		sql.append(" order by grpno desc, ansnum  ");
		sql.append(" 	) ");
		sql.append(" )where r>=? and r<=? ");

		
		int i=0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);				
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setWname(rs.getString("wname"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				
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
	
	public boolean delete(int memono){
		boolean flag = false;		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from memo ");
		sql.append(" where memono = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) flag= true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}	
		
	public boolean update(MemoDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update memo ");
		sql.append(" set wname = ?,");
		sql.append("     content = ? ");
		sql.append(" where memono = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getMemono());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
		
	}
		
	public MemoDTO read(int memono) {
		MemoDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();		
		sql.append(" select memono, wname, content, ");
		sql.append(" wdate, viewcnt ");
		sql.append(" from memo ");
		sql.append(" where memono=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("wname"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
			
		
		return dto;
	}	
		
	public boolean create(MemoDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into memo(memono,content,wdate,grpno,wname,passwd ) ");
		sql.append(" values((select nvl(max(memono),0)+1 as memono from memo),?,sysdate, ");
		sql.append(" (select nvl(max(grpno),0) + 1 from memo ),?,? ) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getWname());
			pstmt.setString(3, dto.getPasswd());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}		
		
		return flag;
	}

	public void updateViewcnt(int memono) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update memo ");
		sql.append(" set viewcnt = viewcnt + 1 ");
		sql.append(" where memono = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}		
		
	}
}
