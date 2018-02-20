<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
var xhr=null;
function addComm(){
	var comm=document.getElementById("comments").value;
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=callback;
	xhr.open('post','scomment.do?cmd=insert',true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var params="comments=" + comm;
	xhr.send(params);
}
function callback(){
	if(xhr.readyState==4 && xhr.status==200){
		//alert("success");
		var xml=xhr.responseXML;
		var code=xml.getElementsByTagName("code")[0].firstChild.nodeValue;
		if(code=='success'){
			//입력된 내용 지우기
			document.getElementById("id").value="";
			document.getElementById("comments").value="";
			//댓글목록 불러오기
			getlist(); 
			
		}else{
			alert("댓글등록실패");
		}
	}
}

</script>


<table border="1" width="600">
	<tr>
		<td>작성자</td>
		<td>${vo.id }</td>
	</tr>
	<tr>
		<td>os</td>
		<c:choose>
			<c:when test="${vo.os==1 }">
				<td>ios</td>
			</c:when>
			<c:otherwise>
				<td>안드로이드</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<td>통신사</td>
		<c:choose>
			<c:when test="${vo.telecom==1 }">
				<td>SKT</td>
			</c:when>
			<c:when test="${vo.telecom==2 }">
				<td>KT</td>
			</c:when>
			<c:when test="${vo.telecom==3 }">
				<td>LGU+</td>
			</c:when>
			<c:otherwise>
				<td>기타</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<td>제조사</td>
		<c:choose>
			<c:when test="${vo.company==1 }">
				<td>삼성</td>
			</c:when>
			<c:when test="${vo.company==2 }">
				<td>애플</td>
			</c:when>
			<c:when test="${vo.company==3 }">
				<td>LG</td>
			</c:when>
			<c:otherwise>
				<td>기타</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${vo.shit }</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${vo.price }</td>
	</tr>
	<tr>
		<td>거래상황</td>
		<c:choose>
			<c:when test="${vo.success==0 }">
				<td>판매중</td>
			</c:when>
			<c:otherwise>
				<td>판매완료</td>
			</c:otherwise>
		</c:choose>
	<tr>
		<td>거래장소</td>
		<td>${vo.loc }</td>
	</tr>
	<tr>
		<td>작성날짜</td>
		<td>${vo.sdate }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${vo.stitle }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${vo.scontent }</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="sell.do?cmd=sellList">목록으로</a>
		</td>
	</tr>
</table>
<div>
	<div id="commlist"></div>
		<div id="commAdd">
			<textarea rows="3" cols="30" id="comments"></textarea>
			<input type="button" value="등록" onclick="addComm()">
	</div>
</div>