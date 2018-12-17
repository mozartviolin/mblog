package memo;

import java.util.Iterator;
import java.util.List;

public class MemoTest {

	public static void main(String[] args) {
		MemoDAO dao = new MemoDAO();
		//list(dao);
		//delete(dao);
		//update(dao);
		//read(dao);
		//create(dao);
		}

	private static void create(MemoDAO dao) {
		MemoDTO dto = new MemoDTO();
		dto.setTitle("하히후헤호gggggg");
		dto.setContent("히히히히gggggg");
		
		if(dao.create(dto)) {
			p("크리에잇 성공");
		}else {
			p("실패 ㅠ");
		}
		
	}

	private static void read(MemoDAO dao) {
		MemoDTO dto = dao.read(12);
		p(dto);
		
	}

	private static void update(MemoDAO dao) {
		MemoDTO dto = new MemoDTO();
		dto.setMemono(111);
		dto.setTitle("저녁약속");
		dto.setContent("프로젝트 관련 회의");
		
		if(dao.update(dto)) {
			p("수정 성공");
		} else {
			p("수정 실패");
		}
		
	}

	private static void delete(MemoDAO dao) {
		if(dao.delete(1)) {
			p("삭제 성공");
		}else {
			p("FAIL");
		}
		
	}

	private static void list(MemoDAO dao) {
		List<MemoDTO> list = dao.list();
		
		Iterator<MemoDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			MemoDTO dto = iter.next();
			p(dto);
			p("---------------------");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(MemoDTO dto) {
		p("번호 : " + dto.getMemono());
		p("제목 : " + dto.getTitle());
		p("내용 : " + dto.getContent());
		p("날짜 : " + dto.getWdate());
		p("조회수 : " + dto.getViewcnt());
		
	}

}
