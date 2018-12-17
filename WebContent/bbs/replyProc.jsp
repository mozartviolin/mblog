<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="../ssi/ssi.jsp"	 %>

<jsp:useBean id="dto" class="bbs.BbsDTO"/>

<%
	String upDir = application.getRealPath("/bbs/storage");
	String tempDir = application.getRealPath("/bbs/temp");
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	
	dto.setPasswd(upload.getParameter("passwd"));
	
	int grpno = Integer.parseInt(upload.getParameter("grpno"));
	int ansnum = Integer.parseInt(upload.getParameter("ansnum"));
	int indent = Integer.parseInt(upload.getParameter("indent"));
	
	dto.setGrpno(grpno);
	dto.setAnsnum(ansnum);
	dto.setIndent(indent);
	
	FileItem fileItem = upload.getFileItem("filename");
	
	int filesize = (int)fileItem.getSize();
	String filename = null;
	if(filesize>0) UploadSave.saveFile(fileItem, upDir);
	
	dto.setFilename(filename);
	dto.setFilesize(filesize);
	
	Map map = new HashMap();
	map.put("grpno", grpno);
	map.put("ansnum", ansnum);
	bdao.upAnsnum(map);
	
	boolean flag = bdao.replyCreate(dto);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<script type="text/javascript">
function btlist(){
	var url = "list.jsp";
		
	location.href=url;
}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 

<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>처리 결과</h2>
 
<div class="content">
<%
	if(flag){
		out.print("답변글이 등록되었습니다.");
	} else{
		out.print("답변글 등록이 실패했습니다.");
	}
%>

</div>
 
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="btlist()">
    <input type='button' value='새글쓰기' onclick="location.href='createForm.jsp'">
  </DIV>

 
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 