package img;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class imgDAO {
	
	public imgDTO replyread(int no) {
		imgDTO dto=null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, title, grpno, indent, ansnum  ");
		sql.append(" from img ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new imgDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}

	return dto;
	}



	public boolean replyCreate(imgDTO dto) {
		
		boolean f = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into img ");
		sql.append(" (no,name,title,img,grpno,indent,ansnum,passwd,viewcnt,mdate) ");
		sql.append(" values((select nvl(max(no),0)+1 as no from img), ");
		sql.append(" ?,?,?,?,?,?,?,?,sysdate) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getImg());
			pstmt.setInt(4, dto.getGrpno());
			pstmt.setInt(5, dto.getIndent()+1);
			pstmt.setInt(6, dto.getAnsnum()+1);
			pstmt.setString(7, dto.getPasswd());
			pstmt.setInt(8, dto.getViewcnt());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) f = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}

			return f;
	}
	
	public List imgRead(int no) {
		List list = new ArrayList();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(no,2)     over (order by no) pre_no2,    ");
		sql.append("          lag(no,1)     over (order by no ) pre_no1,   ");
		sql.append("          no,  ");
		sql.append("          lead(no,1)    over (order by no) nex_no1,    ");
		sql.append("          lead(no,2)    over (order by no) nex_no2,    ");
		sql.append("          lag(img,2)  over (order by no) pre_file2,     ");
		sql.append("          lag(img,1)  over (order by no ) pre_file1,  ");
		sql.append("          img,   ");
		sql.append("          lead(img,1) over (order by no) nex_file1,  ");
		sql.append("          lead(img,2) over (order by no) nex_file2   ");
		sql.append("          from (  ");
		sql.append("               SELECT no, img   ");
		sql.append("               FROM img ");
		sql.append("               ORDER BY no DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String[] files = { rs.getString("pre_file2"),
						rs.getString("pre_file1"),
						rs.getString("img"),
						rs.getString("nex_file1"),
						rs.getString("nex_file2") };
				int[] noArr = { rs.getInt("pre_no2"),
						rs.getInt("pre_no1"),
						rs.getInt("no"),
						rs.getInt("nex_no1"),
						rs.getInt("nex_no2") };

				list.add(noArr);
				list.add(files);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;
	}

	public imgDTO read(int no) {
		imgDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT no, name, title, img from img ");
		sql.append(" WHERE no=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new imgDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setImg(rs.getString("img"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}
	
	public boolean create(imgDTO dto) {
		boolean f=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into img(no,title,name,img, passwd, mdate,grpno) ");
		sql.append(" values((select nvl(max(no),0)+1 as no from img), ");
		sql.append(" ?,?,?,?, sysdate, ");
		sql.append(" (select nvl(max(grpno),0)+1 as no from img) ) ");
		//System.out.println(dto.getTitle());
		//System.out.println(dto.getName());
		//System.out.println(dto.getImg());
		System.out.println(dto.getPasswd());
		try {
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getTitle());
		pstmt.setString(2, dto.getName());
		pstmt.setString(3, dto.getImg());
		pstmt.setString(4, dto.getPasswd());

		int cnt=pstmt.executeUpdate();
		if(cnt>0)f=true;

		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
		DBClose.close(pstmt, con);
		}

		return f;
	}

	public boolean update(imgDTO dto) {
		boolean f = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update img ");
		sql.append(" set title = ?, ");
		sql.append(" name = ?, ");
		sql.append(" img = ? ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getImg());
			pstmt.setInt(4, dto.getNo());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				f = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}

		return f;
	}

	public boolean delete(int no) {
		boolean f = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from img ");
		sql.append(" where no=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				f = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return f;

	}

	public List<imgDTO> list(Map map) {
		List<imgDTO> list = new ArrayList<imgDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, title, name, img, grpno, indent,  ");
		sql.append(" 		ansnum, passwd, viewcnt, mdate, r ");
		sql.append(" from( ");
		sql.append(" 	select no, title, name, img, grpno, indent,  ");
		sql.append(" 		ansnum, passwd, viewcnt, mdate, rownum as r  ");
		sql.append(" 	from( ");
		sql.append(" 		select no, title, name, img, grpno, indent,  ");
		sql.append(" 		ansnum, passwd, viewcnt,  ");
		sql.append(" 		to_char(mdate,'yyyy-mm-dd') as mdate ");
		sql.append(" 		from img ");
		if(word.trim().length()>0)
			sql.append(" 		where " + col + " like '%'||?||'%' ");
		sql.append(" 		order by grpno desc, ansnum ");
		sql.append(" 	) ");
		sql.append(" ) where r>= ? and r<= ? ");
		
		int i = 0 ;
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				imgDTO dto = new imgDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setMdate(rs.getString("mdate"));
				
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

	public int total(Map map) {
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from img ");
		if(word.trim().length()>0)
			sql.append(" 	where " + col + " like  '%'||?||'%'  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			total = rs.getInt(1); // 첫번째 가져온 데이터를 total 에 담음
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return total;

	}

	public String getimg(int no) {
		String oldfile="";
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select img from img where no=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				oldfile=rs.getString("img");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return oldfile;
	}
	
	public void upAnsnum(Map map) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update img ");
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

	public void viewcnt(int no) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update img ");
		sql.append(" set viewcnt = viewcnt + 1 ");
		sql.append(" where no =? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}		

	}

	public boolean passcheck(Map map) {
		boolean f = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int no = (Integer) map.get("no");
		String passwd = (String) map.get("passwd");

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(passwd) from img ");
		sql.append(" where no=? and passwd=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0)
					f = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return f;
	}

}