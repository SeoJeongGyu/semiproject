<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
iframe{
	width: 0px;
	height: 0px;
	border: 0px;
}
</style>
<script type="text/javascript">
	function addFilePath(message){
		alert(message);
		$("#form1").reset();
	}
</script>
</head>
<body>
<form action="uploadForm" id="form1" method="post" enctype="multipart/form-data" target="zeroFrame">
	<input type="file" name="file" id="" />
	<input type="submit" value="Upload" />
</form>
<iframe name="zeroFrame"></iframe>
</body>
</html>