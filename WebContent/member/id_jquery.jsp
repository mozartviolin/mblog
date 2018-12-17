<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String id = request.getParameter("id");

	boolean flag = dao.duplicateId(id);

	if(flag){
		out.print("중복된 아이디라 사용할 수 없습니다.");
	} else{
		out.print("사용 가능한 아이디 입니다.");
	}
%>