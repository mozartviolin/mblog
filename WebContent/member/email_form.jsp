<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>Email 중복확인</h2>
 
<FORM name='frm' method='POST' action='./email_proc.jsp'>
<div class="content">이메일을 입력하세요</div>
  <TABLE>
    <TR>
      <TH>이메일</TH>
      <TD><input type="text" name="email"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='중복확인'>
    <input type='button' value='취소' onclick="window.close()">
  </DIV>
</FORM>
 
 <jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 