<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>


<%
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	FileItem fileItem = upload.getFileItem("fname");
	String fname = null;
	if(fileItem.getSize()>0){
		UploadSave.deleteFile(upDir, oldfile);
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("fname", fname);
	
	boolean flag = dao.updateFile(map);

%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style>
<script type="text/javascript">
function nread(id){
	var url = "read.jsp";
	url += "?id=<%=id%>";
	
	location.href = url;	
}
</script> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>사진 변경</h2>

 <div class="content">
<%
if(flag){
	out.print("사진이 변경되었습니다.");	
} else{
	out.print("사진 변경에 실패하엿습니다.");
}
%>
  </div>
  <DIV class='bottom'>
  <% if(flag){ %>
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
    <input type='button' value='나의정보보기' onclick="nread()">
    <input type='button' value='다시시도' onclick="history.back()">
    
   <%}else{ %>
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
    <input type='button' value='다시시도' onclick="history.back()">
    <%} %>
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 