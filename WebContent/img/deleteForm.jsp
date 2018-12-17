<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="img.imgDAO"/>
<%
	
	int no=Integer.parseInt(request.getParameter("no"));
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
</style> 
<script type="text/javascript">
function read(){
	var url="read.jsp";
	url+="?no=<%=no%>";
	location.href=url;
}
</script>
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
	
<h2>삭제</h2>

<div class="container">
삭제시 복구할 수 없습니다 <br> 삭제를 원하시면 아래 패스워드를 입력 하시고<br>삭제 버튼을 눌러주세요
<form name="frm" method="post" action="./deleteProc.jsp">
<input type="hidden" name="no" value="<%=no %>">
<table class="table table-striped">
<tr>
<th></th>
<td><input type="password" name="passwd">
<button>삭제</button>
<button type="button" onclick="read()">취소</button>
</td>
</tr>
</table>

</form>
</div>

<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html> 