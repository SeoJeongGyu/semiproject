<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://fonts.googleapis.com/css?family=Comfortaa"
	rel="stylesheet">
<style type="text/css">
html, body {
	font-family: 'Comfortaa', cursive;
}

html {
	background-color: #87BCD8;
}

.ui.header {
	color: #87BCD8;
	font-family: 'Comfortaa', cursive;
}

.ui.dividing.header {
	border-bottom: 1px solid #ec889f;
}

.column {
	border: 1px solid orange;
}

.loginForm {
	margin-top: 20.0em;
	min-width: 500px;
}

.formOut {
	margin-top: 10.0em;
	max-width: 600px;
}

.ui.form {
	margin-left: 15.0em;
}

div.header {
	font-family: 'Comfortaa', cursive;
}

.ui.form .field>label {
	font-size: 12pt;
	margin-bottom: 15px;
}

.ui.button {
	background-color: #fcfcfd;
	color: #87BCD8;
	border: 1px solid #87BCD8;
	font-size: 15pt;
	margin-top: 5px;
	font-family: 'Comfortaa', cursive;
} 

.ui.button:hover {
	background-color: #87BCD8;
	color: #fcfcfd;
}

.ui.centered.grid {
	margin-top: 3.0em;
}

img.ui.image {
	display: block;
	float: right;
	margin-top: -15%;
	margin-right: 5%;
}
</style>
<script type="text/javascript">
	function check(){
		if(document.frm.id.value==""){
			alert("아이디를 입력하세요")
		}else if(document.frm.pw.value==""){
			alert("PW아이디를 입력하세요")
		}
		
		 $.ajax({
			url:"loginOk",
			type:'post',
			data:$('#formGo').serialize(),
			success:function(result){
				if(result=="Y"){
					location.href="memberList";
				}else{
					document.getElementById("errorDiv").style.display="block";	
				}
			}	
			
		});	 
	
	}
	function enterKey(){
		if(event.keyCode==13){
			check();
			
		}
	}

</script>
</head>
<body>
	<form action="/adminHome" id="formGo" method="post" name="frm">
		<div class="ui container loginForm">
			<h2 class="ui dividing header pageHeader">Administrator Page</h2>
			<div class="ui formOut">
				<div class="ui form error">
					<div class="field">
						<label class="lbTitle">id</label> <input type="text"
							placeholder="ID" name="id" id="id">
					</div>
					<div class="field">
						<label>password</label> <input type="password"
							placeholder="Password" name="pw" onkeydown="enterKey();">
					</div>
					<div class="ui error message" style="display: none" id="errorDiv">
						<div class="header">Action Forbidden</div>
						<p>You can only sign up for an account once with a given
							e-mail address.</p>
					</div>
					<div class="ui centered grid divButton">
						<div class="fluid ui submit vertical animated button">
							<div class="visible content">Sign in</div>

							<div class="hidden content" onclick="check()">Go</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>