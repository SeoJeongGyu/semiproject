<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="1">
		<br>
		<tr>
		<th>운영체제 </th>
		<td><input type="checkbox" id="ios" name="os"/>
		<label for="ios">ios</label></td>
		<td><input type="checkbox" id="android" name="os" />
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
              <th>글번호</th>
              <th>제목</th>
              <th>가격</th>
              <th>작성자</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="sell" items="${requestScope.slist }">
			<tr>
				<td>${sell.sno }</td>
				<td>${sell.stitle }</td>
				<td>${sell.price }</td>
				<td>${sell.id }</td>
			</tr>
		</c:forEach>
        </tbody>
      </table>
    <a class="waves-effect waves-light btn" href="/semiProject/sell.do?cmd=insert" style="background-color:#993333;margin-left: 1200px;">
    <i class="material-icons" >create</i></a>
    
</div>
<div>
	<select name="select" >
		<option value="id">작성자</option>
		<option value="stitle">제목</option>
		<option value="scontent">내용</option>
	</select>
	<input type="text" name="search">
	<input type="button" name="sbutton" value="검색" >
</div>

