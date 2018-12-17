<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
div{
	text-align:center;
}
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
	
<h2>이미지 등록</h2>
 
<FORM name='frm' method='POST' action='./createProc.jsp'
enctype="multipart/form-data">
  <TABLE class="table table-striped" width="60%" style="margin:auto;width:55%">
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" ></TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD><input type="text" name="name" ></TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd" ></TD>
    </TR>
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="img" ></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>

</html> 