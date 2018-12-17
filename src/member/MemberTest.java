package member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class MemberTest {

	public static void main(String[] args) {
		
		MemberDAO dao = new MemberDAO();
		
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		total(dao);
		
		
	}
		
		
	private static void total(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "자3");
		
		
		int tot = dao.total(map);
		p(" '자3' 이 들어간 전체레코드개수 : " + tot);
		
	}


	private static void list(MemberDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "user");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<MemberDTO> list = dao.list(map);		
		
		Iterator<MemberDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			MemberDTO dto = iter.next();
			p(dto);
			p("----------------------");
			
		}
		
	}


	private static void delete(MemberDAO dao) {
		if(dao.delete("user2")) {
			p("delete 성공");
		}else {
			p("delete 실패");
		}
		
	}


	private static void update(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		
		dto.setPasswd("1233");
		dto.setTel("44444444");
		dto.setEmail("poto@gmail.com");
		dto.setZipcode("462-290");
		dto.setAddress1("서울시");
		dto.setAddress2("강남구");
		dto.setJob("TT");
		dto.setId("user3");
		
		if(dao.update(dto)) {
			p("update 성공");
		}else {
			p("update 실패");
		}
		
	}


	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("user2");
		p(dto);
		
	}


	private static void p(MemberDTO dto) {
		p("아이디: " + dto.getId());
		p("패스워드: " + dto.getPasswd());
		p("전화번호: " + dto.getTel());
		p("이메일: " + dto.getEmail());
		p("우편번호: " + dto.getZipcode());
		p("주소1: " + dto.getAddress1());
		p("주소2: " + dto.getAddress2());
		p("직장: " + dto.getJob());
		p("가입일: " + dto.getMdate());
		p("회원사진: " + dto.getFname());
		p("등급: " + dto.getGrade());
						
	}


	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		 dto.setId("user7");
		 dto.setPasswd("1234");
		 dto.setMname("개발자1");
		 dto.setTel("123-1234");
		 dto.setEmail("email7@mail.com");
		 dto.setZipcode("123-153");
		 dto.setAddress1("서울시");
		 dto.setAddress2("송파구");
		 dto.setJob("a01");
		 dto.setFname("man.jpg");
		 dto.setGrade("H");
		
		 if(dao.create(dto)) {
				p("create 성공");
			}else {
				p("create 실패");
			}
		
	}
	private static void p(String string) {
		System.out.println(string);
		
	}

}
