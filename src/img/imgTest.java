package img;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import bbs.BbsDTO;

public class imgTest {

	public static void main(String[] args) {
		imgDAO dao = new imgDAO();
		//list(dao);
		create(dao);

	}

	private static void create(imgDAO dao) {
		
		
	}

	private static void list(imgDAO dao) {
		/*Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);*/
		
		List<imgDTO> list = dao.list();
		
		Iterator<imgDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			imgDTO dto = iter.next();
			p(dto);
			p("----------------------");
			
		}
		
	}

	private static void p(imgDTO dto) {
		p("번호 : " + dto.getNo());
		p("제목 : " + dto.getTitle());
		p("이름 : " + dto.getName());
		p("이미지 : " + dto.getImg());		
		p("grpno : " + dto.getGrpno());
		p("indent : " + dto.getGrpno());
		p("ansnum : " + dto.getAnsnum());
		p("패스워드 : " + dto.getPasswd());
		p("조회수 : " + dto.getViewcnt());
		p("게시일 : " + dto.getMdate());
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
