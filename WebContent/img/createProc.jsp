<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="img.imgDAO" />
<jsp:useBean id="dto" class="img.imgDTO" />

<%
String upDir = "/img/storage";
String tempDir = "/img/temp";
upDir = application.getRealPath(upDir);
tempDir = application.getRealPath(tempDir);

UploadSave upload = new UploadSave(request, -1, -1, tempDir);
String title = UploadSave.encode(upload.getParameter("title"));
String name = UploadSave.encode(upload.getParameter("name"));
String passwd = UploadSave.encode(upload.getParameter("passwd"));

FileItem fileItem = upload.getFileItem("img");
String img = UploadSave.saveFile(fileItem, upDir);

dto.setTitle(title);
dto.setName(name);
dto.setImg(img);
dto.setPasswd(passwd);
boolean f = dao.create(dto);
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

<h2>사진 등록 결과</h2>

<div class="content">
<%
if (f) {
out.print("사진등록이 성공했습니다.");
} else {
out.print("실패했습니다.");
}
%>

</div>

<DIV class='bottom'>
<input type='button' value='홈' onclick="location.href='../index.jsp'"> 
<input type='button' value='다시시도' onclick="history.back()">
<input type='button' value='리스트' onclick="location.href='list.jsp'">
<input type='button' value='다른 사진 올리기' onclick="location.href='createForm.jsp'">
</DIV>


<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>