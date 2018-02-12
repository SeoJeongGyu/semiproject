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
<script type="text/javascript" src="js/adminSide.js"></script>
<script type="text/javascript" src="js/modifyProduct.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/memberList.css">
<link rel="stylesheet" href="css/productList.css">
<meta charset="UTF-8">
<title>관리자 - 상품 수정 </title>
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
					<form class="ui form" action="modifyProduct" method="get" >
					<input type="hidden" name="product_no" value="${product.product_no }" id="product_no" />
						<div class="ui grid">
						
							<!-- 기본정보 -->
							<div class="ten wide column">
								<div class="field">
								    <label>제품명</label>
								    <input name="p_name" type="text" value="${product.p_name }">
								</div>
								<div class="field">
								    <label>상세 정보</label>
								    <textarea name="description">${product.description }</textarea>
								</div>
							</div>
							
							<!-- 대표이미지 -->
							<div class="six wide column">
								<label>대표 이미지</label>
								<div class="ui special six doubling cards" id="mainImgDiv">
								  <div class="card" style="height:250px; width: 50%;">
								    <div class="blurring dimmable image">
								      <div class="ui dimmer">
								        <div class="content">
								          <div class="center">
								          <input type="file" name="" id="mainImgFile" style="display:none;"/>
								            <div class="ui inverted button" id="mainImgAdd">Edit</div>
								          </div>
								        </div>
								      </div>
								      <img src="<%=request.getContextPath() %>${mainImage}" style="height:250px; width: 100%;" id="mainImgAttr" class="images">
								    </div>
								  </div>
								</div>
							</div>
							
							<!-- 브랜드/제조사/제조국/달력 -->
							<div class="four wide column">
								<div class="field">
									<label>브랜드</label>
									<input type="text" name="brand_name" placeholder="제조사" value="${product.brand_name }"/>
								</div>
							</div>
							<div class="four wide column">
								<div class="field">
									<label>제조사</label>
									<input type="text" name="company" placeholder="제조사" value="${product.company }"/>
								</div>
							</div>
							<div class="four wide column">
								<div class="ui form">
									<div class="field">
										<label>제조국</label>
										<select class="ui dropdown" name="producer">
										  <option value="${product.producer }">${product.producer}</option>
									      <option value="Austria">Austria</option>
									      <option value="China">China</option>
									      <option value="France">France</option>
									      <option value="Germany">Germany</option>
									      <option value="HongKong">HongKong</option>
									      <option value="Italy">Italy</option>
									      <option value="Japan">Japan</option>
									      <option value="Korea">Korea</option>
									      <option value="Singapore">Singapore</option>		
									      <option value="UnitedKingdom">UnitedKingdom</option>
									      <option value="UnitedStates">UnitedStates</option>
										</select>
									</div>
								</div>
							</div>
							
							<!-- 달력 -->
							<div class="three wide column">
								<div class="field">
									<label>제조일</label>
									<div class="ui icon input">
										<fmt:parseDate value="${product.p_date }" pattern="yyyy-MM-dd HH:mm:ss" var="p_date"></fmt:parseDate>
										<fmt:formatDate value="${p_date }" pattern="YY/MM/dd" var="date"/>
									   <input type="text" id="product_date" name="p_date" value="${date}">
									   <i class="calendar icon"></i>
								    </div>
							    </div>
							</div>
							
							
							<!-- 카테고리 분류 -->
							<div class="five wide column" id="category">
								<div class="field">
									<label>카테고리</label>
									<select class="ui dropdown" id="cate" name="category_no">
										<option value="${type.category_no}">${type.category_name}</option>
										<c:forEach var="category" items="${categories }">
										<c:if test="${type.category_no != category.category_no}">
											<option value="${category.category_no}" >${category.category_name }</option>
										</c:if>
										</c:forEach>					
									</select>
								</div>
							</div>
							<div class="five wide column" id="division">
								<div class="field">
									<label>　</label>
									<select class="ui dropdown" id="divi" name="division_no">
										<option value="${type.division_no }">${type.division_name}</option>
									</select>
								</div>				
							</div>
							<div class="five wide column" id="section">
								<div class="field">
									<label>　</label>
									<select class="ui dropdown" id="sect" name="type_no">
										<option value="${type.section_no }">${type.section_name}</option>
									</select>
								</div>
							</div>
							
							
							<div class="sixteen wide column" id="divImages">		
								<div class="ui special four doubling cards" id="imgDiv">
									<c:forEach items="${subImages }" var="subImg">
									  <div class="card">
									    <div class="blurring dimmable image">
									      <div class="ui dimmer">
									        <div class="content">
									          <div class="center">
									          <input type="file" name="" id="imgFile" style="display:none;"/>
									            <div class="ui inverted button" id="imgAdd">Add</div>
									          </div><!-- center -->
									        </div> <!-- content -->
									      </div> <!-- ui dimmer -->
									      <img src="<%=request.getContextPath()%>${subImg}" style="height: 400px;" id="imgAttr" class="images">
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
							<div class="two wide column">
								<div class="ui button" id="addOption">
									옵션 추가
								</div>
							</div>
						</div>
						
						<c:forEach var="o" items="${productOption }">
							<div class="ui grid" id="optionDiv">
							<div class="five wide column" id="option_name">
								<div class="field">
									<label>제품 이름</label>
									<input name="option_name" type="text" value="${o.option_name }"/>
								</div>
							</div>
							<div class="three wide column" id="option_price">
								<div class="field">
									<label>가격</label>
									<input name="option_price" type="text" value="${o.option_price }"/>
								</div>
							</div>
							<div class="three wide column" id="option_quantity">
								<div class="field">
									<label>재고</label>
									<input name="option_quantity" type="text" value="${o.option_quantity }"/>
								</div>
							</div>
							<div class="three wide column" id="option_volume">
								<div class="field">
									<label>용량</label>
									<input name="option_volume" type="text" value="${o.option_volume }"/>
								</div>
							</div>
							<div class="one wide column" id="option_remove" onclick="option_remove()">
								<div class="field">
									<label>　</label>
									<i class="big remove icon"></i>
								</div>
							</div>
						</div>	
						
						</c:forEach>
						
						<div class="ui grid">	
							<div class="sixteen wide column">
								<div class="field">
								    <label>성분 정보</label>
								    <textarea name="ingredient">${product.ingredient }</textarea>
								</div>
							</div>
							
							<!-- 상품 최종 추가 취소 버튼 -->
							<div class="four column centered row">
								<div class="two wide column">
									<div class="ui button" id="mpList" onclick="mpList()">
										취소
									</div>
								</div>
								<div class="two wide column">
									<button class="ui button" id="modifyBtn">
										완료
									</button>
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