<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<style type="text/css">
.fileDrop{
	border: 1px solid black;
	width: 80%;
	height: 500px;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".fileDrop").on("dragenter dragover",function(event){
			event.preventDefault();
		});
		$(".fileDrop").on("drop",function(event){
			event.preventDefault();
			
			var files=event.originalEvent.dataTransfer.files;
			var formData = new FormData();
			formData.append("file",files[0]);
			
			$.ajax({
				url:'/web/uploadAjaxForm',
				data: formData,
				dataType:'text',
				processData:false,
				contentType:false,
				type:'POST',
				success:function(data){
					var str="";
					if(checkImageType(data)){
						str="<div>"+"<img src='displayFile?fileName="+data+"'/>"+data+"</div>";
					}else{
						str = "<div>"+data+"</div>";
					}
				}
			});
		});
		
		function checkImageType(fileName){
			// 정규 표현식을 이용해 파일의 확장자가 존재하는지를 검사 .
			//  i: 대소문자 구분 없음. 
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);
		}
	});
</script>
</head>
<body>
<h3>Ajax Upload</h3>
<div class="ui three stackable cards fileDrop">
 <!--  <div class="card">
    <div class="image">
      <img src="/images/avatar/large/elliot.jpg">
    </div>
  </div> -->
 </div>
</body>
</html>