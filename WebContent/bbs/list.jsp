<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>

<%  
	/* 검색관련 처리 */
	/* 검색을 사용 안할 수도 있음 검색을 안하면 null이 나와서 
		null 없애야 함.. Utility.checkNull 이용 */ 
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word="";
	
	//paging 페이징 관련
	//변수가 2개 필요
	int nowPage= 1;
	int recordPerPage = 10;
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	// DB에서 가져올 순번
	int sno = ((nowPage-1)*recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
		
	List<BbsDTO> list = dao.list(map);
	// 전체 레코드 개수(col,word)
	int totalRecord = dao.total(map); 
	
	
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<title>자유게시판</title> 
<!-- 11 -->
<style>
#preview img {
    width: 100px;
    height: 100px;
}
#preview p {
    text-overflow: ellipsis;
    overflow: hidden;
}
.preview-box {
    border: 1px solid;
    padding: 5px;
    border-radius: 2px;
    margin-bottom: 10px;
}
</style>
<!-- 11 -->
<script type="text/javascript">
function read(bbsno){
	var url = "./read.jsp";
	url = url +"?bbsno=" + bbsno;
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	url = url + "&nowPage=<%=nowPage%>";
	
	location.href = url;
	
}

function filedown(filename){
	var url = "<%=root%>/download";
	url = url + "?filename=" + filename;
	url = url + "&dir=/bbs/storage";
	
	location.href = url;
}

</script>
<style type="text/css">
	body{
		line-height:2em;		
		font-family:"맑은 고딕";
	}
	ul, li{ 
	    list-style:none;
	    text-align:center;
	    padding:0;
	    margin:0;
    }

    #mainWrapper{
    	width: 475px;
		margin: 0 10px; /*가운데 정렬*/
	}

	#mainWrapper > ul > li:first-child {
		text-align: center;
		font-size:14pt;
		height:40px;
		vertical-align:middle;
		line-height:30px;
	}

	#ulTable {margin-top:20px;}
	

	#ulTable > li:first-child > ul > li {
		background-color:#c9c9c9;
		font-weight:bold;
		text-align:center;
	}

    #ulTable > li > ul {
    	clear:both;
    	padding:0px auto;
    	position:relative;
    	min-width:40px;
    }
    #ulTable > li > ul > li { 
    	float:left;
    	font-size:10pt;
    	border-bottom:1px solid silver;
    	vertical-align:baseline;
    }    

    #ulTable > li > ul > li:first-child           	{width:10%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li       	{width:45%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li    	{width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li 	{width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/

    #divPaging {
  		clear:both; 
    	margin:0 auto; 
    	width:220px; 
    	height:50px;
    }

    #divPaging > div {
	    float:left;
	    width: 30px;
	    margin:0 auto;
	    text-align:center;
     }

    #liSearchOption {clear:both;}
    #liSearchOption > div {
	    margin:0 auto; 
	    margin-top: 30px; 
	    width:auto; 
	    height:100px; 
	   
    }

    .left {
    	text-align : left;
    }

</style>

</head> 

<body class="mainbody">
	<jsp:include page="/menu/header.jsp" flush="false"/>	
	

<div id="mainWrapper">

	<ul>
		<!-- 게시판 제목 -->
		<li>자유게시판</li>

		<!-- 게시판 목록  -->
		<li>
		자유롭게 글을 쓰는 게시판입니다.
		<ul id ="ulTable">
			<li>
				<ul>
					<li>No</li>
					<li>제목</li>
					<li>작성일</li>
					<li>작성자</li>
					<li>조회수</li>
				</ul>
			</li>
		<!-- 게시물이 출력될 영역 -->
		<%
		if(list.size()==0){
	
		%>
		<li>
			<p style="text-align:center">등록된 글이 없습니다.
			</p>
		</li>
		<%
		}else{
		for(int i=0;i<list.size();i++){
			BbsDTO dto = list.get(i);
		%>
		
		<li>
			<ul>
				<li><%=dto.getBbsno() %></li>
				<li class="left">
				<%
				for(int r=0;r<dto.getIndent();r++){
				  out.print("&nbsp;&nbsp;");  // &nbsp; 한칸
				 	}
				if(dto.getIndent()>0){
					out.print("<img src='../images/re.jpg'>"); 
					} 
				 %>
				 <a href="javascript:read('<%=dto.getBbsno() %>')">
				 <%=dto.getTitle() %>
				 </a>
				<%
				if(Utility.compareDay(dto.getWdate()))
					out.print("<img src='../images/new.gif'>");
     			%></li>
				<li><%=dto.getWdate() %></li>
				<li><%=dto.getWname() %></li>
				<li><%=dto.getViewcnt() %></li>
			</ul>
		</li>
<%
	}
}
%>
		</ul>
	</li>

			<!-- 게시판 페이징 영역 -->
			<li>
				<div id="divPaging">
				<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
				</div>
			</li>

			<!-- 검색 폼 영역 -->
			<li id='liSearchOption'>
	            <div class="search">
				<form method="post" action="./list.jsp">
				<select name="col">
				<option value="wname"
				<%if(col.equals("wname")) out.print("selected"); %>
				>성명</option>
				<option value="title"
				<%if(col.equals("title")) out.print("selected"); %>
				>제목</option>
				<option value="content"
				<%if(col.equals("content")) out.print("selected"); %>
				>내용</option>
				<option value="total">전체출력</option>
				</select>
				<!-- 입력값 -->
				<input type="text" name="word" value="<%=word %>">
				<button>검색</button>
				<button type="button" onclick="location.href='createForm.jsp'" 
				style="margin:15px auto;"> 글쓰기 </button>
				
				</form>
				</div>
      	  	</li>

		</ul>
	</div>

<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html> 