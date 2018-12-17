<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="member.MemberDAO"%>
<%
String id = request.getParameter("id");
String mname = request.getParameter("mname");

Map map = new HashMap();
map.put("id",  id);
map.put("mname", mname);

MemberDAO dao = new MemberDAO();
String pw = dao.getPwFind(map);

if(pw==null){
	out.print("패스워드 정보가 없습니다.");
}else{
	out.print("당신의 패스워드는 " + pw + " 입니다.");
}
%>