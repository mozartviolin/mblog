<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>파일 수정</h2>

<FORM name='frm' method='POST' action='./updateFileProc.jsp'
	enctype="multipart/form-data">
	<input type="hidden" name="id" 
		value="<%=request.getParameter("id")%>">
	<input type="hidden" name="oldfile" 
		value="<%=request.getParameter("oldfile")%>">
  <TABLE>
    <tr>
   	<td colspan="2" style="text-align:center">
   	<img src="./storage/<%=request.getParameter("oldfile")%>"><br>원래 사진
   </td>
  </tr>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="fname"></TD>
    </TR>
  </TABLE>

  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 