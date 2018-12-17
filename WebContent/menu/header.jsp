<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>    
<% 
	root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Temple of Universe</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

 <link href="<%=root %>/css/style.css" rel="stylesheet" type="text/css" /> 


<script type="text/javascript">
function readinfo(){
	var url = "./member/read.jsp";
	url += "?id=<%=id%>";
	
	location.href = url;
	
}
</script>
</head>
<body>

<body class="mainbody">

  <div id="header1">
   
  <div class="w3-top">
  <div class="w3-bar w3-green" >
  
    <a href="<%=root %>/index.jsp" class="w3-bar-item w3-button">홈</a>
    <a href="<%=root %>/bbs/list.jsp" class="w3-bar-item w3-button">게시판</a>
    <a href="<%=root %>/img/list.jsp" class="w3-bar-item w3-button">이미지</a>
    <a href="#" class="w3-bar-item w3-button">책소개</a>
    <a href="<%=root %>/memov3/list.jsp?col=&word=&nowPage=1" class="w3-bar-item w3-button">방명록</a>
    <a href="#" class="w3-bar-item w3-button">CONTACT</a>
    <%if(id==null){ %>
    <a href="<%=root %>/member/loginForm.jsp" class="w3-bar-item w3-button">로그인</a>
    <a href="<%=root %>/member/agreement.jsp" class="w3-bar-item w3-button">회원가입</a>
    <% }else{ %>
    <a href="<%=root %>/member/logout.jsp" class="w3-bar-item w3-button">로그아웃</a>
    <a href="javascript:readinfo('<%=id%>')" class="w3-bar-item w3-button">MyInfo</a>
    <%} %>
    <a href="#" class="w3-bar-item w3-button">미정</a>
    
    
  </div>
</div>    
  
  <!-- end #header -->
  </div>

<div id="container">

 <div id="header2"> 
  <!-- end #header -->
  </div>    
  
  <div id="conSide">   
 	<%if(id==null){ %>
 	<div id="sidebar1">    
    	<div align="center">Temple of Universe
    	</div>
    <% }else{ %>
  	<div id="sidebar1">    
    	<div align="center"><%=id %> 님 로그인 상태<br>
    	id: <%=id %><br>
    	grade: <%=grade %>
    	</div>
    <%} %>
	<div id="sidemenu">
  		<ul>
  			<li><a href="<%=root %>/index.jsp">홈</a></li>
  			<li><a href="<%=root %>/bbs/list.jsp">게시판</a></li>
  			<li><a href="#">책소개</a></li>
  			<li><a href="<%=root %>/img/list.jsp">이미지</a></li>
  			<li><a href="<%=root %>/memov3/list.jsp?col=&word=&nowPage=1">방명록</a></li>
  			<li><a href="#">CONTACT</a></li>
  			<% if(id==null){ %>
  			<li><a href="<%=root %>/member/loginForm.jsp">로그인</a></li>
  			<li><a href="<%=root %>/member/agreement.jsp">회원가입</a></li>
  			<% }else{ %>
  			<li><a href="<%=root %>/member/logout.jsp">로그아웃</a></li>
  			<li><a href="javascript:readinfo('<%=id%>')">MyInfo</a></li>
  			<%} %>
  		</ul>
  	</div>
  	
	<div align="center">
	
    <br>
    
	</div>
<p class="style4"></p>
    </p>
    <!-- end #sidebar1 -->
	</div>    

 	<div id="mainContent">


</body>
</html>