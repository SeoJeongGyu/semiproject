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
<script type="text/javascript" src="js/orderList.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link
	href="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/memberList.css">
<meta charset="UTF-8">
<title>관리자 - 회원 주문</title>
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
				<a class="section">Order</a> <i class="right chevron icon divider"></i>
				<div class="active section">List</div>

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
						<form action="" id="memberNo">
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

										<th>주문날짜</th>
										<th>주문번호</th>
										<th>주문내역</th>
										<th>이름</th>
										<th>구매금액</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="o" varStatus="status">
										<tr>
											<td class="collapsing">
												<div class="ui fitted checkbox">
													<input type="checkbox" name="order_index" value="${status.index }"
														class='productCheck'"> <label></label>
												</div>
												<input type="hidden" name="order_no" value="${o.order_no }">
											</td>
											
											<td onclick="selectProduct(${o.order_no })">${o.order_date}</td>
											<td onclick="selectProduct(${o.order_no })">${o.order_no }</td>
											<td onclick="selectProduct(${o.order_no })">${o.p_name }(${o.p_amount})개</td>
											<td onclick="selectProduct(${o.order_no })">${o.name }</td>
											<td onclick="selectProduct(${o.order_no })">${o.payment_pay }</td>
											
											<td><select class="ui dropdown" id="option_quantity" name="order_status" style="width: 200px;">
													<option value="${o.order_status }">${o.order_status }</option>
													<option value="결제완료">결제완료</option>
													<option value="배송준비중">배송준비중</option>
													<option value="배송중">배송중</option>
													<option value="배송완료">배송완료</option>
													<option value="교환완료">교환완료</option>
													<option value="환불완료">환불완료</option>
											</select>
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