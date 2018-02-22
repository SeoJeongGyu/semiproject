<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
  $(document).ready(function() {
    $('select').material_select();
  });
  
  function getDetail(sno){
	  //console.log(sno);
	  location.href="sell.do?cmd=sdetail&sno="+sno;
  }
  
  
  var xhr=null;
  function ios(){
	  var ios=document.getElementById("ios").value;
	  var android=document.getElementById("android").value;
	  var val=document.getElementsByName("os");
	  alert(val);
	  var sql="select * from sell where os=";
	  
	  
	  xhr=new XMLHttpRequest();
	  xhr.onreadystatechange=getIos;
	  xhr.open('get', , true);
	  xhr.send();
  }
  
  
  
</script>
<table border="1" style="width:650px;margin-left:0px ">
		<br>
		<tr>
		<th>운영체제 </th>
		<td><input type="checkbox" id="ios" name="os"/>
		<label for="ios">ios</label></td>
		<td style="width:150px"><input type="checkbox" id="android" name="os" />
		<label for="android">안드로이드</label></td>
	 	</tr>
	 	<tr>
	 	<th>통신사 </th>
		<td><input type="checkbox" id="skt" name="telecom"/>
		<label for="skt">SKT</label></td>
		<td><input type="checkbox" id="kt" name="telecom" />
		<label for="kt">KT</label></td>
		<td><input type="checkbox" id="lgu+" name="telecom" />
		<label for="lgu+">LGU+</label></td>
		<td><input type="checkbox" id="tetc" name="telecom" />
		<label for="tetc">기타</label></td>
	 	</tr>
	 	<tr>
	 	<th>브랜드 </th>
		<td><input type="checkbox" id="samsung" name="company"/>
		<label for="samsung">삼성</label></td>
		<td><input type="checkbox" id="lg" name="company" />
		<label for="lg">LG</label></td>
		<td><input type="checkbox" id="apple" name="company" />
		<label for="apple">애플</label></td>
		<td><input type="checkbox" id="cetc" name="company" />
		<label for="cetc">기타</label></td>
	 	</tr>
</table>
    <br>
       
<div class="main" id="sellList">
 <table class="highlight">
        <thead>
          <tr>
              <th>판매상태</th>
              <th>제목</th>
              <th>가격</th>
              <th>작성자</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="sell" items="${requestScope.slist }">
			<tr onclick="getDetail(${sell.sno })">
			<c:choose>
				<c:when test="${sell.success==0 }">			
					<td>판매중</td>
				</c:when>
				<c:otherwise>
					<td>판매완료</td>
				</c:otherwise>
			</c:choose>
				<td><a href="sell.do?cmd=sdetail&sno=${sell.sno }">${sell.stitle }</a></td>
				<td>${sell.price }</td>
				<td>${sell.id }</td>
			</tr>
		</c:forEach>
        </tbody>
      </table>
 
  <div class="row">   
  <br>  
<ul class="pagination">
<c:if test="${startPage>5 }">
	<li class="disabled"><a href="sell.do?cmd=sellList&pageNum=${startPage-1 }"><i class="material-icons">chevron_left</i></a></li>
    
</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${pageNum==i }">
				<li class="active"><a href="sell.do?cmd=sellList&pageNum=${i}">${i}</a></li>
			</c:when>
			<c:otherwise>
			<li class="waves-effect"><a href="sell.do?cmd=sellList&pageNum=${i}">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
<c:if test="${pageCount>endPage }">
<li class="waves-effect"><a href="sell.do?cmd=sellList&pageNum=${endPage+1 }"><i class="material-icons">chevron_right</i></a></li>
 
</c:if>
</ul>
</div>


    <a class="waves-effect waves-light btn" href="/semiProject/sell.do?cmd=insert" style="background-color:#993333;margin-left: 1200px;">
    <i class="material-icons" >create</i></a>
 <div class="row">
    <form class="col s12">
    <div class="input-field col s12" style="width: 100px; margin-left: 10px;">
    <select>
      <option value="1">제목</option>
      <option value="2">내용</option>
      <option value="3">아이디</option>
    </select>
  </div>
      <div class="row">
        <div class="input-field col s2">
          <input id="" type="text" class="validate">
        </div>
      <button class="btn waves-effect waves-light" type="submit" name="action" style="margin-top: 25px;background-color: #993333">
      <i class="material-icons">search</i></button>
      </div>
    </form>
  </div>
  </div>