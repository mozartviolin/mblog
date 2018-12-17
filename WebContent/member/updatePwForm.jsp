<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %> 
 
<jsp:useBean id="dao" class="member.MemberDAO"/> 
<jsp:useBean id="dto" class="member.MemberDTO"/> 
 
<%
	String id= request.getParameter("id");
	
 	String oldpasswd = dto.getPasswd() ;		
	Map map = new HashMap();
	map.put("id",id);
	map.put("oldpasswd",oldpasswd);
	
	boolean dflag = dao.checPwup(map);
	
	dto = dao.read(id);	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style>
<script type="text/javascript">
function inputCheck(f){

	
	if(f.oldpasswd.value==""){
		alert("현재 패스워드를 입력해 주세요");
		return false;
	} 
	if(f.passwd.value==""){
		alert("새로운 패스워드를 입력해 주세요");
		return false;
		}
	if(f.repasswd.value==""){
		alert("새로운 패스워드 재확인을 입력하세요");
		return false;
		}
	if(f.passwd.value!=f.repasswd.value){
		alert("새로운 패스워드들이 일치하지 않습니다. 다시 입력해 주세요");
		return false;
	}
	if(f.passwd.value==f.oldpasswd.value){
		alert("이전 패스워드와 일치합니다. 다른 패스워드를 사용하세요.");
		return false;
	}	
	if(!dflag){
		alert("기존거랑 다른 패스워드임");
		return false;
	}
	 
}

	
</script>
 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/header.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">패스워드 변경</DIV>
 
<FORM name='frm' method='POST' 
		action='./updatePwProc.jsp'
		onsubmit='return inputCheck(this)'>
<input type="hidden" name="id" value="<%=id %>">
<TABLE>
      <TR>
      <TH>현재 패스워드</TH>
      <TD><input type="text" name="oldpasswd" value='<%=dto.getPasswd()%>'></TD>
    </TR>
</TABLE>
<br>
  <TABLE>
      <TR>
      <TH>새로운 패스워드</TH>
      <TD><input type="text" name="passwd"></TD>
    </TR>
    <TR>
      <TH>새로운 패스워드 확인</TH>
      <TD><input type="text" name="repasswd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
   
    <input type="submit" value="패스워드 수정">
    <input type='button' value='취소' 
    onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 