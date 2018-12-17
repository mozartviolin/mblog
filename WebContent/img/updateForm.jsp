<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="img.imgDAO"/>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	imgDTO dto = dao.read(no);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>내용 수정</h2>
 
<FORM name='frm' method='POST' action='./updateProc.jsp'
enctype="multipart/form-data">

<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">
<input type="hidden" name="no" value="<%=request.getParameter("no")%>">

  <TABLE>
     
     <TR>
      <Td colspan="2" style="text-align: center">
      <img src="./storage/<%=request.getParameter("oldfile")%>" style="width:550px">
      </Td>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle() %>"></TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD><input type="text" name="name" value="<%=dto.getName() %>"></TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="img"></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html> 
