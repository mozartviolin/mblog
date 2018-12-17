<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="member.MemberDAO"%>
<%
String mname = request.getParameter("mname");
String email = request.getParameter("email");

Map map = new HashMap();
map.put("mname", mname);
map.put("email", email);

MemberDAO dao = new MemberDAO();
String id = dao.getIdFind(map);

if(id==null){
	out.print("아이디가 없습니다.");
}else{
	out.print("당신의 아이디는 " + id + " 입니다.");
}
%>