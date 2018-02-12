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
<script type="text/javascript" src="js/insertProduct.js"></script>
<script type="text/javascript" src="js/adminSide.js"></script>
<script type="text/javascript">
	$(function(){		
		
	});
	
	function mpList(){
		location.href="mpList";
	}
	function mpEdit(no){
		location.href="mpEdit?no="+no;
	}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/memberList.css">
<link rel="stylesheet" href="css/productList.css">
<meta charset="UTF-8">
<title>관리자 - 상품 상세 </title>
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
				  <a class="section">Product</a>
				  <i class="right chevron icon divider"></i>
				<div class="active section">${product.p_name }</div>
				
				<div class="mainContent">
				<form class="ui form" action="writeProduct" method="get" >
					<div class="ui grid">
					
						<!-- 기본정보 -->
						<div class="ten wide column">
							<div class="field">
							    <label>제품명</label>
							    <input disabled="disabled" name="p_name" type="text" placeholder="제품명" value="${product.p_name }">
							</div>
							<div class="field">
							    <label>상세 정보</label>
							    <textarea disabled="disabled" name="description">${product.description }</textarea>
							</div>
						</div>
						
						<!-- 대표이미지 -->
						<div class="six wide column">
							<label>대표 이미지</label>
							<div class="ui special six doubling cards" id="mainImgDiv">
							  <div class="card" style="height:300px; width: 250px;">
							    <div class="blurring dimmable image">
							      <div class="ui dimmer">
							        <div class="content">
							          <div class="center">
							          <input type="file" name="" id="mainImgFile" style="display:none;"/>
							            <div class="ui inverted button" id="mainImgAdd">Edit</div>
							          </div>
							        </div>
							      </div>
							      <img src="<%=request.getContextPath()%>${mainProductIMG}" style="height:300px; width: 250px;" id="mainImgAttr">
							    </div>
							  </div>
							</div>
						</div>
						
						<!-- 브랜드/제조사/제조국/달력 -->
						<div class="four wide column">
							<div class="field">
								<label>브랜드</label>
								<input disabled="disabled" name="brand_name" type="text" value="${product.brand_name }">
							</div>
						</div>
						<div class="four wide column">
							<div class="field">
								<label>제조사</label>
								<input disabled="disabled" type="text" name="company" value="${product.company }" />
							</div>
						</div>
						<div class="four wide column">
							<div class="ui form">
								<div class="field">
									<label>제조국</label>
									<input disabled="disabled" type="text" name="producer" value="${product.producer }" />	
								</div>
							</div>
						</div>
						
				
						<!-- 달력 -->
						<div class="three wide column">
							<div class="field">
								<label>제조일</label>
										<fmt:parseDate value="${product.p_date }" pattern="yyyy-MM-dd HH:mm:ss" var="p_date"></fmt:parseDate>
										<fmt:formatDate value="${p_date }" pattern="YY/MM/dd" var="date"/>
								<input disabled="disabled" type="text" id="product_date" name="p_date" value="${date }">
						    </div>
						</div>
						
						
						<!-- 카테고리 분류 -->
						<div class="five wide column" id="category">
							<div class="field">
								<label>카테고리</label>
								<input disabled="disabled" type="text" id="category" name="category" value="${type.category_name}">
								
							</div>
						</div>
						<div class="five wide column" id="division">
							<div class="field">
								<label>중분류</label>
								<input disabled="disabled" type="text" id="division" name="division" value="${type.division_name}">
							</div>				
						</div>
						<div class="five wide column" id="section">
							<div class="field">
								<label>소분류</label>
								<input disabled="disabled" type="text" id="section" name="section" value="${type.section_name}">
							</div>
						</div>
						
						
						<!-- 이미지 -->
						<div class="sixteen wide column" id="divImages">		
							<div class="ui special four doubling cards" id="imgDiv">
								<c:forEach items="${subProductImages }" var="subImg">
								  <div class="card" style="height:100%; width: 100%;max-width:900px;max-height:1500px;">
								    <div class="blurring dimmable image">
								      <div class="ui dimmer">
								        <div class="content">
								          <div class="center">
								          <input type="file" name="" id="imgFile" style="display:none;"/>
								            <div class="ui inverted button" id="imgAdd">Add</div>
								          </div><!-- center -->
								        </div> <!-- content -->
								      </div> <!-- ui dimmer -->
								      <img src="<%=request.getContextPath()%>${subImg}" style="height:100%; width: 100%;max-width:900px;max-height:1500px;" id="imgAttr">
								    </div> <!-- image -->
								    <div class="extra content">
								      <a class="imgRemove">
								        <i class="remove icon"></i>
								        삭제
								      </a>
								    </div><!-- extra content -->
								  </div> <!-- card  -->
								</c:forEach>
							</div> <!-- doubling cards / imgDiv -->
						</div><!-- wide column -->
						
						
						
						<!-- 옵션 추가 삭제 -->
						<div class="thirteen wide column"></div>
						<div class="two wide column"></div>
					</div>
					
					<c:forEach var="o" items="${productOption }">
						<div class="ui grid" id="optionDiv">
						<div class="five wide column" id="option_name">
							<div class="field">
								<label>제품 이름</label>
								<input disabled="disabled" name="option_name" type="text" value="${o.option_name }"/>
							</div>
						</div>
						<div class="three wide column" id="option_price">
							<div class="field">
								<label>가격</label>
								<input disabled="disabled" name="option_price" type="text" value="${o.option_price }"/>
							</div>
						</div>
						<div class="three wide column" id="option_quantity">
							<div class="field">
								<label>재고</label>
								<input disabled="disabled" name="option_quantity" type="text" value="${o.option_quantity }"/>
							</div>
						</div>
						<div class="three wide column" id="option_volume">
							<div class="field">
								<label>용량</label>
								<input disabled="disabled" name="option_volume" type="text" value="${o.option_volume }"/>
							</div>
						</div>
						<div class="one wide column" id="option_remove"></div>
					</div>	
					
					</c:forEach>
					
					
					<div class="ui grid">	
						<div class="sixteen wide column">
							<div class="field">
							    <label>성분 정보</label>
							    <textarea disabled="disabled" name="ingredient">${product.ingredient }</textarea>
							</div>
						</div>
						
						
						<!-- 상품 최종 추가 취소 버튼 -->
						<div class="four column centered row">
							<div class="two wide column">
								<div class="ui button" id="mpList" onclick="mpList()">
									목록
								</div>
							</div>
							<div class="two wide column">
								<div class="ui button" id="mpEdit" onclick="mpEdit(${product.product_no})">
									수정
								</div>
							</div>
						</div>
					</div>
				</form>
 				</div><!-- main content -->
			</div><!--  pusher -->
	</div>
</div>
</body>
</html>