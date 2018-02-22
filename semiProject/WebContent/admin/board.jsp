<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
	  $('select').material_select();
	});
</script>
 <h4 class="truncate">게시판 관리</h4>
  <ul id="tabs-swipe-demo" class="tabs">
    <li class="tab col s3"><a class="active" href="#freeboard">리뷰게시판</a></li>
    <li class="tab col s3"><a href="#test-swipe-2">자유게시판</a></li>
    <li class="tab col s3"><a href="#test-swipe-3">질문게시판</a></li>
    <li class="tab col s3"><a href="#test-swipe-4">팝니다게시판</a></li>
    <li class="tab col s3"><a href="#test-swipe-4">삽니다게시판</a></li>
  </ul>
  <jsp:include page="<%=request.getContextPath()%>/admin/freeboard.jsp" />
  <div id="test-swipe-2" class="col s12">Test 2</div>
  <div id="test-swipe-3" class="col s12">Test 3</div>
  <div id="test-swipe-4" class="col s12">Test 4</div>
