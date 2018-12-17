<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 

<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>

<%
// 검색 관련
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));
if(col.equals("total")){
	word="";
}

// 페이징관련
int nowPage = 1;
int recordPerPage = 5;
if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

//DB에서 가져올 번호 계산
int sno = ((nowPage-1)*recordPerPage)+1;
int eno = nowPage * recordPerPage;

Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);

List<MemberDTO> list = dao.list(map);
int totalRecord = dao.total(map);

String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
body{ 
  font-family: gulim; 
  font-size: 20px; 
} 
.search{
	text-align:center;
	margin: 15px auto;
}
</style>
<script type="text/javascript">
function read(id){
	var url = "<%=root%>/member/read.jsp";
	url += "?id=" + id;
	
	location.href = url;	
}
</script> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/header.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"><br><br>회원목록</DIV>
<FORM name='frm' method='POST' action='./list.jsp'>
<div class="search">
<select name="col">
<option value="mname" 
<%if(col.equals("mname")) out.print("selected"); %>
>성명</option>
<option value="email"
<%if(col.equals("email")) out.print("selected"); %>
>이메일</option>
<option value="id"
<%if(col.equals("id")) out.print("selected"); %>
>아이디</option>
<option value="total">전체출력</option>
</select>
<input type="text" name="word" value='<%=word %>'>
<input type="submit" value="검색">
<input type="button" value="회원가입" 
	onclick="location.href='<%=root%>/member/agreement.jsp'">
</DIV>


</FORM>
 
<div class="container">
<h2 align="left"><span class="glyphicon glyphicon-th-list"></span>
회원목록
</h2>
<%
for(int i=0;i<list.size();i++){
	dto= list.get(i);
%>
<table class="table table-hover">
<tr>
<td rowspan="5" 
style="width:37%"><a href="javascript:read('<%=dto.getId()%>')" >
<img src='../member/storage/<%=dto.getFname()%>' width=250 height=250></a></td>
<th style="width:15%">아이디</th>
<td style="width:48%">
<a href="javascript:read('<%=dto.getId()%>')" ><%= dto.getId() %>
</a>
</td>
</tr>
<tr>
<th>성명</th>
<td><a href="javascript:read('<%=dto.getId()%>')" ><%= dto.getMname() %>
</a></td></tr>
<tr>
<th>전화번호</th>
<td><%= dto.getTel() %></td>
</tr>
<tr>
<th>이메일</th>
<td><%= dto.getEmail() %></td>
</tr>
<tr>
<th>주소</th>
<td><%= dto.getAddress1() %><br>
<%= Utility.checkNull(dto.getAddress2()) %></td>
</tr>
</table>
<br>

<%
}
%>
</div>
 
<div class="bottom"> <%=paging %> </div>

</div>
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 