<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>새글쓰기</title> 



<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>

<!-- bootstrap -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap -->

<style type="text/css"> 
.img_wrap{
	width:300px;
	margin-top:50px;
}
.img_wrap img{
	max-width:100%;
}
</style> 
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


<script type="text/javascript" src="./js/jquery-3.1.0.min.js" charset="utf-8">
</script>
</head> 
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
<h2>새글쓰기</h2>

<div class="container">
 
<FORM name='frm' method='POST' action='./createProc.jsp'
		enctype="multipart/form-data" 
	  onsubmit="return incheck(this)">
  <TABLE class="table table-condensed" style="max-width:475px">
    <TR style="max-width:475px">
      <TH>성명</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" size="50" name="title"></TD>
    </TR>
    <TR>
      <TH colspan='2' style="text-align:center;">내용</TH>      
    </TR>
    <TR>      
      <TD colspan='2'>
      <textarea rows="10" cols="45" name="content"></textarea>
      </TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>
    
        
  </TABLE>
   
  <DIV class='bottom'>
    <input type='submit' value='게시글 등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
</div>
 
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 