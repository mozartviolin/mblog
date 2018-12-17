<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>


<%
	String tempDir = application.getRealPath("bbs/temp");
	String upDir = application.getRealPath("bbs/storage");
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	// 매개변수있는 생성자는 usebean을 사용할 수 없다
	
	//form 값 받기
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(upload.getParameter("passwd"));

	//hidden 값 받기
	dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));
	
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	//업로드 파일 받기
	FileItem fileItem = upload.getFileItem("filename");
	int filesize = (int)fileItem.getSize();
	String filename = null;
	
	Map map = new HashMap();
 	map.put("bbsno", dto.getBbsno());
 	map.put("passwd", dto.getPasswd());
 	
 	boolean pflag = dao.passCheck(map);
 	boolean flag = false;
 	if(pflag){
 		if(filesize>0) {
 			if(oldfile!=null) UploadSave.deleteFile(upDir, oldfile);
 			filename = UploadSave.saveFile(fileItem, upDir);
 		}
 		
 		dto.setFilename(filename);
 		dto.setFilesize(filesize);
 		
 		flag=bdao.update(dto);
 	}

%>
 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function blist(){
	var url = "list.jsp";	
	url = url + "?col=<%=col %>";
	url = url + "&word=<%=word %>";
	url = url + "&nowPage=<%=nowPage %>";
	
	location.href = url;
	
}

</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 

<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>처리 결과</h2>
 
<div class="content">
<%
if(pflag==false){
	out.print("패스워드가 일치하지 않습니다.");
}else if(flag){
	out.print("글을 수정했습니다.");
}else{
	out.print("글 수정에 실패햇습니다.");
}

%>

</div>
 
<div class="bottom">
<input type="button" value="다시 수정" onclick="history.back()">
<input type="button" value="목록" onclick="blist()">

</div>

<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 