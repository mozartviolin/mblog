<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 

<jsp:useBean id="dao" class="img.imgDAO" />
<%

int no = Integer.parseInt(request.getParameter("no"));
imgDTO dto = dao.replyread(no);

%>

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>답변</h2>
 
<FORM name='frm' method='POST' action='./replyProc.jsp'
enctype="multipart/form-data">
<input type = "hidden" name = "no" value = "<%=dto.getNo()%>">
<input type = "hidden" name = "grpno" value = "<%=dto.getGrpno()%>">
<input type = "hidden" name = "indent" value = "<%=dto.getIndent()%>">
<input type = "hidden" name = "ansnum" value = "<%=dto.getAnsnum()%>">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD><input type = "text" name = "name"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type = "text" name = "title" value = "<%=dto.getTitle()%>"></TD>
    </TR>
    <TR>
      <TH>사진파일</TH>
      <TD><input type = "file" name = "img" accept=".jpg,.png,.gif"></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type = "password" name = "passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='목록' onclick="location.href='list.jsp'">
  </DIV>
</FORM>
 
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>