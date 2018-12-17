<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>

<%  
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total"))word=""; //워드를 빈값으로 할당

	//paging관련
	int nowPage = 1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null)nowPage=Integer.parseInt(request.getParameter("nowPage"));
	
	//DB에서 가져올 순번 생성
	int sno = ((nowPage-1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<MemoDTO> list = dao.list(map);	
	int totalRecord = dao.total(map);
	
	
	
%>

<!DOCTYPE html> 
<html>  
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(memono){
	// alert(memono);
	var url="./read.jsp";
	url  =  url+"?memono="+memono;
	url = url + "&col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function mdelete(memono){
	var url = "deleteForm.jsp";
	url += "?memono="+ memono;
	url = url + "&col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function mreply(memono){
	var url="replyForm.jsp";
	url += "?memono="+memono;
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	url = url + "&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function mupdate(memono){
var url = "updateForm.jsp";
url += "?memono="+memono;
url = url + "&col=<%=col%>";
url = url + "&word=<%=word%>";
url = url + "&nowPage=<%=nowPage%>";
location.href=url;
}
</script>
<style type="text/css"> 
</style> 
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	

<h2>방명록 작성</h2>

<form name="frm" method="post" action="./createProc.jsp" onsubmit="return incheck(this)">
<table>
<tr>
<th>이름</th>
<td>
<input type="text" name="wname" size="40" placeholder="이름을 입력하세요">
</td>
</tr>


<tr>
<th>내용</th>
<td align="left">
<textarea rows="5" cols="40" name="content" placeholder="내용을 입력하세요"></textarea>
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
<input type="submit" value="방명록 작성">
</div>
</form>
<hr>

<h2>방명록</h2>

<div class="search">
<form method="post" action="./list.jsp">
<select name="col">
	<option value="wname"<% if(col.equals("wname")) out.print("selected"); %>>이름</option>
	<option value="content"<% if(col.equals("content")) out.print("selected"); %>>내용</option>
	<option value="total">전체출력</option>
</select>
<input type="text" name="word"  value="<%=word %>">
<button>검색</button>
<button type="button" onclick="location.href='./createForm.jsp'">방명록 작성</button>
</form>

</div>

<div class="container">

	<table class="w3-table w3-striped w3-bordered">		
		<%
			if (list.size()==0) {
		%>
		<thead>
		<tr>
		<th style="text-align:center" colspan="7"><br><br><br><br>
		등록된 글이 없습니다.<br><br><br><br><br></th>
		</tr>
		</thead>
		<%}else{ 
		  for(int i=0;i<list.size();i++){
			MemoDTO dto = list.get(i);
		%>
		<thead>
		<tr>
			<td colspan="2" width="75%">
			
			<b>글쓴이 : </b>
			
			<%=dto.getWname()%>
			<input type="button" value='답변' onclick="javascript:mreply('<%=dto.getMemono()%>')">
			<input type="button" value='수정' onclick="javascript:mupdate('<%=dto.getMemono()%>')">
			<input type="button" value='삭제' onclick="javascript:mdelete('<%=dto.getMemono()%>')"></td>
			<%-- <td><div style="text-align:left"></div>
	<%
		for(int r=0;r<dto.getIndent();r++){
			out.print("&nbsp;&nbsp;");
		}
		if(dto.getIndent()>0){
			out.print("<img src='../images/re.jpg'>");
		}
	%>
	
		<%=dto.getWname() %></td> --%>
		
	<td width="25%"><%=dto.getWdate()%></td>
</tr>


<tr>
	<td width="5%"></td>
	<td width="95%" height='120px' colspan='2'>
		<%
 		dto = dao.read(dto.getMemono());
		String content = dto.getContent();
 		content = content.replaceAll("\r\n","<br>");
		%>
		<%=content  %>
		 </td>	
	
</tr>
</thead>
	<%  	} //for-end
 		} //if-end
%>
</table>



</div>

<div class="bottom">
<%= Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %><br><br>
</div>

<jsp:include page="/menu/footer.jsp"/>
</body> 
</html> 
