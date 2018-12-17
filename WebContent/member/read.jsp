<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	String id = request.getParameter("id");
	if(id==null) id = (String)session.getAttribute("id");	
	MemberDTO dto = dao.read(id);	
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function updateFile(){
	var url = "updateFileForm.jsp";
	url = url + "?id=<%=dto.getId()%>";
	url = url + "&oldfile=<%=dto.getFname()%>";
	
	location.href=url;	
}
function updatepasswd(){
	var url = "updatePwForm.jsp";
	url += "?id=<%=dto.getId()%>";
	
		
	location.href=url;	
}
function updateForm(){
	var url = "updateForm.jsp";
	url += "?id=<%=dto.getId()%>"
			
	location.href=url;
	
}
function mdel(){
	var url = "deleteForm.jsp";
	url = url + "?id=<%=id%>";
	
	location.href = url;
}

</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	

<h2><%=dto.getMname() %> 님의 회원정보</h2>
 
<div class="content">
<TABLE align="center">
  <tr>
   <td colspan="2">
   <img src="./storage/<%=dto.getFname() %>" style="width:475px;height:auto;">
   </td>
  </tr>
  <TR>
    <TH>아이디</TH>
    <TD><%=dto.getId() %></TD>
  </TR>
  <TR>
    <TH>성명</TH>
    <TD><%=dto.getMname() %></TD>
  </TR>
  <TR>
    <TH>전화번호</TH>
    <TD><%=dto.getTel() %></TD>
  </TR>
  <TR>
    <TH>이메일</TH>
    <TD><%=dto.getEmail() %></TD>
  </TR>
  <TR>
    <TH>우편번호</TH>
    <TD><%=dto.getZipcode() %></TD>
  </TR>
  <TR>
    <TH>주소</TH>
    <TD>
    <%=dto.getAddress1() %>
    <%=Utility.checkNull(dto.getAddress2()) %>
    </TD>
  </TR>
  <TR>
    <TH>직업</TH>
    <TD>
     직업코드:<%=dto.getJob() %>
        (<%=Utility.getCodeValue(dto.getJob()) %>)
    </TD>
  </TR>
  <TR>
    <TH>가입일</TH>
    <TD><%=dto.getMdate() %></TD>
  </TR>
   <TR>
    <TH>등급</TH>
    <TD><%=dto.getGrade() %></TD>
  </TR>
</TABLE>
</div>
  
<DIV class='bottom'>
  <input type='button' value='홈' onclick="location.href='../index.jsp'">
  <input type='button' value='목록' onclick="location.href='<%=root%>/admin/list.jsp'">
  <input type='button' value='정보수정' onclick="updateForm()">
  <input type='button' value='사진수정' onclick="updateFile()">
  <input type='button' value='패스워드 변경' onclick="updatepasswd()">
  <input type='button' value='탈퇴' onclick="mdel()">
  
</DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 