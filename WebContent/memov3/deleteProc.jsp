<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:useBean id="dto" class="memo.MemoDTO"/>

<% 

int memono = Integer.parseInt(request.getParameter("memono")); 
Map map = new HashMap();
map.put("memono", dto.getMemono());
map.put("passwd", dto.getPasswd());
boolean pflag = dao.passCheck(map);
boolean flag = dao.delete(memono);

%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<script type="text/javascript">
function mlist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";

	location.href=url;
}
</script>
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>
<input type="hidden" name="memono" value="<%=memono %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>"> 
<input type="hidden" name="word" value="<%=request.getParameter("word")%>"> 
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>"> 

<div class="title">방명록 삭제 확인</div>

<div class="content">
<%
if(flag){
	out.print("방명록을 삭제햇습니다.");
}else{
	out.print("방명록 삭제에 실패하였습니다.");
}

%>
<br>
</div>

<div id="bin"><br></div>

<div class="bottom">
<input type="button" value="목록" onclick="mlist()">
</div>
<jsp:include page="/menu/footer.jsp"/>
</body> 
</html> 
