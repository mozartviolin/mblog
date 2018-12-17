<%@ page contentType="text/html; charset=UTF-8" %>  
<%@ include file="../ssi/ssi.jsp" %> 
 
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.replyRead(bbsno);

%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 

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
	if(f.content.value==""){
		alert("내용을 입력하세요.");
		f.content.focus();
		return false;  
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		f.passwd.focus();
		return false; 
	}
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>답변</h2>
 
<FORM name='frm' method='POST' action='./replyProc.jsp' 
enctype="multipart/form-data" onsubmit="return incheck(this)">
<!-- 답변있는 부모글의 삭제를 못하게 하기 위해서 -->
 <input type="hidden" name="bbsno" value="<%=dto.getBbsno() %>">
<!-- 답변에 필요한 부모자료들 -->
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">


  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="[답변] <%=dto.getTitle()%>"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
      <textarea rows="10" cols="40" name="content"></textarea>
      </TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='게시글 등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 