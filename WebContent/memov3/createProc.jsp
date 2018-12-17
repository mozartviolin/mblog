<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../ssi/ssi.jsp" %>

<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:useBean id="dto" class="memo.MemoDTO"/>

<jsp:setProperty name="dto" property="*" />
<%
boolean flag = dao.create(dto);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	 

<h2>작성 확인</h2>

<div class="content">
<br>
<br>
<%
	if(flag){
		out.print("방명록 작성을 완료했습니다.");
	}else out.print("방명록 작성에 실패하였습니다.");
%>
<br><br><br>
<input type="button" value="새 방명록 작성"
onclick="location.href='./createForm.jsp'">
<input type="button" value="방명록페이지 가기"
onclick="location.href='./list.jsp'">
</div>
<div>
<br>
</div>
<jsp:include page="/menu/footer.jsp"/>
</body> 
</html> 
