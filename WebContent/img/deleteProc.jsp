<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="img.imgDAO" />
<%
	String upDir=application.getRealPath("/img/storage");
	int no=Integer.parseInt(request.getParameter("no"));
	String passwd=request.getParameter("passwd");
	String oldfile=dao.getimg(no);
	
	Map map=new HashMap();
	map.put("no",no);
	map.put("passwd",passwd);
	
	boolean cf=dao.passcheck(map);
	boolean f=false;
	if(cf){
		f=dao.delete(no);
		if(oldfile!=null)
			UploadSave.deleteFile(upDir, oldfile);
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<!-- <link href="../css/style.css" rel="Stylesheet" type="text/css"> -->
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	

<h2>처리결과</h2>

<div class="container">
<%if(f){
	out.print("삭제되었습니다");
}else if(!cf){
	out.print("비밀번호가 일치하지 않습니다");
}else{
	out.print("삭제 실패");
}
%>
</div>
<div>
<%if(f){%>
<button onclick="location.href='./list.jsp'">목록</button>
<%}else if(!cf){ %>
<button onclick="history.back()">다시시도</button>
<button onclick="location.href='./list.jsp'">목록</button>
<%}else{ %>
<button onclick="location.href='./list.jsp'">목록</button>
<%} %>
</div>

<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html> 