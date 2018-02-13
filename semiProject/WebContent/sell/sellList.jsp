<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팝니다 게시판 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<script src="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.js"></script>
<script type="text/javascript" src="js/memberList.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/memberList.css">
<meta charset="UTF-8">
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
				<br>
				  <a class="section">팝니다 게시판</a>
				
				<div class="mainContent">
				
							
						<div class="column">
							<div class="ui four column right aligned grid">
								<!-- 칸맞추기...ㅠㅠ -->
								<div class="column"></div>
								<!-- 검색카테고리 그리드 -->
								<div class="column">
							    	<select name="searchField" id="searchField" class="ui fluid dropdown">
								      	<option value="제목">제목</option>
								      	<option value="작성자">작성자</option>
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
					      <th>모델명</th>
					      <th>제목</th>
					      <th>가격</th>
					      <th>작성자</th>
					    </tr>
					  </thead>
					 
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
</body>
</html>