<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">       

        <!-- include skelenote css/js-->
        <link href="<%=request.getContextPath()%>/dist/materialnote.css" rel="stylesheet" type="text/css">
        <script src="<%=request.getContextPath()%>/dist/materialnote.js"></script>

 
 <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
$(document).ready(function() {
     $('#summernote').summernote({
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
     });
});
</script>
<script>
$(document).ready(function() {
	  $('#summernote').summernote();
	});

</script>
<script>

$(document).ready(function() {
    Materialize.updateTextFields();
  });</script>
  
  <script>
  function fileUpload(){
	  alert("hello");
  }
  </script>
</head>
<body>
<center>


<div id="login.jsp" style="width: 1000px; height: 527px; margin-top: 100px;">
    <form class="col s12 " >
      <div align="left">
   
   <label for="id" style=" font-size: 20px;">사진등록</label>  <a id="scale-demo" class="btn-floating btn-small scale-transition" onclick="fileupload()">
    <i class="material-icons">add_a_photo</i>
  </a>				<!-- Scaled in -->

      </div>
    </form>
    
    
    <form class="cpls12">
      <div class="row">
        <div class="input-field col s6">
          <input id="pwd" type="text" class="validate" style=" width: 460px; height: 60px;">
          <label for="pwd" style="font-size: 20px; margin-left:10px; ">제목</label>
        </div>
      </div>

  <textarea name="content" id="summernote" ></textarea>
 	
  	<button class="btn waves-effect waves-light" type="submit" name="action" style=" width:150px; height:60px; margin-top:30px;">Submit
    <i class="material-icons right">send</i>
  </button>
  
    </form>
  </div>
  
  
  
</center>
</body>
</html>