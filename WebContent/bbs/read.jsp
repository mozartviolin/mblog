<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
 
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	bdao.upViewcnt(bbsno);
	BbsDTO dto = bdao.read(bbsno);	
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n","<br>");
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<!-- bootstrap -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap -->

<style type="text/css">
table{
	padding: 0px;
	margin: 0 4px;
}
table > tr,th,td{
	padding:10px;
}
</style>
<script type="text/javascript">
function filedown(filename){
	var url = "<%=root%>/download";
	url = url + "?filename=" + filename;
	url = url + "&dir=/bbs/storage";
	
	location.href = url;
}
function blist(){
	var url = "list.jsp";
		url = url + "?col=<%=request.getParameter("col")%>";
		url = url + "&word=<%=request.getParameter("word")%>";
		url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
}
function mdelete(){
	var url = "deleteForm.jsp";
		url = url + "?bbsno=<%=bbsno%>";
		url = url + "&oldfile=<%=dto.getFilename()%>";
		url = url + "&col=<%=request.getParameter("col")%>";
		url = url + "&word=<%=request.getParameter("word")%>";
		url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
}
function mupdate(){
	var url = "updateForm.jsp";
		url = url + "?bbsno=<%=bbsno%>";
		url = url + "&col=<%=request.getParameter("col")%>";
		url = url + "&word=<%=request.getParameter("word")%>";
		url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
}
function mcreate(){
	var url = "createForm.jsp";
		url = url + "?bbsno=<%=bbsno%>";
		
		location.href=url;
}
function mreply(){
	var url="replyForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	
	location.href=url;
	
}
function filedown(filename){
	var url = "<%=root%>/download";
	url = url + "?filename=" + filename;
	url = url + "&dir=/bbs/storage";
	
	location.href = url;
}


</script>

</head> 
<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
 
<h2>조회</h2>
 
  <table class="table table-condensed" style="width:475px;">
        <tr style="width:475px;">
          <th>글쓴이</th>
          <td colspan="5"><%=dto.getWname() %></td>
          <th>조회수</th>
          <td ><%=dto.getViewcnt() %></td>
        </tr>
        <tr>
          <th>아이피</th>
          <td colspan="5">12.22.33.44</td>
          <th>날짜</th>
          <td><%=dto.getWdate() %></td>
        </tr>
        <tr>
          <th>제목</th>
          <td colspan="7"><%=dto.getTitle() %></td>
        </tr>
        <tr>
         <th colspan="8">내용</th>        
        </tr>
        
        <tr height="400" valign="top">
          <td colspan="8" width='480'><%=content %></td>
        </tr>
        <tr>
          <th colspan="2">다운로드</th>
          <td colspan="6">
            <!-- 파일 다운로드 기능 --><%
      	  if(dto.getFilename()!=null){     
        
    	  out.print(dto.getFilename());
    	  out.print("("+ dto.getFilesize()+")"); %>
    	  <a href="javascript:filedown('<%=dto.getFilename() %>')">
          <span class="glyphicon glyphicon-download-alt"></span> Download
        </a>
       	 <%
     	 }else{
    	 	 out.print("파일없음");
      	}
		 %>
            <a href="">${article.fileName}</a>
            <%-- <a href="/bbs/download.bbs?fileName=${article.fileName}">${article.fileName}</a> --%>
          </td>
        </tr>
        <tr>
          <th colspan='8'>파일미리보기</th>
         </tr>
         <tr>
          <td colspan="8">
            <img src="./storage/<%=dto.getFilename()%>"	style="max-width:400px;max-height:auto;"><br>
    	<%
     		 if(dto.getFilename()!=null){ 
       	 %>
    	  <a href="javascript:filedown('<%=dto.getFilename() %>')"></a>
        <%
      		}else{
    	  	out.print("파일없음");
      		}
		%>
          </td>
        </tr>
        <tr>
          <td colspan="8" align="right">
            <!-- 로그인 검증 -->
            <%-- <c:if test="${id != null}">
              <input type="submit" value="답글달기">
              <c:if test="${id == article.id}">
                <input type="button" value="수정하기" onclick="document.location.href='/bbs/updateForm.bbs?articleNum=${article.articleNumber}&pageNum=${pageNum}'">
                <input type="button" value="삭제하기" onclick="document.location.href='/bbs/delete.bbs?articleNum=${article.articleNumber}&pageNum=${pageNum}'">
              </c:if>
              <c:if test="${id != article.id}">
                <input type="button" value="수정하기" disabled="disabled">
                <input type="button" value="삭제하기" disabled="disabled">
              </c:if>
            </c:if>
            <c:if test="${id == null}">
              <input type="submit" value="답글달기" disabled="disabled">
              <input type="button" value="수정하기" disabled="disabled">
              <input type="button" value="삭제하기" disabled="disabled">
            </c:if> --%>
            
            <input type='button' value='목록' onclick="blist()">
    		<input type='button' value='수정' onclick="mupdate()">
    		<input type='button' value='삭제' onclick="mdelete()">
    		<input type='button' value='답변' onclick="mreply()">&nbsp;&nbsp;&nbsp;
    		<input type='button' value='새글쓰기' onclick="mcreate()">
          </td>
        </tr>
         
        <!-- Model 1 방식, 스트립트릿과 식을 이용한 방법 -->
        <!-- 상단부에 BBSDto import 필요 -->
        <%-- <%BBSDto article = (BBSDto)request.getAttribute("article"); %>
        <tr>
          <td>글쓴이 : </td>
          <td><%=article.getId() %></td>
        </tr>
        <tr>
          <td>제목 : </td>
          <td>
            <%=article.getTitle() %>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <%=article.getContent() %>
          </td>
        </tr>
        <tr>
          <td>첨부 : </td>
          <td>
            <%if(article.getFileName() != null && !article.getFileName().equals("")) { %>
              <%=article.getFileName() %>
            <%} else { %>
              <span>없음</span>
            <%} %>
          </td>
        </tr> --%>
      </table> 
 

<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html> 