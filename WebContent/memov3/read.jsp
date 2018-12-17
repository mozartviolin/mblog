<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="../ssi/ssi.jsp" %>

<jsp:useBean id="dao" class="memo.MemoDAO"/>

<%  request.setCharacterEncoding("utf-8"); 
int memono = Integer.parseInt(request.getParameter("memono"));


//조회수 증가
dao.updateViewcnt(memono);

// 조회수 증가 끝

	// 조회
	MemoDTO dto = dao.read(memono);
	String content = dto.getContent();
	content = content.replaceAll("\r\n","<br>");

%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mcreate(){
var url = "createForm.jsp";
location.href=url;
}
function mupdate(memono){
var url = "updateForm.jsp";
url += "?memono="+memono;
url = url + "&col=<%=request.getParameter("col")%>";
url = url + "&word=<%=request.getParameter("word")%>";
url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
location.href=url;
}
function mdelete(memono){
var url = "deleteForm.jsp";
url += "?memono="+memono;
url = url + "&col=<%=request.getParameter("col")%>";
url = url + "&word=<%=request.getParameter("word")%>";
url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
location.href=url;
}
function mlist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";

	location.href=url;
}
function mreply(){
	var url="replyForm.jsp";
	url += "?memono=<%=memono%>";
	
	location.href=url;
}
</script> 

</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>

<h2><br>조회</h2>

<div class="content">
<table align='center'>
<tr>
<th>제목</th>
<td><%=dto.getTitle() %></td>
</tr>

<tr>
<th>내용</th>
<td><%=content %></td>
</tr>

<tr>
<th>조회수</th>
<td><%=dto.getViewcnt() %></td>
</tr>
<tr>
<th>등록일</th>
<td><%=dto.getWdate() %></td>
</tr>

</table>

</div>

<div class="bin"><br></div>

<div>
<input type="button" value="등록" onclick="mcreate()">
<input type="button" value="수정" 
		onclick="mupdate('<%=dto.getMemono()%>')">
<input type="button" value="삭제" 
		onclick="mdelete('<%=dto.getMemono()%>')">
<button onclick="mreply()">답변</button>
<input type="button" value="목록" onclick="mlist()">

</div>
<jsp:include page="/menu/footer.jsp"/>
</body> 
</html> 
