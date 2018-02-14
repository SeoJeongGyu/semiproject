<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="1">

		<th>운영체제 </th>
		<td><input type="checkbox" id="ios" name="os"/>
		<label for="ios">ios</label></td>
		<td>
		<input type="checkbox" id="android" name="os" />
		<label for="android">안드로이드</label></td>
	 
	<p>
		통신사 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="skt" name="telecom"/>
		<label for="skt">skt</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="kt" name="telecom" />
		<label for="kt">kt</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="lgu+" name="telecom" />
		<label for="lgu+">LGU+</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="etc" name="telecom" />
		<label for="tetc">기타</label>
	</p> 
	<p>
		브랜드 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="samsung" name="company"/>
		<label for="samsung">삼성</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="lg" name="company" />
		<label for="lg">LG</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="apple" name="company" />
		<label for="apple">애플</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="cetc" name="company" />
		<label for="cetc">기타</label>
	</p>          
</table>
    
 
  
        
        
        
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
