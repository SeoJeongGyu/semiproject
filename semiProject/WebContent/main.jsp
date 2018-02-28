<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin: 0px; padding: 0px; margin: auto;}
	#notices{position: relative; float: left;}
	#fqboard{position: relative; float: left;}
	#review{position: relative; float: left;}
	#event{position: relative; float: left; width: 250px;}
	#content{margin-left:50px; height:100%; position: relative; float: left;}
	#footer{width:100%; position: relative; float: left; margin-top: 20px;}
</style>
<script type="text/javascript">
</script>
<body>
<div id="wrap">
	<div id="header">
		<jsp:include page="/home/header.jsp"></jsp:include>
	</div>
	<table id="event" >
		<tr><td><img id="samsung" alt="" src="image\samsung.jpg" style="width: 250px;"></td></tr>
		<tr><td><img id="lg" alt="" src="image\LG.jpg" style="width: 250px;"></td></tr>
	</table>
	<div id="content" style="width: 1350px;">
		<c:choose>
			<c:when test="${requestScope.page==null}">
			<div id="notices" style="margin-top: 30px; width: 630px; height: 400px; background-color: pink;"></div>
			<div id="fqboard" style="margin-top: 30px; margin-left : 40px;  width: 630px; height: 400px; background-color: yellow;"></div>
			<div id="review" style="margin-top: 30px; width: 1300px; height: 400px; background-color: gray;"></div>
				<%-- <jsp:include page="aaa.jsp"></jsp:include>
					이곳은 메인 --%>
			</c:when>
			<c:otherwise>
				<jsp:include page="${requestScope.page}"></jsp:include>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="footer">
		<jsp:include page="/home/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>