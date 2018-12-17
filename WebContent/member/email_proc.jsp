<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String email = request.getParameter("email");

	boolean flag = dao.duplicateEmail(email);
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
	opener.frm.email.value='<%=email%>';
	window.close();
	}
function reemail(){
	var url = "email_form.jsp";
	location.href = url;
}
function use(){
	opener.frm.email.value='<%=email%>';
	opener.frm.zipcode.focus();
	self.close();
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>
<!-- *********************************************** -->
 
<DIV class="title">이메일 중복 확인</DIV>
 
<div class="content">
입력된 이메일 : <%=email %><br><br>
<%
	if(flag){
		out.print("중복된 이메일이라 사용할 수 없습니다<br><br>");
	} else{
		out.print("사용 가능한 이메일 입니다.<br><br>");
		out.print("<button onclick='use()'>사용</button>");
	}
%>

</div>
  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="reemail()">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>
 
 
<!-- *********************************************** -->
<%-- <jsp:include page="/menu/bottom.jsp" flush="false"/> --%>
</body>
<!-- *********************************************** -->
</html> 