<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<script src="js/adminSide.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://fonts.googleapis.com/css?family=Comfortaa"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/adminSide.css" />
<title>Insert title here</title>
</head>
<body>
	<form class="ui form" action="cWriteForm">
		<%@include file="../ref/sideBar.jsp"%>
		<table class="ui celled table">
			<thead>
				<tr>
					<th class="collapsing">
						<div class="ui fitted checkbox">
							<c:forEach var="r" items="${rlist }">
							<input type="checkbox" value="${r.review_no }" class='checkAll'> 
							</c:forEach>
							<label></label>
						</div>
					</th>
					<th>리뷰넘버</th>
					<th>상품넘버</th>
					<th>리뷰제목</th>
					<th>리뷰타입</th>
					<th>점수</th>
					<th>리뷰날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="r" items="${rList }">
					<tr>
						<td class="collapsing">
							<div class="ui fitted checkbox">
								<input type="checkbox" name="review_no" class="review_noChK"
									value="${r.review_no}"> <label></label>
							</div>
						</td>
						<td>${r.member_no}</td>
						<td>${r.product_no}</td>
						<td><a href="reviewDetail?review_no=${r.review_no}">${r.r_title}</a></td>
						<td>
							<c:choose>
								<c:when test="${r.r_type.toString() eq '1'}">사용기</c:when>
								<c:when test="${r.r_type.toString() eq '2'}">싸용기</c:when>
							</c:choose>
						</td>
						<td>${r.score }</td>
						<td>${r.r_date}</td>
						</tr>
				</c:forEach>
				<tr>
			</tbody>
		</table>




	</form>
</body>
</html>