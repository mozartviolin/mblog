<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String id = request.getParameter("id");

	boolean flag = dao.duplicateId(id);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style>
<script type="text/javascript">
function use(){
opener.frm.id.value='<%=id%>';
window.close();
}
function reid(){
	var url = "id_form.jsp";
	location.href = url;
}
function use(){
	opener.frm.id.value='<%=id%>';
	opener.frm.passwd.focus();
	self.close();	
}
</script>

<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>아이디 중복 확인</h2>
 
<div class="content">
입력된 ID : <%=id %><br><br>
<%
	if(flag){
		out.print("중복된 아이디라 사용할 수 없습니다<br><br>");
	} else{
		out.print("사용 가능한 아이디 입니다.<br><br>");
		out.print("<button onclick='use()'>사용</button>");
	}
%>

</div>
  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="reid()">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>

	<jsp:include page="/menu/footer.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html> 