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
12   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script> 
13 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
14 <title>Insert title here</title> 
15 </head> 
16 <body> 
17 <!-- Dropdown Trigger --> 
18   <a class='dropdown-button btn' href='#' data-activates='dropdown1' style="width:200px;">관리메뉴</a> 
19   <!-- Dropdown Structure --> 
20   <ul id='dropdown1' class='dropdown-content'> 
21     <li><a href="../admin.do?cmd=member">회원관리</a></li> 
22     <li><a href="../admin.do?cmd=review">리뷰게시물 관리</a></li> 
23     <li><a href="../admin.do?cmd=freeboard">자유게시물 관리</a></li> 
24     <li><a href="../admin.do?cmd=qna">질문게시물 관리</a></li> 
25     <li><a href="../admin.do?cmd=sell">팝니다게시물 관리</a></li> 
26     <li><a href="../admin.do?cmd=buy">삽니다게시물 관리</a></li> 
27     <li><a href="../admin.do?cmd=report">신고</a></li> 
28   </ul> 
29 </body> 
30 </html> 
