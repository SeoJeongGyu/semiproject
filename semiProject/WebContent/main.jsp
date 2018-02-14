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
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
		<jsp:include page="/home/header.jsp"></jsp:include>
	</div>
	
	<div id="content" style="width: 1350px;">
		<c:choose>
			<c:when test="${requestScope.page==null}">
				<%-- <jsp:include page="member/join.jsp"></jsp:include> --%>
					이곳은 메인
			</c:when>
			<c:otherwise>
				<jsp:include page="${requestScope.page}"></jsp:include>
			</c:otherwise>
		</c:choose>
	</div>
	<%-- <div id="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div> --%>
</div>
</body>
</html>