<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file = "../ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.read(bbsno);
	
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
.search{
	width:80%;
	text-align:center;
	margin: 10px auto;
}
</style> 

<!-- bootstrap -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap -->

<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>

<script type="text/javascript">
function incheck(f){
	if(f.wname.value==""){
		alert("성명을 입력하세요.");
		f.wname.focus();
		return false;  // ==> submit 안되게끔 하려고
	}
	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false; 
	}
	if (CKEDITOR.instances['content'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['content'].focus();
	      return false;
	    }
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		f.passwd.focus();
		return false; 
	}
}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 

<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>게시글 수정</h2>
 
<FORM name='frm' method='POST' action='./updateProc.jsp' 
		enctype="multipart/form-data" 
	  onsubmit="return incheck(this)">
<input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>"> 
<input type="hidden" name="col" value="<%=request.getParameter("col")%>"> 
<input type="hidden" name="word" value="<%=request.getParameter("word")%>"> 
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>"> 
<input type="hidden" name="oldfile" value="<%=dto.getFilename() %>"> 
  <TABLE  class="table table-condensed">
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname" value="<%=dto.getWname()%>"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle()%>"></TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>      
      <TD colspan='2'>
      <textarea rows="10" cols="45" name="content"><%=dto.getContent() %></textarea>
      </TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 