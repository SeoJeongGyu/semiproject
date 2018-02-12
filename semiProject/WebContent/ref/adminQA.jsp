<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<script
	src="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.js"></script>
<script type="text/javascript" src="js/QAList.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link
	href="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/memberList.css">
<meta charset="UTF-8">
<title>관리자 - QA 답변</title>
</head>
<body>
	<div class="ui top attached demo menu">
		<a class="item" id="btnMenu"> <i class="sidebar icon"></i> Menu
		</a>
	</div>
	<div class="ui bottom attached segment pushable">
		<%@include file="../ref/adminSide.jsp"%>
		<div class="pusher">
			<!-- Site content !-->
			<div class="ui big breadcrumb">
				<a class="section">Board</a> <i class="right chevron icon divider"></i>
				<div class="active section">QA</div>

				<div class="mainContent">
					<div class="ui two column right aligned  grid">

						<!-- 달력 -->
						<div class="column">
							<div class="ui four column grid form">
								<!-- calendar start -->
								<div class="column" id="clCalendar">
									<div class="ui form">
										<div class="two fields">
											<div class="field">
												<div class="ui calendar" id="rangestart">
													<div class="ui input left icon">
														<i class="calendar icon"></i> <input type="text"
															placeholder="Start">
													</div>
												</div>
											</div>
											<div class="field">
												<div class="ui calendar" id="rangeend">
													<div class="ui input left icon">
														<i class="calendar icon"></i> <input type="text"
															placeholder="End">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- calendar end -->
								<input type="button" value="검색" id="calBtn" class="ui button" />
							</div>
						</div>

						<div class="column">
							<div class="ui four column right aligned grid">
								<!-- 칸맞추기...ㅠㅠ -->
								<div class="column"></div>
								<!-- 검색카테고리 그리드 -->
								<div class="column">
									<select name="searchField" id="searchField"
										class="ui fluid dropdown">
										<option value="주문번호">주문번호</option>
										<option value="이름">이름</option>
									</select>
								</div>
								<!-- 검색카테고리 그리드 끝 -->
								<!-- 검색창 -->
								<div class="column">
									<div class="ui search">
										<div class="ui icon input">
											<input class="prompt" type="text" placeholder="검색" value=""
												id="searchText"> <i class="search icon"
												id="searchIcon"></i>
										</div>
									</div>
									<!-- search -->
								</div>
								<!-- column -->
							</div>
							<!-- grid -->
						</div>
						<!-- column -->
					</div>
					<!-- two column grid -->

					<div class="divContent">
						<form action="" id="QAContents">
							<!---------------- 테이블 ------------------>
							<table class="ui compact celled definition selectable table">
								<thead class="full-width">
									<tr>
										<th class="collapsing">
											<div class="ui fitted checkbox">
												<input type="checkbox" value="${p.product_no }"
													class='checkAll'> <label></label>
											</div>
										</th>

										<th>질문번호</th>
										<th>회원번호</th>
										<th>질문타입</th>
										<th>질문날짜</th>
										<th>질문내용</th>
										<th>답변날짜</th>
										<th>답변내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="o" varStatus="status">
										<tr>
											<td class="collapsing">
												<div class="ui fitted checkbox">
													<input type="checkbox" name="order_index"
														value="${status.index }" class='productCheck'> <label></label>
												</div> <input type="hidden" name="q_no" value="${o.q_no }">
											</td>

											<td id="q_no" onclick="selectProduct(${o.q_no })">${o.q_no}</td>
											<td id="member_no" onclick="selectProduct(${o.q_no })">${o.member_no }</td>
											<td id ="q_type" onclick="selectProduct(${o.q_no })">${o.q_type }</td>
											<td id="q_date" onclick="selectProduct(${o.q_no })">${o.q_date }</td>
											<td id="q_contents" onclick="selectProduct(${o.q_no })">${o.q_contents }</td>
											<td id="a_date" onclick="selectProduct(${o.q_no })">${o.a_date }</td>
											<%-- <td onclick="selectProduct(${o.q_no })">${o.a_contents }</td> --%>
											<td id="answer">
												<div class="ui input" >
  													<input type="text" id="a_contents" placeholder="${o.a_contents }">
												</div>
											</td>
										
										</tr>
									</c:forEach>
								</tbody>
								<tfoot class="full-width">
									<tr>
										<th></th>
										<th colspan="8">
											<div class="ui right floated small labeled icon button"
												id="updateBtn">
												<i class="user icon"></i> 변경
											</div>
											<div class="ui small button" id="totalListBtn">전체조회</div>
										</th>
									</tr>
								</tfoot>
							</table>
						</form>
					</div>
</body>
</html>