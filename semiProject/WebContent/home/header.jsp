<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

</style>
<%@ include file="api.jsp" %>

<script type="text/javascript">
$(".dropdown-button").dropdown();
</script>
<title>Insert title here</title>
</head>
<body>
 <nav class="nav-extended" >
    <div class="nav-wrapper" style="background-color: #993333;">
      <a href="#" class="brand-logo" style="margin-left: 300px;">뿜뽀</a>
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down" style="margin-right: 300px;">
        <li><a href="sass.html">로그인</a></li>
        <li><a href="badges.html">회원가입</a></li>
      </ul>
    </div>
    <!-- Dropdown Structure 드롭박스 내용 -->
	<ul id="dropdown1" class="dropdown-content" style="background-color: #993333;">
	  <li><a href="/semiProject/sell/sellList.jsp" style="color: white;">팝니다</a></li>
	  <li class="divider"></li>
	  <li><a href="#!" style="color: white;">삽니다</a></li>
	</ul>
  </nav>
  <nav>
  <div class="nav-wrapper" style="background-color: #993333;">
    <ul class="left hide-on-med-and-down" style="margin-left: 300px;">
      <li><a href="#">리뷰게시판</a></li>
      <li><a href="#">자유게시판</a></li>
      <li><a href="#">질문게시판</a></li>
      <!-- Dropdown Trigger -->
      <li><a class="dropdown-button" href="#!" data-activates="dropdown1">장터게시판<i class="material-icons right">arrow_drop_down</i></a></li>
    </ul>
  </div>
</nav>
 
</body>
</html>