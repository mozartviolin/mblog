<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
 
 <%
	String id= request.getParameter("id");
 	String oldp = dto.getPasswd();		
	Map map = new HashMap();
	map.put("id",id);
	map.put("oldp",oldp);
	
	boolean dflag = dao.checPwup(map);
 
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
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>처리확인</h2>
 
<div>
<%
if(dflag){
	out.print("중복");
} else{
	out.print("낫중복");
}
%>

</div>
  
  <DIV class='bottom'>
    <input type='submit' value=''>
    <input type='button' value='' onclick="location.href=''">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 