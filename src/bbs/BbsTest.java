package bbs;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao = new BbsDAO();
		list(dao);
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		
	}

	private static void list(BbsDAO dao) {
		
		List<BbsDTO> list = dao.list();
		
	/*	for(int i=0;i<list.size();i++) {
			BbsDTO dto = list.get(i);
		}*/
		
		Iterator<BbsDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			BbsDTO dto = iter.next();
			p(dto);
			p("----------------------");
			
		}
		
	}
	
	private static void delete(BbsDAO dao) {
		if(dao.delete(1)) {
			p("delete 성공");
		} else {
			p("delete 실패");
		}
		
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = dao.read(2);
		
		dto.setWname("이이름");
		dto.setTitle("이제목");
		dto.setContent("이름이 뭐니");
		
		if(dao.update(dto)) {
			p("update 성공");
		}else {
			p("update 실패");
		}
		
		
	}

	private static void read(BbsDAO dao) {
		BbsDTO dto = dao.read(2);
		p(dto);
		
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("김지우");
		dto.setTitle("무지개");
		dto.setContent("무지개가 보이는 원리");
		dto.setPasswd("123");
				
		if(dao.create(dto)) {
			p("create 성공");
		}else {
			p("create 실패");
		}
	}

	

	private static void p(BbsDTO dto) {
		p("번호 : " + dto.getBbsno());
		p("글쓴이 : " + dto.getWname());
		p("제목 : " + dto.getTitle());
		p("글내용 : " + dto.getContent());
		p("조회수 : " + dto.getViewcnt());
		p("등록날짜 : " + dto.getWdate());
		p("grpno : " + dto.getGrpno());
		p("indent : " + dto.getGrpno());
		p("ansnum : " + dto.getAnsnum());
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
