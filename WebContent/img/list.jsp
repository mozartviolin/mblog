<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 

<jsp:useBean id="dao" class="img.imgDAO"/>
 
<%  	
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")) word="";
	int nowPage= 1;
	int recordPerPage = 5;	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int sno = ((nowPage-1)*recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	List<imgDTO> list = dao.list(map);
	int totalRecord = dao.total(map); 
	
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
body{ 
  font-family: Gulim; 
  font-size: 15px;
} 
.search{
	width:80%;
	text-align:center;
	margin: 10px auto;
}
.title{
	text-align:center;
	margin: 10px auto;
	font-size: 40px;
	font-family:Fantasy; 
	font:bold;
}
</style> 
<script type="text/javascript">
function read(no){
	var url = "read.jsp";
	url += "?no=" + no;
	
	location.href = url;
}
function del(no){
	var url ="deleteForm.jsp";
	url += "?no=" + no;
	
	location.href = url;
}

</script> 


<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
	
<h2>Images</h2>

<div id="imgintrod">
<p>이미지 게시판입니다.</p>
</div>

<div class="container">

  <TABLE class="table table-striped">
    <thead>
    <TR>
      <TH>글번호</TH>
      <TH>이미지제목</TH>
      <TH>글쓴이</TH>
      <TH>등록일</TH>
      <TH>조회수</TH>
    </TR>
    </thead>
<%
if(list.size()==0){
	
%>
<tbody>
<tr>
<td style="text-align:center" colspan="8"><br><br><br><br>
등록된 사진이 없습니다.<br><br><br><br><br></td>
</tr>
</tbody>
<%
	}else{
	for(int i=0;i<list.size();i++){
		imgDTO dto = list.get(i);
%>
	<tbody>
    <TR>
      <TD><br><br><%=dto.getNo() %></TD>
      <TD><%
      for(int r=0;r<dto.getIndent();r++){
    	  out.print("&nbsp;");  // &nbsp; 한칸
      }
      if(dto.getIndent()>0){
    	  out.print("<img src='../images/re.jpg'>"); 
      } 
      %><a href="javascript:read('<%=dto.getNo() %>')">
      <img src="./storage/<%=dto.getImg() %>" style="width:150px;height:150px;">
      <%=dto.getTitle() %></a>      
      </TD>
      
      <TD><br><br><%=dto.getName() %></TD>
      <TD><br><br><%=dto.getMdate() %></TD>
      <TD><br><br><%=dto.getViewcnt() %></TD>
    </TR>
    </tbody>
<%
	}
}
%>
   </TABLE>
   

  
  <DIV style="text-align:center" class='bottom' >
  	<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
    
  </DIV>
  
<div class="search" style='text-align:center'>
<form method="post" action="./list.jsp">
<select name="col" >
<option value="name"
<%if(col.equals("name")) out.print("selected"); %>
>성명</option>
<option value="title"
<%if(col.equals("title")) out.print("selected"); %>
>이미지제목</option>
<option value="total">전체출력</option>
</select>
<!-- 입력값 -->
<input type="text" name="word" value="<%=word %>">
<button>검색</button>
<button type="button" onclick="location.href='createForm.jsp'" 
style="margin:15px auto;">
사진올리기</button>
</form>
</div>

</div> 
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>

</html> 