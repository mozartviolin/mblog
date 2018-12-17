<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="img.imgDAO"/>
<jsp:useBean id="dto" class="img.imgDTO"/>

<%
	String upDir = application.getRealPath("/img/storage");
	String tempDir = application.getRealPath("/img/temp");
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	int no = Integer.parseInt(upload.getParameter("no"));
	String title = UploadSave.encode(upload.getParameter("title"));
	String name = UploadSave.encode(upload.getParameter("name"));
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	String passwd = UploadSave.encode(upload.getParameter("passwd"));
	
	FileItem fileItem = upload.getFileItem("img");
	
	String img = "";
	if(fileItem.getSize()>0){
		UploadSave.deleteFile(upDir, oldfile);
		img = UploadSave.saveFile(fileItem, upDir);
	}
	dto.setTitle(title);
	dto.setName(name);
	dto.setNo(no);
	dto.setPasswd(passwd);
	dto.setImg(img);
	
	Map map = new HashMap();
	map.put("no", dto.getNo()); 
	map.put("passwd", dto.getPasswd());
	
	
	//System.out.println("no:"+dto.getNo());
	//System.out.println("passwd:"+dto.getPasswd());
	
	boolean pflag = dao.passcheck(map);	
	boolean flag = false;
	if(pflag){
	 	flag = dao.update(dto);
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
 
<h2>수정 결과</h2>

<div class="content">

<%
if(pflag==false){
	out.print("비밀번호가 일치하지 않습니다.");
	
}else if(flag){
	out.print("내용 수정을 성공했습니다.");
}else{
	out.print("내용 수정을 실패했습니다.");
}
%>

</div>

  <DIV class='bottom'>
    <input type='button' value='목록' onclick="location.href='list.jsp'">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>
 
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html> 
