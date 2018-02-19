<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
	  $('select').material_select();
	});
</script>    
 <h4 class="truncate">맴버 관리</h4>
 <table class="highlight">
        <thead>
          <tr>
              <th>
	              <p><input type="checkbox" id="test5" />
			      <label for="test5"></label></p>
			  </th>
              <th>아이디</th>
              <th>이름</th>
              <th>닉네임</th>
              <th>폰번호</th>
              <th>이메일</th>
              <th>가입날짜</th>
          </tr>
        </thead>
        <tbody>
        	<c:forEach var="vo" items="${requestScope.list }">
	          <tr>
	            <td>
		            <p><input type="checkbox" id="${vo.id }" />
				    <label for="${vo.id }"></label></p>
			    </td>
	            <td>${vo.id }</td>
	            <td>${vo.name }</td>
	            <td>${vo.nickname }</td>
	            <td>${vo.phone }</td>
	            <td>${vo.email }</td>
	            <td>${vo.regdate }</td>
	          </tr>
	        </c:forEach>  
        </tbody>
      </table>
     <div class="row">
   	<ul class="pagination">
	    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
	    <li class="active"><a href="#!">1</a></li>
	    <li class="waves-effect"><a href="#!">2</a></li>
	    <li class="waves-effect"><a href="#!">3</a></li>
	    <li class="waves-effect"><a href="#!">4</a></li>
	    <li class="waves-effect"><a href="#!">5</a></li>
	    <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
  	</ul>
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
      <button class="btn waves-effect waves-light" type="submit" name="action" style="margin-top: 25px;">검색</button>
      </div>
    </form>
  </div>