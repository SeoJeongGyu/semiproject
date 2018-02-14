<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* label color */
   .input-field label {
     color: #993333;
   }
   /* label focus color */
   .input-field input[type=text]:focus + label {
     color: #993333;
   }
   /* valid color */
   .validate {
     box-shadow: 0 1px 0 0 #993333;
   }
</style>
<script type="text/javascript">
  $(document).ready(function() {
    $('select').material_select();
  });
</script>
</head>
<body>
<br>
<div class="row">
   <form class="col s12" method="post" action="/semiProject/sell.do?cmd=insertOk">
	<div class="input-field col s12">
	    <select name="os">
	      <option value="os" disabled selected>선택하세요</option>
	      <option value="1">ios</option>
	      <option value="2">안드로이드</option>
	    </select>
	    <label>OS</label>
	  </div>
	  <div class="input-field col s12">
	    <select name="telecom">
	      <option value="telecom" disabled selected>선택하세요</option>
	      <option value="1">SKT</option>
	      <option value="2">KT</option>
	      <option value="3">LG U+</option>
	      <option value="4">기타</option>
	    </select>
	    <label>통신사</label>
	  </div>
	  <div class="input-field col s12">
	    <select name="company">
	      <option value="company" disabled selected>선택하세요</option>
	      <option value="1">삼성</option>
	      <option value="2">애플</option>
	      <option value="3">LG</option>
	      <option value="4">기타</option>
	    </select>
	    <label>제조사</label>
	  </div>
      <div class="row">
        <div class="input-field col s12">
          <input name="loc" type="text" class="validate">
          <label for="loc">거래장소</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input name="price" type="text" class="validate">
          <label for="price">가격</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input name="stitle" type="text" class="validate">
          <label for="stitle">제목</label>
        </div>
      </div> 
      <div class="row">
        <div class="input-field col s12">
       	 <jsp:include page="/home/summernote.jsp"></jsp:include>
          <input name="scontent" type="text" class="validate">
          <label for="scontent">내용</label>
        </div>
      </div>
      
      <button class="btn waves-effect waves-light" type="submit" style="background-color:#993333; margin-left:20px; width: 200px">
      	<i class="large material-icons">done</i></button>
   </form>
  </div>
</body>
</html>