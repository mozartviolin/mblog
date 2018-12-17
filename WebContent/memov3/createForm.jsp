<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
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

<div class="container">

<h2>방명록 작성</h2>

<form name="frm" method="post" action="./createProc.jsp" 
onsubmit="return incheck(this)">
<table align="center">
<tr>
<th>이름</th>
<td align="left">
<input type="text" name="wname" size="60" placeholder="이름을 입력하세요">
</td>
</tr>


<tr>
<th>내용</th>
<td align="left">
<textarea rows="10" cols="60" name="content" placeholder="내용을 입력하세요"></textarea>
</td>
</tr>

<tr>
<th>패스워드</th>
<td align="left">
<input type="password" name="passwd" size="40" placeholder="패스워드를 입력하세요">
</td>
</tr>

</table>

<div>
<input type="submit" value="전송">
</div>
</form>

</div>

<jsp:include page="/menu/footer.jsp"/>
</body> 
</html> 
