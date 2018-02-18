<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
          
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

</head>
<body>
<div>
		<form action="imageUpload" id="imageUpload" name="imageUpload"
			method="post" enctype="multipart/form-data">
			<table class="bordered" width="100px">
			<tr><td>리뷰 작성하기</td></tr>
				<tr>
				<td>대표사진</td>
				
				<td> 
				<!-- Scaled in -->
  <a id="scale-demo" href="abc"class="btn-floating btn-small scale-transition">
    <i class="material-icons">+</i>
  </a>
				</td>
				</tr>
				
				<tr>
				<td><input type="file" name="file" id=""/><input type="submit" value="올리기" />
				</td>
				</tr>
				<tr><td><textarea name="content" id="summernote" value=""></textarea></td></tr>
			</table>
		</form>
	</div>

</body>
</html>