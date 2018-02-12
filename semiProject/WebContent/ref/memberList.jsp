<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<script src="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.js"></script>
<script type="text/javascript" src="js/memberList.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/memberList.css">
<meta charset="UTF-8">
<title>관리자 - 회원 목록 </title>
</head>
<body>
<div class="ui top attached demo menu">
  <a class="item" id="btnMenu">
    <i class="sidebar icon"></i>
    Menu
  </a>
</div>
<div class="ui bottom attached segment pushable">
	<%@include file="../ref/adminSide.jsp" %>
			<div class="pusher">
			  <!-- Site content !-->
				<div class="ui big breadcrumb">
				  <a class="section">Member</a>
				  <i class="right chevron icon divider"></i>
				<div class="active section">List</div>
				
				<div class="mainContent">
					<div class="ui two column right aligned  grid">
			
						<!-- 달력 -->
						<div class="column" >
							<div class="ui four column grid form">
								<!-- calendar start -->
								<div class="column" id="clCalendar">
									<div class="ui form">
									    <div class="two fields">
									      <div class="field">
									        <div class="ui calendar" id="rangestart">
									          <div class="ui input left icon">
									            <i class="calendar icon"></i>
									            <input type="text" placeholder="Start">
									          </div>
									        </div>
									      </div>
									      <div class="field">
									        <div class="ui calendar" id="rangeend">
									          <div class="ui input left icon">
									            <i class="calendar icon"></i>
									            <input type="text" placeholder="End">
									          </div>
									        </div>
									      </div>
									    </div>
									  </div>
						    	</div>
						    	<!-- calendar end -->
								<input type="button" value="검색" id="calBtn" class="ui button"/>
							</div>
						</div>
					
						<div class="column">
							<div class="ui four column right aligned grid">
								<!-- 칸맞추기...ㅠㅠ -->
								<div class="column"></div>
								<!-- 검색카테고리 그리드 -->
								<div class="column">
							    	<select name="searchField" id="searchField" class="ui fluid dropdown">
								      	<option value="아이디">아이디</option>
								      	<option value="이름">이름</option>
									</select>
						    	</div>	<!-- 검색카테고리 그리드 끝 -->
						    	<!-- 검색창 -->
							    <div class="column">
									<div class="ui search">
									  <div class="ui icon input">
									    <input class="prompt" type="text" placeholder="검색" value="" id="searchText"> 
									    <i class="search icon"id="searchIcon"></i>
									  </div>
									</div><!-- search -->
								</div><!-- column -->
							</div><!-- grid -->
						</div><!-- column -->
					</div><!-- two column grid -->
					
					<div class="divContent">
					<form action="" id="memberNo">
					<table class="ui compact celled definition selectable table mainTable">
					  <thead class="full-width">
					    <tr>
					      <th class="collapsing">
					      	<div class="ui fitted checkbox">
					          <input type="checkbox" value="${m.member_no }" class='checkAll'> <label></label>
					        </div>
					      </th>
					      <th>회원번호</th>
					      <th>아이디</th>
					      <th>성명</th>
					      <th>이메일</th>
					      <th>전화번호</th>
					      <th>가입날짜</th>
					      <th>회원등급</th>
					    </tr>
					  </thead>
					  <tbody>
					
					  <c:forEach items="${list }" var="m" >
					    <tr>
					      <td class="collapsing">
					        <div class="ui fitted checkbox">
					          <input type="checkbox" value="${m.member_no }" class='memberCheck'> 
					          <label></label>
							</div>
					      </td>
						  <td onclick="selectMember(${m.member_no})">${m.member_no}</td>
						  <td onclick="selectMember(${m.member_no})">${m.id }</td>
						  <td onclick="selectMember(${m.member_no})">${m.name }</td>
						  <td onclick="selectMember(${m.member_no})">${m.email }</td>
						  <td onclick="selectMember(${m.member_no})">${m.phone }</td>
						  <td onclick="selectMember(${m.member_no})">
						  	<fmt:formatDate value="${m.regdate}" type="date" pattern="YY/MM/dd" />
						  </td>
						  <td onclick="selectMember(${m.member_no})">
						  	<c:set value="${fn:trim(m.degree)}" var="degree"></c:set>
						  	<c:choose>
						  		<c:when test="${degree eq 'D'}">작은언니</c:when>
						  		<c:when test="${degree eq 'C'}">큰언니</c:when>
						  		<c:when test="${degree eq 'B'}">왕언니</c:when>
						  	</c:choose>
						  </td>
					    </tr>
					  </c:forEach>
					  </tbody>
					  <tfoot class="full-width">
					  	 <tr>
					      <th></th>
					      <th colspan="8">
					      	 <div class="ui right floated small labeled icon button" id="btnRemove">
							   <i class="user icon"></i>
							   회원삭제
							 </div>
							 <div class="ui small button" id="btnTotalList">
							   전체조회
							 </div>
					      </th>
					    </tr>
					  </tfoot>
					</table>
					</form>
					 <div class="ui right floated pagination menu">
					   <c:if test="${criteria.prev==true}">
						   <a class="icon item" href="${requestTitle}?pno=${criteria.startPage-10}&s=${s}&e=${e}&name=${name}">
						     <i class="left chevron icon"></i>
						   </a>
					   </c:if>
					   <c:forEach begin="${criteria.startPage}" end="${criteria.endPage}" var="index">
						   <a class="item" href="${requestTitle}?pno=${index}&s=${s}&e=${e}&name=${name}">${index}</a>
					   </c:forEach>
					   <c:if test="${criteria.next==true }">
						   <a class="icon item" href="${requestTitle}?pno=${criteria.endPage+1}&s=${s}&e=${e}&name=${name}">
						     <i class="right chevron icon"></i>
						   </a>
					   </c:if>
					 </div><!--pagination -->
					</div>
 				</div>
			</div><!--  pusher -->
	</div>
</div>
</body>
</html>