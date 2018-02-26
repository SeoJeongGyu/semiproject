<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

<!-- 글작성자와 접속자가 같은지 확인 -->
function rupdate(){
	if('${sessionScope.id}' == '${vo.id}'){
	location.href="review.do?cmd=update&rno=${vo.rno}";
		
	}else{
		alert("본인의 글만 수정할 수 있습니다.");
	}
}

function rdelete(){
if('${sessionScope.id}' == '${vo.id}'){
location.href="review.do?cmd=delete&rno=${vo.rno}&id=${vo.id}";
	
}else{
	alert("본인의 글만 삭제할 수 있습니다.");
}

}
</script>

<div id="wrap">

	<form action="" method="post">
		<!--  상단 작성자, 작성일, 조회수 -->
		<div
			style="overflow: hidden; padding-bottom: 5px; border-bottom: 2px solid #4B4C51">
			<br>
		</div>
		<div style="overflow: hidden; padding: 10px 0px 10px 0px;">
			<div
				style="margin-left: 15px; width: 12%; float: left; overflow: hidden; padding: 5px;">
				<img src="image/ico_point.gif"><span>작성자&nbsp; <span>${vo.id }</span></span>
			</div>
			<div style="width: 30%; float: left; overflow: hidden; padding: 5px">
				<span><img src="image/ico_point.gif">등록&nbsp;
					<span>${vo.rdate }</span><span>&nbsp;&nbsp;</span><img
					src="image/ico_point.gif">&nbsp;조회수 &nbsp;<span>${vo.rhit }</span></span>
			</div>
		</div>
		<div
			style="overflow: hidden; padding-bottom: 5px; border-bottom: 2px solid #4B4C51"></div>

<!--  제목 보여주기 -->
<div id="title">
<h3 align="center">${vo.rtitle }</h3>
</div>

		<!-- 내용보여주기  -->
<div id="content" style="margin-left: 250px;"><span>${vo.rcontent }</span></div>

		
		<!--  수정, 삭제, 추천-->
<div class="fixed-action-btn horizontal">
    <a class="btn-floating btn-large red">
      <i class="large material-icons">menu</i>
    </a>
    <ul>
      <li><a class="btn-floating blue" onclick="rupdate()"><i class="material-icons">border_color</i></a></li>
      <li><a class="btn-floating red"  onclick="rdelete()" ><i class="material-icons">delete</i></a></li>
      <li><a class="btn-floating green"><i class="material-icons">thumb_up</i></a></li>
      <li><a class="btn-floating black"><i class="material-icons">sentiment_very_dissatisfied</i></a></li>
    </ul>
  </div>
		<!-- 댓글기능  -->
		<div id="bottom"></div>

	</form>
</div>