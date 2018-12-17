<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ page import="java.util.*" %>
<%@ page import="bbs.*" %>
<%@ page import="memo.*" %>
<%@ page import="img.*" %>
<%@ page import="utility.*" %>
<%@ page import="member.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String root = request.getContextPath();
%>
<jsp:useBean id="bdao" class="bbs.BbsDAO"/>
<jsp:useBean id="bbdao" class="memo.MemoDAO"/>

