<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
.title{
	margin: 40px auto;
	font-size: 40px;
	font-family:Fantasy; 
	text-align: center;
}
</style> 
</head> 

<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>로그인</h2>
 
<FORM name='frm' method='POST' action='<%=root %>/member/loginProc.jsp'>
  <TABLE style="width:auto; margin: auto; text-align:center">
    <TR>
      <TH>아이디</TH>
      <TD><input type="text" name="id"></TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
  </TABLE>
  <br><br>
  

  
  <DIV class='bottom'>
    <input type='submit' value='로그인'>
    <input type='button' value='회원가입' onclick="location.href='./agreement.jsp'">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 