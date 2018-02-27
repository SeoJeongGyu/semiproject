<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
	  $('select').material_select();
	});
	var xhr = null;
	function listSort(){
	    var sort = document.getElementsByName("sort");
	    var result = "";
	    for(var i=0; i<sort.length; i++){
	        result=sort[i].value;
	    }
	    xhr = new XMLHttpRequest();
	    xhr.onreadystatechange=callback;
	    xhr.open("get",'ajax.do?cmd=select&sel='+result,true);
	    xhr.send();
	}
	function callback(){
	    if(xhr.readyState==4 && xhr.status==200){
	        
	    }
	}
	
	function checkAll(){
		var check=document.getElementsByName("check");
		var checkAll=document.getElementById("checkAll");
		if(checkAll.checked==true){
			for(var i=0; i<check.length;i++){
			    check[i].checked=true;
			}
		}else{
		    for(var i=0; i<check.length;i++){
			    check[i].checked=false;
			}
		}
	}
	function del(){
	    var chk = document.getElementsByName("check");
	    var len =0;
	    var sql ="delete from member where id in('";
	    for(var i=0;i<chk.length;i++){
	        if(chk[i].checked==true){
	            len++;
	            if(len>1){
	                sql+=",'"+chk[i].value+"'";
	            }else{
	                sql+=chk[i].value+"'";
	            }
	        }
	    }
	    sql+=")";
	    location.href="memberAdmin.do?cmd=delete&sql="+sql;
	}
	window.onload=function(){
	    var select = document.getElementsByName("select")[0];
	    select.selectedIndex='${requestScope.select}';
	    if('${requestScope.del}'!=""){
	        alert('${requestScope.del}');
	    }
	}
</script> 
<form class="col s12" method="post" action="<%=request.getContextPath()%>/admin.do?cmd=board">
	    <div class="row">
	    <div class="input-field col s2" >
		    <select name="sort" onchange="listSort()">
			      <option value="">정렬선택</option>
			      <option value="0">조회순</option>
			      <option value="1">인기순</option>
		    </select>
	  	</div>   
	  	</div>   
 	<table class="highlight">
        <thead>
          <tr>
              <th>
	              <p><input type="checkbox" id="checkAll" onclick="checkAll()"/>
			      <label for="checkAll"></label></p>
			  </th>
              <th>게시물번호</th>
              <th>OS</th>
              <th>통신사</th>
              <th>회사</th>
              <th>가격</th>
              <th>제목</th>
              <th>내용</th>
              <th>작성일</th>
              <th>글등급</th>
              <th>신고수</th>
              <th>작성아이디</th>
          </tr>
        </thead>
        <tbody>
        	<c:forEach var="vo" items="${requestScope.list }">
	          <tr>
	            <td>
		            <p><input type="checkbox" name="check" id="${vo.id }" value="${vo.id }" />
				    <label for="${vo.id }"></label></p>
			    </td>
			    <td>${vo.sno }</td>
              <td>${vo.os }</td>
              <td>${vo.telecom }</td>
              <td>${vo.company }</td>
              <td>${vo.price }</td>
              <td>${vo.stitle }</td>
              <td>${vo.scontent }</td>
              <td>${vo.sdate }</td>
              <td>${vo.sgrade }</td>
              <td>${vo.sreport }</td>
              <td>${vo.id }</td>
	          </tr>
	        </c:forEach>  
        </tbody>
      </table>
     <div class="row">
      <div class="center">
   	<ul class="pagination">
   	<c:choose>
   		<c:when test="${pageNum>5}">
   			<li class="waves-effect"><a href="admin.do?cmd=board&pageNum=${startPage-1}&text=${requestScope.text}&select=${requestScope.select}"><i class="material-icons">chevron_left</i></a></li>
		</c:when>
		<c:otherwise>
			<li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
		</c:otherwise>
	</c:choose>    
	    <c:forEach var="i" begin="${requestScope.startPage }" end="${requestScope.endPage }">
		    <c:choose>
			    <c:when test="${pageNum==i }">
			    	<li class="active"><a href="admin.do?cmd=board&pageNum=${i }&text=${requestScope.text}&select=${requestScope.select}">${i }</a></li>
			    </c:when>
			    <c:otherwise>
			    	<li class="waves-effect"><a href="admin.do?cmd=board&pageNum=${i }&text=${requestScope.text}&select=${requestScope.select}">${i }</a></li>
			    </c:otherwise>
		    </c:choose>
	    </c:forEach>
	    <c:choose>
	    	<c:when test="${pageCount>endPage }">
	    		<li class="waves-effect"><a href="admin.do?cmd=board&pageNum=${endPage+1 }&text=${requestScope.text}&select=${requestScope.select}"><i class="material-icons">chevron_right</i></a></li>
	    	</c:when>
	    	<c:otherwise>
	    		<li class="disabled"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
	    	</c:otherwise>
	    </c:choose>
	    <!-- <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li> -->
  	</ul>
  	</div>
	  	<div style="margin-left: 1200px;"><a class="waves-effect waves-light btn" style="background-color: #ee6e73;" onclick="del()">게시물삭제</a></div>
	    <div class="row" style="margin-left: 400px;">
	    <div class="input-field col s2" >
		    <select name="select" >
			      <option value="0">제목</option>
			      <option value="1">내용</option>
			      <option value="2">아이디</option>
		    </select>
	  	</div>
	        <div class="input-field col s3" >
	          <input id="text" name="text" type="text" class="validate" value="${requestScope.text}">
	        </div>
	      <button class="btn waves-effect waves-light" type="submit" name="action" style="margin-top: 25px; background-color: #ee6e73;">검색</button>
	      </div>
	    </form>
	  </div>
