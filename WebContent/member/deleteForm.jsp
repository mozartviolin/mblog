<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
 <%
 	String id = request.getParameter("id");
 	if(id==null) id = (String)session.getAttribute("id");
 
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
 
<h2>회원 탈퇴</h2>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="id" value="<%=id %>">

<div class="content">
탈퇴하시면 더이상 컨텐츠를 제공 받을 수 없습니다.<br>
그래도 탈퇴를 원하시면 아래 버튼을 클릭하세요.

</div>

<div class="bin"><br><br></div>
  
  <DIV class='bottom'>
    <input type='submit' value='탈퇴'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 