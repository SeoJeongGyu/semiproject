<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/home/api.jsp" %>
<style type="text/css">
#id{
     border-bottom: 1px solid #993333;
     box-shadow: 0 1px 0 0 #993333;
   }
#pwd{
	border-bottom: 1px solid #993333;
     box-shadow: 0 1px 0 0 #993333;
}
</style>
<script type="text/javascript">
	if('${requestScope.result}'!=""){
		alert('${requestScope.result}');
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="" style="width: 470px; height: 527px; margin-top: 100px;">
    <form  method="post" action="<%=request.getContextPath()%>/member.do?cmd=loginOk" class="col s12 ">
      <div class="row">
        <div class="input-field col s6">
          <input id="id" name="id" type="text" class="validate" style="width: 460px; height: 60px;">
          <label for="id" style="color: #993333; font-size: 20px;">아이디</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input id="pwd" name="pwd" type="text" class="validate" style=" width: 460px; height: 60px;">
          <label for="pwd" style="color: #993333; font-size: 20px;">비밀번호</label>
        </div>
      </div>
      <button class="btn waves-effect waves-light" type="submit" name="action" style="margin-left:10px; width: 460px; height: 60px; background-color: #993333; margin-top: 30px;" >로그인
  	</button>
    </form>
  </div>
</body>
</html>