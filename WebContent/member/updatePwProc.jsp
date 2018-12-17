<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String oldpasswd = request.getParameter("oldpasswd");
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("passwd", passwd);
	map.put("oldpasswd", oldpasswd);
	
	boolean flag2 = dao.checPwup(map);
	boolean flag =false;
	if(flag2){
		flag = dao.updatePw(map);		
	} 
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 

<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>패스워드 변경 확인</h2>
 
<div class="content">


<%

if(flag2==false){
	out.print("패스워드가 일치 안함");
} else if(flag==true){
	out.print("패스워드가 새롭게 변경되었습니다.<br>");
	out.print("로그잉을 해보세요.<br>");
} else {
	out.print("패스워드 변경에 실패하였습니다.");
} 
	

%>


</div>
  
  <DIV class='bottom'>
 <%if(flag){ %>
    <input type='button' value='로그인'
    onclick="location.href='./loginForm.jsp'">
    <input type='button' value='홈으로'
    onclick="location.href='../index.jsp'">
   <%}else{ %>
    <input type='button' value='다시시도' 
    onclick="history.back()">
    <input type='button' value='홈으로'
    onclick="location.href='../index.jsp'">
    <%} %>

  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 