<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	/* label color */
   .input-field label {
     color: #993333;
   }
   /* label focus color */
   .input-field input[type=text]:focus + label {
     color: #993333;
   }
   
   .row{width: 860px;}

</style>
<br>
<div class="row">
   <form class="col s12" method="post" action="/semiProject/buy.do?cmd=update">
    <div class="row">
        <div class="input-field col s12">
          <input name="stitle" type="text" class="validate" value="${vo.btitle }">
          <label for="stitle">제목</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
          <label for="scontent">내용</label> <br><br>
          <textarea name="scontent" id="materialnote">${vo.bcontent }</textarea>
        </div>
    </div>
      
      <button class="btn waves-effect waves-light" type="submit" style="background-color:#993333; margin-left:340px; width: 200px">
      	<i class="large material-icons">done</i></button>
   </form>
  </div>
<script type="text/javascript">

	$(document).ready(function() {
	    $('#materialnote').materialnote({
	        width: 860,
	        height: 300
	    });
	});
	$(document).ready(function() {
	$('#materialnote').materialnote();
	});
	$(document).ready(function() {
		    $('select').material_select();
	});
</script>