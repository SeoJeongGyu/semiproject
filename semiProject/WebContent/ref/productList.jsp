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
<script type="text/javascript" src="js/productList.js"></script>
<script type="text/javascript" src="js/adminSide.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link rel="stylesheet" href="css/memberList.css">
<link rel="stylesheet" href="css/productList.css">
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
				  <a class="section">Product</a>
				  <i class="right chevron icon divider"></i>
				<div class="active section">List</div>
				
				<div class="mainContent">
					<div class="ui grid">
					<!-- 카테고리 -->
					<div class="ten wide column" id="category">
						<select class="ui dropdown" id="cate" name="category_no" style="width: 200px;">
							<option value="">대분류</option>
							<c:forEach var="category" items="${categories }">
								<option value="${category.category_no}">${category.category_name }</option>
							</c:forEach>					
						</select>
						<select class="ui dropdown" id="divi" name="division_no" style="width: 200px;">
							<option value="">중분류</option>
						</select>
						<select class="ui dropdown" id="sect" name="section_no" style="width: 200px;">
							<option value="">소분류</option>
						</select>
					</div>
					<!--  - - - - - - - - - - - - - - - - - - - - - -  - - - - - - -  - - - - - - - - -->
				
						<!-- 검색카테고리 그리드 -->
					<div class="two wide column">
				    	<select name="searchField" id="searchField" class="ui fluid dropdown">
					      	<option value="제품명">제품명</option>
						</select>
				   	</div>	<!-- 검색카테고리 그리드 끝 -->
				   	<!-- 검색창 -->
				    <div class="two wide column">
						<div class="ui search">
						  <div class="ui icon input">
						    <input class="prompt" type="text" placeholder="검색" value="" id="searchText"> 
						    <i class="search icon"id="searchIcon"></i>
						  </div>
						</div><!-- search -->
					</div><!-- column -->
				</div><!-- ui grid -->
				
				
				<!---------------- 테이블 ------------------>
				<table class="ui compact celled definition selectable table">
				  <thead class="full-width">
				    <tr>
				      <th class="collapsing">
				      	<div class="ui fitted checkbox">
				          <input type="checkbox" value="${p.product_no }" class='checkAll'> <label></label>
				        </div>
				      </th>
				      <th>대표이미지</th>
				      <th>카테고리</th>
				      <th>제품명</th>
				      <th>제품번호</th>
				      <th>가격</th>
				      <th>재고현황</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${pdto }" var="p" >
				    <tr>
				      <td class="collapsing">
				        <div class="ui fitted checkbox">
				          <input type="checkbox" value="${p.product_no }" class='productCheck'> <label></label>
				        </div>
				      </td>
					  <td onclick="selectProduct(${p.product_no})">
					  	<img src="<%=request.getContextPath()%>/upload${p.img_path}"
                                    onclick="selectProduct(${p.product_no})" style="width: 100px;height: 120px;">
					  </td>
					  <td onclick="selectProduct(${p.product_no})">${p.category_name } > ${p.division_name } > ${p.section_name}</td>
					  <td onclick="selectProduct(${p.product_no})">${p.p_name }</td>
					  <td onclick="selectProduct(${p.product_no})">${p.product_no}</td>
					  <td onclick="selectProduct(${p.product_no})">${p.option_price }</td>
					  <td>
						  <select class="ui dropdown" id="option_quantity" name="option_quantity" style="width: 200px;">
								<option value="">재고현황</option>
									<c:forEach var="q" items="${selectQuantity }">
										<c:if test="${p.product_no eq q.o_product_no }">
											<option disabled="disabled" value="${q.product_no}">${q.option_name } : ${q.option_quantity }</option>
										</c:if>
									</c:forEach>
							</select>
					  </td>
					  
				    </tr>
				  </c:forEach>
				
				  </tbody>
				  <tfoot class="full-width">
				  	 <tr>
				      <th></th>
				      <th colspan="8">
				      	 <div class="ui right floated small labeled icon button" id="insertBtn" onclick="insertBtn()">
						   <i class="user icon"></i>
						   추가
						 </div>
						 <div class="ui right floated small labeled icon button" id="btnRemove">
						   <i class="user icon"></i>
						   삭제
						 </div>
						 <div class="ui small button" id="btnTotalList">
						   전체조회
						 </div>
				      </th>
				    </tr>
				  </tfoot>
				</table>
				
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
				</div><!-- pagination menu -->
 				</div><!-- main content -->
			</div><!--  pusher -->
	</div>
</div>
</body>
</html>