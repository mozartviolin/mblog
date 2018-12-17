<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:setProperty name="dto" property="*"/>

<% 
	Map map = new HashMap();
	map.put("memono", dto.getMemono());
	map.put("passwd", dto.getPasswd());

	boolean pflag = dao.passCheck(map);

	boolean flag =dao.update(dto);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
div{
	text-align:center;
	margin-top: 100px;
}
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
<body> 
<jsp:include page="/menu/header.jsp"/>
<div>
<%
if(flag){
	out.print("메모를 수정했어");
}else{
	out.print("메모 수정 실패야");
}
%>
<br>
<input type="button" value="목록" onclick="mlist()">
</div>
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body> 
</html> 
