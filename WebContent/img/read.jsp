<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="img.imgDAO" />
<%
	request.setCharacterEncoding("utf-8");

	int no = Integer.parseInt(request.getParameter("no"));
	
	dao.viewcnt(no); //조회수 올리기
	imgDTO dto = dao.read(no);

%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.subtitle{
	text-align:center;
	margin: 10px auto;
	font-size: 20px;
	font-family:Fantasy; 
}
.curImg {
	margin-right: 0;
	border-style: solid;
	border-width: 3px;
	border-color: red;
}

.td_padding {
	padding: 5px 5px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function read(no) {
		var url = "./read.jsp";
		url = url + "?no=" + no;

		location.href = url;
	}
	function iupdate(){
		var url = "updateForm.jsp";
		url = url + "?no=<%=dto.getNo()%>";
		url = url + "&oldfile=<%=dto.getImg()%>";
		
		location.href = url;
	}
	function ireply(){
		var url = "replyForm.jsp";
		url = url + "?no=<%=dto.getNo()%>";
		
		location.href = url;
		
	}
	function del(){
		var url = "deleteForm.jsp";
		url = url + "?no=<%=dto.getNo()%>";
		
		location.href = url;
		
	}
</script>
</head>
<!-- *********************************************** -->
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	

	<h2>사진 조회<br></h2>
	
	<hr>
	<div class="subtitle">
	<p style="font-size:20px"><b><%=dto.getTitle()%></b></p>
	</div>

	<TABLE class="table table-striped"  style="width: 60%" align="center">
		<TR>
			<TD colspan="2" style="text-align:center;"><img src="./storage/<%=dto.getImg()%>"
				style="width:475px;height:auto;"></TD>
		</TR>
		<TR>
			<TH>제목</TH>
			<TD><%=dto.getTitle()%></TD>
		</TR>
		<TR>
			<TH>작성자</TH>
			<TD><%=dto.getName()%></TD>
		</TR>
	</TABLE>
	<TABLE  class="table table-striped" style="width: 50%" align="center">
		<TR>
			<%
				List list = dao.imgRead(no);
				int[] noArr = (int[]) list.get(0);
				String[] files = (String[]) list.get(1);
				for (int i = 0; i < 5; i++) {
					if (files[i] == null) {
			%>
			<td class="td_padding"><img src="./storage/default.jpg"
				width="95px">
			<td>
				<%
					} else {
							if (noArr[i] == no) {
				%>
			
			<td class="td_padding"><a
				href="javascript:read('<%=noArr[i]%>')"> <img class="curImg"
					src="./storage/<%=files[i]%>" width="95px" border="0">
			</a></td>
			<%
				} else {
			%>
			<td class="td_padding"><a
				href="javascript:read('<%=noArr[i]%>')"> <img
					src="./storage/<%=files[i]%>" width="95px" border="0">
			</a></td>

			<%
				}
					}
				}
			%>
		</TR>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='등록' onclick="location.href='createForm.jsp'"> 
		<input type='button' value='목록' onclick="location.href='list.jsp'"> 
		<input type='button' value='수정' onclick="iupdate()"> 
		<input type='button' value='삭제' onclick="del()"> 
		<input type='button' value='답변' onclick="ireply()">
	</DIV>



<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>

