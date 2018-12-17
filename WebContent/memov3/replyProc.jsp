<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="../ssi/ssi.jsp"	 %>

<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
	MemoDAO dao = new MemoDAO();

	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	dao.upAnsnum(map);
	
	boolean flag = bbdao.replyCreate(dto);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<script type="text/javascript">
function btlist(){
	var url = "list.jsp";
	location.href=url;
}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>
 
<h2>처리 결과</h2>
 
<div class="content">
<%
	if(flag){
		out.print("답변 메모가 등록되었습니다.");
	} else{
		out.print("답변 메모 등록에 실패했습니다.");
	}
%>

</div>
 
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="btlist()">
    <input type='button' value='새글쓰기' onclick="location.href='createForm.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 