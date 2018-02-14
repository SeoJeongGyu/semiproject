<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin: 0px; padding: 0px; margin: auto;}
</style>
</head>
<body>
<%
	//보여질 페이지를 파라미터로 얻어오기
	String spage=(String)request.getAttribute("page");
	/* if(spage==null){
	    spage="home.jsp";
	}*/
 
%>
<body>
<div id="wrap">
	<div id="header">
		<jsp:include page="/home/header.jsp"></jsp:include>
	</div>
	<div id="content" style="width: 1300px;">
		<jsp:include page="<%=spage %>"></jsp:include>
	</div>
	<%-- <div id="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div> --%>
</div>
</body>
</html>