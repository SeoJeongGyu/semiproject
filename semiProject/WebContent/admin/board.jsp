<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script type="text/javascript">
	console.log('${requestScope.page1}');
	$(document).ready(function() {
	  $('select').material_select();
	  if('requestScope.notices'>0){
	      alert("공지성공");
	  }
	});
	function freeboard(){
	    location.href="<%=request.getContextPath()%>/boardlist.do?cmd=freeboard";
	}
	function sell(){
	    location.href="<%=request.getContextPath()%>/boardlist.do?cmd=sell";
	}
	function review(){
	    location.href="<%=request.getContextPath()%>/boardlist.do?cmd=review";
	}
	function buy(){
	    location.href="<%=request.getContextPath()%>/boardlist.do?cmd=buy";
	}
	function notices(){
	    location.href="<%=request.getContextPath()%>/boardlist.do?cmd=notices";
	}
</script>
 <h4 class="truncate">게시판 관리</h4>
  <c:choose>
  			<c:when test="${requestScope.page1==null}">
				  <ul id="tabs-swipe-demo" class="tabs">
				    <li class="tab col s3" onclick="notices()"><a class="active" href="#notices">공지사항</a></li>
				    <li class="tab col s3" onclick="review()"><a href="#review">리뷰게시판</a></li>
				    <li class="tab col s3" onclick="freeboard()"><a href="#freeboard">자유게시판</a></li>
				    <li class="tab col s3" onclick="sell()"><a href="#sell">팝니다게시판</a></li>
				    <li class="tab col s3" onclick="buy()"><a href="#buy">삽니다게시판</a></li>
				 </ul>
				 <div id="review">
					<jsp:include page="review.jsp"></jsp:include>
				 </div>
			 </c:when>
			<c:when test="${requestScope.page1=='review'}">
				 <ul id="tabs-swipe-demo" class="tabs">
				    <li class="tab col s3" onclick="notices()"><a href="#notices">공지사항</a></li>
				    <li class="tab col s3" onclick="review()"><a class="active" href="#review">리뷰게시판</a></li>
				    <li class="tab col s3" onclick="freeboard()"><a href="#freeboard">자유게시판</a></li>
				    <li class="tab col s3" onclick="sell()"><a href="#sell">팝니다게시판</a></li>
				    <li class="tab col s3" onclick="buy()"><a href="#buy">삽니다게시판</a></li>
				 </ul>
				 <div id="review">
					<jsp:include page="review.jsp"></jsp:include>
				 </div>
			</c:when>
			<c:when test="${requestScope.page1=='freeboard'}">
				 <ul id="tabs-swipe-demo" class="tabs">
				 	<li class="tab col s3" onclick="notices()"><a href="#notices">공지사항</a></li>
				    <li class="tab col s3" onclick="review()"><a href="#review">리뷰게시판</a></li>
				    <li class="tab col s3" onclick="freeboard()"><a class="active" href="#freeboard">자유게시판</a></li>
				    <li class="tab col s3" onclick="sell()"><a href="#sell">팝니다게시판</a></li>
				    <li class="tab col s3" onclick="buy()"><a href="#buy">삽니다게시판</a></li>
				 </ul>
				<div id="freeboard">
				<jsp:include page="freeboard.jsp"></jsp:include>
				</div>
			</c:when>
			<c:when test="${requestScope.page1=='sell'}">
				<ul id="tabs-swipe-demo" class="tabs">
					<li class="tab col s3" onclick="notices()"><a href="#notices">공지사항</a></li>
				    <li class="tab col s3" onclick="review()"><a href="#review">리뷰게시판</a></li>
				    <li class="tab col s3" onclick="freeboard()"><a href="#freeboard">자유게시판</a></li>
				    <li class="tab col s3" onclick="sell()"><a class="active" href="#sell">팝니다게시판</a></li>
				    <li class="tab col s3" onclick="buy()"><a href="#buy">삽니다게시판</a></li>
				 </ul>
				<div id="sell">
				<jsp:include page="sell.jsp"></jsp:include>
				</div>
			</c:when>
			<c:when test="${requestScope.page1=='buy'}">
				<ul id="tabs-swipe-demo" class="tabs">
					<li class="tab col s3" onclick="notices()"><a href="#notices">공지사항</a></li>
				    <li class="tab col s3" onclick="review()"><a href="#review">리뷰게시판</a></li>
				    <li class="tab col s3" onclick="freeboard()"><a href="#freeboard">자유게시판</a></li>
				    <li class="tab col s3" onclick="sell()"><a href="#sell">팝니다게시판</a></li>
				    <li class="tab col s3" onclick="buy()"><a class="active" href="#buy">삽니다게시판</a></li>
				 </ul>
				<div id="buy">
				<jsp:include page="buy.jsp"></jsp:include>
				</div>
			</c:when>
			<c:when test="${requestScope.page1=='notices'}">
				<ul id="tabs-swipe-demo" class="tabs">
					<li class="tab col s3" onclick="notices()"><a class="active" href="#notices">공지사항</a></li>
				    <li class="tab col s3" onclick="review()"><a href="#review">리뷰게시판</a></li>
				    <li class="tab col s3" onclick="freeboard()"><a href="#freeboard">자유게시판</a></li>
				    <li class="tab col s3" onclick="sell()"><a href="#sell">팝니다게시판</a></li>
				    <li class="tab col s3" onclick="buy()"><a href="#buy">삽니다게시판</a></li>
				 </ul>
				<div id="notices">
				<jsp:include page="notices.jsp"></jsp:include>
				</div>
			</c:when>
			<c:when test="${requestScope.page1=='noticesInsert'}">
				<ul id="tabs-swipe-demo" class="tabs">
					<li class="tab col s3" onclick="notices()"><a class="active" href="#notices">공지사항</a></li>
				    <li class="tab col s3" onclick="review()"><a href="#review">리뷰게시판</a></li>
				    <li class="tab col s3" onclick="freeboard()"><a href="#freeboard">자유게시판</a></li>
				    <li class="tab col s3" onclick="sell()"><a href="#sell">팝니다게시판</a></li>
				    <li class="tab col s3" onclick="buy()"><a href="#buy">삽니다게시판</a></li>
				 </ul>
				<div id="noticesInsert">
				<jsp:include page="noticesInsert.jsp"></jsp:include>
				</div>
			</c:when>
			<c:when test="${requestScope.page1=='noticesOk'}">
				<ul id="tabs-swipe-demo" class="tabs">
					<li class="tab col s3" onclick="notices()"><a class="active" href="#notices">공지사항</a></li>
				    <li class="tab col s3" onclick="review()"><a href="#review">리뷰게시판</a></li>
				    <li class="tab col s3" onclick="freeboard()"><a href="#freeboard">자유게시판</a></li>
				    <li class="tab col s3" onclick="sell()"><a href="#sell">팝니다게시판</a></li>
				    <li class="tab col s3" onclick="buy()"><a href="#buy">삽니다게시판</a></li>
				 </ul>
				<div id="noticesOk">
				<jsp:include page="noticesOk.jsp"></jsp:include>
				</div>
			</c:when>
			<c:when test="${requestScope.page1=='noticesUpdate'}">
				<ul id="tabs-swipe-demo" class="tabs">
					<li class="tab col s3" onclick="notices()"><a class="active" href="#notices">공지사항</a></li>
				    <li class="tab col s3" onclick="review()"><a href="#review">리뷰게시판</a></li>
				    <li class="tab col s3" onclick="freeboard()"><a href="#freeboard">자유게시판</a></li>
				    <li class="tab col s3" onclick="sell()"><a href="#sell">팝니다게시판</a></li>
				    <li class="tab col s3" onclick="buy()"><a href="#buy">삽니다게시판</a></li>
				 </ul>
				<div id="noticesUpdate">
				<jsp:include page="noticesUpdate.jsp"></jsp:include>
				</div>
			</c:when>
			<%-- <c:otherwise>
				<jsp:include page="${requestScope.page}"></jsp:include>
			</c:otherwise> --%>
		</c:choose>
