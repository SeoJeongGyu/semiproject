<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
 <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- Dropdown Trigger -->
  <a class='dropdown-button btn' href='#' data-activates='dropdown1' style="width:200px;">관리메뉴</a>
  <!-- Dropdown Structure -->
  <ul id='dropdown1' class='dropdown-content'>
    <li><a href="../admin.do?cmd=member">회원관리</a></li>
    <li><a href="../admin.do?cmd=review">리뷰게시물 관리</a></li>
    <li><a href="../admin.do?cmd=freeboard">자유게시물 관리</a></li>
    <li><a href="../admin.do?cmd=qna">질문게시물 관리</a></li>
    <li><a href="../admin.do?cmd=sell">팝니다게시물 관리</a></li>
    <li><a href="../admin.do?cmd=buy">삽니다게시물 관리</a></li>
    <li><a href="../admin.do?cmd=report">신고</a></li>
  </ul>
</body>
</html>