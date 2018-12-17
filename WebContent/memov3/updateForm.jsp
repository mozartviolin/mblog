<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="../ssi/ssi.jsp" %>

<jsp:useBean id="dao" class="memo.MemoDAO"/>



<% 
request.setCharacterEncoding("utf-8");
int memono = Integer.parseInt(request.getParameter("memono"));

MemoDTO dto = dao.read(memono);

%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
div{
  text-align: center; 
  margin-top: 20px; 
  margin-bottom: 20px;
}
table{
  width: 50%;
  margin: 0 auto;
}
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
 
</style> 
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>
<div>메모 수정</div>
<form name="frm" method="post"
action="./updateProc.jsp"
onsubmit="return input(this)">
<input type="hidden" name="memono" value="<%=memono %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">

<table>
<tr>
<th>이름</th>
<td>
<input type="text" name="wname" size="30" 
value=""/>
</td>
</tr>
<tr>
<th>패스워드</th>
<td>
<input type="password" name="wname" size="30" value=""/>
</td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="10" cols="30" name="content">
<%=dto.getContent()%>
</textarea>
</td>
</tr>
</table>

<div>
<input type="submit" value="수정">
</div>
</form>
<jsp:include page="/menu/footer.jsp"/>
</body> 
</html> 
