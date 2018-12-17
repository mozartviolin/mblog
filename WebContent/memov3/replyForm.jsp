<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	MemoDAO dao = new MemoDAO();
	
	MemoDTO dto = dao.replyRead(memono);
	
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
div{
	text-align:center;
	margin-top:20px;
	margin-bottom:20px;
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
<script type="text/javascript">
function incheck(f){
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();
		return false;		
	}	
}
</script> 
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>
	
<h2>메모 답변 등록</h2>

<form name="frm" method="post" action="./replyProc.jsp" 
onsubmit="return incheck(this)">
<input type="hidden" name="memono" value="<%=dto.getMemono()%>" >
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>" >
<input type="hidden" name="indent" value="<%=dto.getIndent() %>" >
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>" >
<table>
<tr>
<th>이름</th>
<td>
<input type="text" name="wname" size="30" value="">
</td>
</tr>
<tr>
<th>패스워드</th>
<td>
<input type="password" name="passwd" size="30" value="">
</td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="10" cols="30" name="content"></textarea>
</td>
</tr>
</table>

<div>
<input type="submit" value="전송">
</div>

</form>
<jsp:include page="/menu/footer.jsp"/>
</body> 
</html> 
