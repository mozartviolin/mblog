<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
 
<jsp:useBean id="dao" class="member.MemberDAO" /> 
<%
	String upDir = application.getRealPath("/member/storage");
	String id = request.getParameter("id");
	String oldfile = dao.getFname(id);
	
	boolean flag = dao.delete(id);
	
	if(flag){
		if(oldfile!=null && !oldfile.equals("member.jpg"))
		UploadSave.deleteFile(upDir, oldfile);
		
		session.invalidate();
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
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>회원 탈퇴 처리</h2>
 
<div class="content">
<% 
	if(flag){
		out.print("탈퇴처리되었습니다. 자동 로그아웃됩니다.");
	}else{
		out.print("탈퇴가 실패되었습니다.");
	}
%>


</div>
  
  <DIV class='bottom'>
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 