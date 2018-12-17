<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
 <% 
	root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
%> 
<!DOCTYPE html>
<html>
<title>Temple of Universe</title>
<meta charset="UTF-8">
<meta name="description" content="Art of Meditation">
<meta name="keywords" content="Temple of the Universe, Meditation, Yoga">
<link href="<%=root %>/css/style.css" rel="stylesheet" type="text/css" />

<style type="text/css">
body,td,th {
	font-family: "맑은 고딕", Arial, Helvetica, sans-serif;
}
/* <!--
.style4 {color: #000000; }
.style14 {color: #623100}
.style27 {
	font-size: 16px;
	font-weight: bold;
	color: #CC3300;
}
.style28 {
	color: #FFFF00;
	font-weight: bold;
}
.style29 {color: #532900}
--> */
</style>
</head>

<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	 	
  

  
    <img src="images/temple-ext.jpg" width="400px" alt="Temple entrance" />
    
    <p>The Temple of the Universe&nbsp;is a nonprofit organization founded in 1975 by Mickey Singer. The Temple is a  long-established yoga and meditation center where people of any religion or set  of beliefs can come together to experience inner peace.</p>
    <p>The Temple is located on approximately 600 acres of beautiful land outside of Gainesville, Florida.</p> 
    <p>Religious services, classes on spiritual growth, and daily meditation are offered. Hatha Yoga classes are held four times a week. See our <a href="schedule.html">Schedule page</a> for more information. To learn more about the Temple of the Universe see our <a href="missionstatement.html">Mission Statement</a>.</p>
    <p>Everyone is welcome to attend the scheduled programs and classes.</p>



 


<jsp:include page="/menu/footer.jsp"/>
</body>
</html>

