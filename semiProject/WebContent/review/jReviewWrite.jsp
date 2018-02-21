<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<center>
<script>
$(document).ready(function() {
    Materialize.updateTextFields();
  });</script>
  
  <script>
  function fileUpload(){
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = fileupload;
	xhr.open('get','jReviewWrite.jsp',true);
	xhr.send();
  }
  function fileupload(){
	  if(xhr.readyState ==4 && xhr.status ==200){
		  alert("hello");
		 var div=document.getElementById("file");
		 div.style.display="block";
	  }
  }
  </script>




<div id="write" style="width: 1000px; height: 527px; margin-top: 100px;">

    
      <div align="left">
   
   <label for="id" style=" font-size: 20px;">대표&nbsp;사진등록</label>  <a id="scale-demo" class="btn-floating blue pulse" onclick="fileUpload()">
    <i class="material-icons">add_a_photo</i>
  </a>				<!-- Scaled in -->

      </div>

    
   
    
    <form class="cols12" action="<%=request.getContextPath() %>/review.do?cmd=writeOk" method="post">
    
    <!-- 파일첨부하는 div  -->
     <div id="file"  style="display:none;">
      <div class="file-field input-field">
      <div class="btn" style="width:100px;height:40px;">
        <span>첨부</span>
 		<input type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text"  style="font-size: 30px; width:500px;margin-right:500px;">
      </div>
    </div>
    
    </div>
    
    
    
      <div class="row">
        <div class="input-field col  s6">
          <input id="title" type="text" class="validate" style=" width: 460px; font-size:30px; height: 60px;">
          <label for="title" style="font-size: 20px; margin-left:10px; ">제목</label>
        </div>
      </div>

 	 <jsp:include page="/home/summernote.jsp"></jsp:include>
 	
  	<button class="btn waves-effect waves-light" type="submit" name="action" style=" width:170px; height:50px;">Submit
    <i class="material-icons right">send</i>
  </button>
  
    </form>
  </div>
  
  
  </center>

