<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO" />
<%											

	String tempDir = "/member/temp";
	String upDir = "/member/storage";
	
	tempDir = application.getRealPath(tempDir);
	upDir = application.getRealPath(upDir);
	
	UploadSave upload = new UploadSave(request,-1,-1, tempDir);
	//-1,-1 메모리 크기 파일 크기 제한X
	
	//한글안쓸거임 간단하게 getParameter로 불러옴
	String id = upload.getParameter("id");
	String email = upload.getParameter("email");
	String str = "";
	
	if(dao.duplicateId(id)){
		str = "중복된 아이디입니다. 아이디 중복 확인을 하세요.";
	} else if(dao.duplicateEmail(email)){
		str = "중복된 이메일입니다. 이메일 중복 확인을 하세요.";
	} else {
		request.setAttribute("upload", upload);
%>
	<jsp:forward page="/member/createProc.jsp" />
<%
	return;		
	}
	
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>아이디 및 이메일 중복확인</h2>
 
<div class="content">
<%=str %>

</div>
  
  <DIV class='bottom'>  
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 