<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/home/api.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function btn(){
//SIDEBAR
  $('.button-collapse').sideNav({
      menuWidth: 300, // Default is 300
      edge: 'left', // Choose the horizontal origin
      closeOnClick: false, // Closes side-nav on <a> clicks, useful for Angular/Meteor
      draggable: true // Choose whether you can drag to open on touch screens
    }
  );
  // START OPEN
  $('.button-collapse').sideNav('show');
}
</script>
<title>Insert title here</title>
</head>
<body>
   <ul id="slide-out" class="side-nav">
    <li><a href="<%=request.getContextPath()%>/admin.do?cmd=member">회원관리</a></li>
    <li><div class="divider"></div></li>
    <li><a href="<%=request.getContextPath()%>/admin.do?cmd=board">게시물관리</a></li>
    <li><div class="divider"></div></li>
    <li><a href="<%=request.getContextPath()%>/admin.do?cmd=report">신고물관리</a></li>
    <li><div class="divider"></div></li>
  </ul>
  <a href="javascript:btn()" data-activates="slide-out" class="button-collapse" ><i class="material-icons" style="font-size: 70px;" >menu</i></a>
</body>
</html>