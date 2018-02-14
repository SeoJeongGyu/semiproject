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
<div class="input-field col s12">
    <form class="col s12" >
	    <select>
	      <option value="" disabled selected>선택하세요</option>
	      <option value="1">ios</option>
	      <option value="2">안드로이드</option>
	    </select>
	    <label>OS</label>
	  </div>
	  <div class="input-field col s12">
	    <select>
	      <option value="" disabled selected>선택하세요</option>
	      <option value="1">SKT</option>
	      <option value="2">KT</option>
	      <option value="2">LG U+</option>
	      <option value="2">기타</option>
	    </select>
	    <label>통신사</label>
	  </div>
	  <div class="input-field col s12">
	    <select>
	      <option value="" disabled selected>선택하세요</option>
	      <option value="1">삼성</option>
	      <option value="2">애플</option>
	      <option value="2">LG</option>
	      <option value="2">기타</option>
	    </select>
	    <label>제조사</label>
	  </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="loc" type="text" class="validate">
          <label for="loc">거래장소</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="price" type="text" class="validate">
          <label for="price">가격</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="stitle" type="text" class="validate">
          <label for="stitle">제목</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="scontent" type="text" class="validate">
          <label for="scontent">내용</label>
        </div>
      </div>
      <input type="submit">
      <a class="waves-effect waves-light btn" style="background-color:#993333;margin-left: 1200px;">
    <i class="material-icons" >done</i></a>
   </form>
  </div>
</body>
</html>