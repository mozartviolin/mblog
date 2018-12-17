<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>

<% 	
int memono = Integer.parseInt(request.getParameter("memono")); 
boolean flag = dao.checkRefnum(memono);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<script type="text/javascript">
function blist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
	
}
</script>
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	 
	
<h2>삭제</h2>
	
<% if(flag){ %>
 <div class="content">
 답변 글이 존재하기 때문에 삭제할 수 없습니다.
 <br> <br> 
  </div>
  <DIV class='bottom'>
     <input type='button' value='삭제취소' onclick="history.back()">
    <input type='button' value='게시판돌아가기' onclick="blist()">
  </DIV>

<%}else{ %>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp' 
		onsubmit="return incheck(this)">
<input type="hidden" name="memono" value="<%= memono %>"> 
<input type="hidden" name="col" value="<%=request.getParameter("col") %>"> 
<input type="hidden" name="word" value="<%=request.getParameter("word")%>"> 
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>"> 
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile") %>"> 

<div class="content">
삭제하면 복구할 수 없습니다.
<br> <br> 
패스워드를 입력하세요.
<br><br>
패스워드 : <input type="password" name="passwd">
<br><br>

 </div>
 
  <DIV class='bottom'>
  	<button type="submit">삭제하기</button>
    <input type='button' value='삭제 취소' onclick="history.back()">
    <input type='button' value='목록으로 돌아가기' onclick="blist()">
  </DIV>
 </FORM>

 
 <%} %>
<jsp:include page="/menu/footer.jsp"/>
</body> 
</html> 
