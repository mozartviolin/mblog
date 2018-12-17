<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
    <%@ include file="../ssi/ssi.jsp" %>
<%  root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body class="mainbody">
<div id="sidebar1">    
    <div align="center"><br>
    </div>
    


<div id="sidemenu">
  		<ul>
  			<li><a href="<%=root %>/index.jsp">홈</a></li>
  			<li><a href="<%=root %>/bbs/list.jsp">게시판</a></li>
  			<li><a href="#">책소개</a></li>
  			<li><a href="<%=root %>/img/list.jsp">이미지</a></li>
  			<li><a href="<%=root %>/memov3/list.jsp?col=&word=&nowPage=1">방명록</a></li>
  			<li><a href="#">CONTACT</a></li>
  		</ul>
  	</div>
  	
<div align="center">  <span class="style28">새로운 오디오 강의 세트</span><span class="style29"> <br>
    <br>
    <a href="https://store.tou.org/" target="_blank"><img src="images/horse-cd-label11.jpg"></a><br>
      The Untethered Soul Lecture Series - <strong>Volume 11: The Unlimited Energy of the Self</strong>. From Michael A. Singer, author of the <em>New York Times</em> bestsellers <em>상처받지 않는 영혼</em> and <em>될 일은 된다</em>. <br>
      <a href="https://store.tou.org/" target="_blank">Visit our online store</a>      <br>
      <br>
<!--       </span><span class="style28">새로운 온라인 비디오 코스</span><span class="style29"><br> -->
    <!--   Register for Michael A. Singer’s first full-length online course: <strong>Living From a Place of Surrender - The Untethered Soul in Action.</strong> Go deeper with eight sessions of powerful teachings. <br>
      <strong>Early Bird Discount</strong>. <a href="http://tou.org/surrender-course" target="_blank">Learn More</a><br>
      <br>
      <a href="http://tou.org/surrender-course" target="_blank"><img src="images/Michael_A_Singer-onlinecourse.jpg" width="240" height="140"></a><br>
      </p>
      </span>
  <p><span class="style29">Watch a Free 3-Part Video Series with Michael A. Singer titled:
    
    <strong>The Mind Can Be a Dangerous Place or a Great Gift</strong>. <a href="http://tou.org/free-course" target="_blank">Learn more</a>
    <br>
    <br>
    <span class="style27">상처받지 않는 영혼 <br>
    ON &quot;THE VIEW&quot;</span><br><span class="style29">Sara Haines chose <em>The Untethered Soul</em> as one of her favorite summer books on The View! <br>
    <a href="https://www.youtube.com/watch?v=nLRrkO9Virs" target="_blank">Watch the video</a><br>
    <a href="http://www.amazon.com/The-Untethered-Soul-Journey-Yourself/dp/1572245379/?tag=touorg-20" target="_blank"><img src="images/books-by-michael-singer.jpg" alt="UTSbook" border="0"></a><br>
     <br>
    Click to learn more about books and lectures available via our website. <a href="books-lectures.html">Order Books and CDs</a> </span></p>
  <span class="style29"><br>
      <br>
&quot;Oprah and Michael Singer: The Untethered Soul&quot; </span><span class="style14"><br>
      on the Emmy® Award-winning series <strong>&quot;Super Soul Sunday&quot; </strong>Watch an excerpt by clicking <a href="http://www.oprah.com/own-super-soul-sunday/How-to-Free-Yourself-of-Negative-Thoughts-Video_1" target="_blank"><strong><br>
      </strong>Watch an Interview Excerpt</a></span><br>
    </p> -->
</div>
<p class="style4"></p>
    <!-- end #sidebar1 -->
    </p>
</div>    
</body>
</html>