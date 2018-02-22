<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
	  $('select').material_select();
	});
</script>
 <h4 class="truncate">게시판 관리</h4>
  <ul id="tabs-swipe-demo" class="tabs">
    <li class="tab col s3"><a class="active" href="#review">리뷰게시판</a></li>
    <li class="tab col s3"><a href="#freeboard">자유게시판</a></li>
    <li class="tab col s3"><a href="#qna">질문게시판</a></li>
    <li class="tab col s3"><a href="#sell">팝니다게시판</a></li>
    <li class="tab col s3"><a href="#buy">삽니다게시판</a></li>
  </ul>
  <div id="board"></div>
  <jsp:include page="/admin/review.jsp" />
  <jsp:include page="/admin/freeboard.jsp" />
  <jsp:include page="/admin/qna.jsp" />
  <jsp:include page="/admin/sell.jsp" />
  <jsp:include page="/admin/buy.jsp" />
 
