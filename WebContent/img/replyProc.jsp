<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 
<jsp:useBean id="dto" class="img.imgDTO"/>
<jsp:useBean id="dao" class="img.imgDAO"/>

<%
String upDir = application.getRealPath("/img/storage");
String tempDir = application.getRealPath("/img/temp");

UploadSave upload =
new UploadSave(request,-1,-1,tempDir);

FileItem fileItem = upload.getFileItem("img");


String img = null;
String title = UploadSave.encode(upload.getParameter("title"));
String name = UploadSave.encode(upload.getParameter("name"));
String passwd = UploadSave.encode(upload.getParameter("passwd"));

int grpno = Integer.parseInt(upload.getParameter("grpno"));
int indent = Integer.parseInt(upload.getParameter("indent"));
int ansnum = Integer.parseInt(upload.getParameter("ansnum"));


int size = (int)fileItem.getSize();
if(size>0){
	img = UploadSave.saveFile(fileItem,upDir);
}


dto.setTitle(title);
dto.setName(name);
dto.setImg(img);
dto.setPasswd(passwd);
dto.setGrpno(grpno);
dto.setIndent(indent);
dto.setAnsnum(ansnum);

Map map = new HashMap();
map.put("grpno", grpno);
map.put("ansnum", ansnum);
dao.upAnsnum(map);

boolean flag = dao.replyCreate(dto);

%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<script type="text/javascript">
function rlist(){
	var url = "list.jsp";
	location.href = url;
	
}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
<h2>답변처리결과</h2>
 
<div class="content">
<% 
if(flag){
	out.print("답변글이 등록되었습니다.");
}else{
	out.print("답변글 등록을 실패했습니다.");
}
%>

</div>
  
  <DIV class='bottom'>
    <input type='submit' value='목록' onclick = "rlist()">
    <input type='button' value='새글 등록' onclick="location.href='createForm.jsp'">
  </DIV>

 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>