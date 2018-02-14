<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/home/api.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<div class="card-panel" align="center">
		<h3>
			<span class="indigo-text text-darken-2">자유게시판</span>
		</h3>
	</div>
	<table class="highlight">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>닉네임</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td>Alvin</td>
				<td><a href="#">Eclair</a></td>
				<td>$0.87</td>
				<td>d</td>
				<td>d</td>
			</tr>
			<tr>
				<td>Alan</td>
				<td>Jellybean</td>
				<td>$3.76</td>
				<td>d</td>
				<td>d</td>
			</tr>
			<tr>
				<td>Jonathan</td>
				<td>Lollipop</td>
				<td>$7.00</td>
				<td>d</td>
				<td>d</td>
			</tr>
		</tbody>
	</table>
	<br>
	<nav>
    <div class="nav-wrapper">
      <form>
        <div class="input-field">
          <input id="search" type="search" required>
          <label class="label-icon" for="search"><i class="material-icons">search</i></label>
          <div align="center">
          	<a class="waves-effect waves-light btn">검색</a>&nbsp;&nbsp;
		  	<a class="waves-effect waves-light btn">글쓰기</a>
		  </div>
          <i class="material-icons">close</i>
        </div>
      </form>
    </div>
  </nav>
  <ul class="pagination">
    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
    <li class="active"><a href="#!">1</a></li>
    <li class="waves-effect"><a href="#!">2</a></li>
    <li class="waves-effect"><a href="#!">3</a></li>
    <li class="waves-effect"><a href="#!">4</a></li>
    <li class="waves-effect"><a href="#!">5</a></li>
    <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
  </ul>
</body>
</html>