<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="../ssi/ssi.jsp" %>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
 	String passwd = request.getParameter("passwd");
 	String oldfile = request.getParameter("oldfile");
 	
 	Map map = new HashMap();
 	map.put("bbsno", bbsno);
 	map.put("passwd", passwd);
 	
 	boolean pflag = bdao.passCheck(map);
 	boolean flag = false;
 	if(pflag){
 		flag=bdao.delete(bbsno);
 	}
 	
 	String upDir = application.getRealPath("/bbs/storage");
 	if(flag){
 		UploadSave.deleteFile(upDir, oldfile);
 	}

%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<script type="text/javascript">
function blist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	
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
if(pflag==false){
	out.print("패스워드가 일치하지 않습니다.");
}else if(flag){
	out.print("글을 삭제했습니다.");
}else{
	out.print("글삭제에 실패햇습니다.");
}

 if(pflag==false||flag==false){
 %>
</div>
  
  <DIV class='bottom'>
    <input type='submit' value='다시시도' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
 <%}else{ %>
 
  <DIV class='bottom'>

    <input type='button' value='목록' onclick="blist()">
  </DIV>
  <%} %>
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 