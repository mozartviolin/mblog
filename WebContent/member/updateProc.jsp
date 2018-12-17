<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>

<jsp:setProperty property="*" name="dto"/>

<% boolean flag = dao.update(dto); %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<script type="text/javascript">
function mread(id){
	var url = "read.jsp";
	url += "?id=<%=dto.getId()%>"
	location.href=url;	
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>정보수정</h2>
 
 
 <div class="content">
 <%
 	if(flag){
 		out.print("정보수정에 성공했습니다.");
 	} else{
 		out.print("정보 수정에 실패했습니다.");
 	}
 %>
 
 </div>

  
  <DIV class='bottom'>
    <input type='button' value='나의정보확인' onclick="mread()">
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 