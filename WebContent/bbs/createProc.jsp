<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<jsp:useBean id="dto" class="bbs.BbsDTO"/> 

 <%
 	String upDir = application.getRealPath("/bbs/storage");
 	String tempDir = application.getRealPath("/bbs/temp");
 	
 	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
 	
 	//한글처리
 	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
 	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
 	dto.setContent(UploadSave.encode(upload.getParameter("content")));
 	
 	dto.setPasswd(upload.getParameter("passwd"));
 
 	FileItem fileItem = upload.getFileItem("filename");
 	
 	int filesize = (int)fileItem.getSize(); 	
 	String filename = null;
 	
 	if(filesize>0) {
 		filename = UploadSave.saveFile(fileItem, upDir);
 		}
 	
 	dto.setFilename(filename);
 	dto.setFilesize(filesize);
 	
 	boolean flag = dao.create(dto); 
 
 %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>게시글 등록 확인</title> 

<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 

<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>게시글 등록 확인</h2>
 
<FORM name='frm' method='POST' action='./list.jsp'>
 
 <div style="text-align:center">
	<%
		if(flag){
			out.print("게시글이 등록되었습니다.");
		} else{
			out.print("게시글 등록에 실패하였습니다.");
		}
	
	%>

</div>
   
  <DIV class='bottom'>
    <input type='submit' value='목록으로 돌아가기'>

  </DIV>
</FORM>
 
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 