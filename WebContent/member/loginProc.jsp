<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
 
<jsp:useBean id="dao" class="member.MemberDAO" /> 

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("pw", passwd);
	
	boolean flag = dao.loginCheck(map);
	if(flag){
		String grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);		
	}

%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
</head> 
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>로그인 확인</h2>

<div class="content">
<%
if(flag){
	out.print("로그인 되었습니다.<br><br>");
} else{
	out.print("로그인에 실패하였습니다.<br>");
	out.print("아이디/패스워드를 잘못 입력하셨거나 <br>");
	out.print("회원이 아닙니다. <br> 회원가입을 하세요.");
}
%>

</div> 
  
  <DIV class='bottom'>
    <input type='button' value='뒤로가기' onclick="history.back()">
    <input type='button' value='홈으로' onclick="location.href='../index.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 