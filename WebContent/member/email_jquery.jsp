<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String email = request.getParameter("email");

	boolean flag = dao.duplicateEmail(email);

	if(flag){
		out.print("중복된 이메일이라 사용할 수 없습니다.");
	} else{
		out.print("사용 가능한 이메일 입니다.");

	}
%>