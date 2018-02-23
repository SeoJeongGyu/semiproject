<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	window.onload=function(){
	    function chk(){
		    var chk = document.getElementsByName("chk");
		    for(var i=0; i<chk.length;i++){
		        console.log(chk[i]);
		    }
	    }
	}
	
	
</script>    
<div class="row">
   <form class="col s12" method="post" action="/semiProject/boardlist.do?cmd=noticesOk">
        <div id="check">
        <input type="checkbox" id="freeboard" name="chk" value="freeboard" onclick="chk()"/>
		<label for="freeboard">자유게시판</label>
		<input type="checkbox" id="qna" name="chk" value="qna" onclick="chk()"/>
		<label for="qna">질문게시판</label>
        <input type="checkbox" id="sell" name="chk" value="sell" onclick="chk()"/>
		<label for="sell">팝니다게시판</label>
		<input type="checkbox" id="buy" name="chk" value="buy" onclick="chk()"/>
		<label for="buy">삽니다게시판</label>
        </div>
      <div class="row">
        <div class="input-field col s6" style="margin-left: 15px">
          <input name="title" type="text" class="validate">
          <label for="title">제목</label>
        </div>
        <div class="input-field col s12" style="margin-left:10px; width:900px;">
          <label for="content">내용</label> <br><br><br>
       	 <jsp:include page="/home/summernote.jsp"></jsp:include>
        </div>
      </div>
      <button class="btn waves-effect waves-light" type="submit" style="margin-left:30px; background-color:#ee6e73; width: 200px">
      	<i class="large material-icons">done</i></button>
   </form>
  </div>