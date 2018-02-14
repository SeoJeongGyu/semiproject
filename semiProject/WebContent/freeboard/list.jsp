<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/home/api.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('select').material_select();
	});
</script>
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
	<div class="row">
		<form class="col s12">
			<div class="row">
				<div class="input-field col s1">
					<select>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">닉네임</option>
					</select>
				</div>
				<div class="input-field col s2">
					<input id="icon_prefix" type="text" class="validate">
				</div>
				<a class="waves-effect waves-light btn"
					style="margin-top: 25px; background-color: #993333;">검색</a>&nbsp;&nbsp;
				<a class="waves-effect waves-light btn"
					style="margin-top: 25px; background-color: #993333;">글쓰기</a>
			</div>
		</form>
	</div>
</body>
</html>