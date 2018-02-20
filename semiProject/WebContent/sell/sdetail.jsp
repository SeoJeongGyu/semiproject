<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	#commlist{width:1350px;border:1px solid #aaa; padding:2px;margin-top: 3px;}
</style>
<script>
window.onload=getlist;
var xhr=null;
function getlist(){
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=list;
	xhr.open('get', 'scomment.do?cmd=list&sno=${vo.sno}', true);
	xhr.send();
}
function list(){
	if(xhr.readyState==4 && xhr.status==200){
		var list=xhr.responseText;
		//alert(list);
		var json=JSON.parse(list); //json객체로 변환하기(ie8이상)
		var div=document.getElementById("commlist");
		commlist.innerHTML="";
		for(var i=0;i<json.length;i++){
			div.innerHTML+="작성자:"+json[i].id+"	내용:"+json[i].comments+"<br>";
		}
	}
}

	var xhr1=null;
	function addComm(){
		var comm=document.getElementById("sccontent").value;
		xhr1=new XMLHttpRequest();
		xhr1.onreadystatechange=callback;
		xhr1.open('post','scomment.do?cmd=insert&sccontent='+comm+'&sno=${vo.sno }',true);
		//post방식은경우 아래와 같이 Content-Type지정해야 함
		xhr1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var params="sccontent=" + comm;
		//post방식으로 데이터를 보낼때는 send메소드를 이용한다.
		xhr1.send(params);
	}
	function callback(){
		if(xhr1.readyState==4 && xhr1.status==200){
			var result=xhr1.responseText;
			//alert(result);
			var json=JSON.parse(result);
			if(json.result=="success"){
				document.getElementById("sccontent").value="";
				getlist();
			}else{
				alert("댓글등록실패!");
			}		
		}
	}

</script>
<table border="1" width="600" onload="getlist()">
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
<div >
	<div id="commlist"></div>
		<div id="commAdd">
			<textarea rows="3" cols="30" id="sccontent"></textarea>
			<input type="button" value="등록" onclick="addComm()">
		</div>
</div>